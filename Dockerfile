# Gunakan image dasar dari Ruby
FROM ruby:2.7

# Setel direktori kerja dalam container
WORKDIR /usr/src/app

# Salin file Gemfile dan Gemfile.lock ke direktori kerja
COPY Gemfile Gemfile.lock ./

# Instal dependensi yang tercantum di Gemfile
RUN bundle install

# Salin semua file dari direktori lokal ke direktori kerja dalam container
COPY . .

# Buat volume untuk caching bundler dependencies
VOLUME /usr/src/app/vendor/bundle

# Buat folder untuk output Jekyll
RUN mkdir -p /usr/src/app/_site

# Verbose Logging
RUN bundle install --verbose

# Ekspose port yang akan digunakan oleh Jekyll
EXPOSE 8080

# Setel variabel lingkungan untuk port
ENV PORT 8080

# Perintah untuk menjalankan Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "8080"]