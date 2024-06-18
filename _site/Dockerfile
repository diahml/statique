# Gunakan image dasar dari Ruby
FROM ruby:3.2

# Tambahkan zona waktu
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata
RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Setel direktori kerja dalam container
WORKDIR /usr/src/app

# Salin file Gemfile dan Gemfile.lock ke direktori kerja
COPY . .

# Verbose Logging
RUN bundle install --verbose

# Ekspose port yang akan digunakan oleh Jekyll
EXPOSE 8080

# Setel variabel lingkungan untuk port
ENV PORT 8080
ENV TZ=Asia/Jakarta

# Perintah untuk menjalankan Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "8080"]