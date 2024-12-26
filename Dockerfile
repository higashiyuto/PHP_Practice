# ベースイメージとしてPHPを使用
FROM php:8.2-apache

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    mysql-client \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-install mysqli gd

# ドキュメントルートを設定
WORKDIR /var/www/html

# ホストからコンテナにファイルをコピー
COPY ./app /var/www/html

# ポート80を公開
EXPOSE 80
