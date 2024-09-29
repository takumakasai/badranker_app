# -----------------------------------
# Nuxt.js環境構築用のDockerfile
# -----------------------------------
# ベースにするイメージ
# FROM node:16-alpine3.14
FROM node:18.19.1-alpine3.19

# 作業用ディレクトリ
WORKDIR /var/www/html

# 必要なパッケージをインストール
RUN apk add --update \
    bash \
    curl
RUN npm update -g npm

# ネットワーク設定
EXPOSE 3000
ENV HOST 0.0.0.0