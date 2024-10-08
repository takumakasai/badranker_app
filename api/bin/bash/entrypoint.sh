#!/bin/bash

# サーバー起動前に古いPIDファイルを削除
rm -f /badranker/tmp/pids/server.pid

# データベースのマイグレーションを実行
# bundle exec rails db:migrate

# Railsサーバーを起動
bundle exec rails s -b 0.0.0.0 -p 10001
