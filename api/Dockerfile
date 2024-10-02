#-----------------------------------
# Ruby on Rails環境構築用のDockerfile
# -----------------------------------
# ベースにするイメージ
FROM ruby:3.2.0
# RailsのインストールやDBへの接続に必要なパッケージをインストール（今回はPostgreSQLを使用する）
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
# コンテナ内にアプリ用のディレクトリを作成
RUN mkdir /badranker
# 作成したディレクトリを作業用ディレクトリとして設定
WORKDIR /badranker
# ローカルのGemfileとGemfile.lockをコンテナに配置
# ADD Gemfile /badranker/Gemfile
# ADD Gemfile.lock /badranker/Gemfile.lock
COPY Gemfile /badranker/Gemfile
COPY Gemfile.lock /badranker/Gemfile.lock
# コンテナ内にコピーしたGemfileのbundle install
RUN bundle install
# ローカルのファイルをコンテナに配置
COPY . /badranker