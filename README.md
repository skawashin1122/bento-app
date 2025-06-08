# bento-app
振徳高校の翔太くん－お弁当注文Webアプリ

## .env
MYSQL_HOST=db

MYSQL_ROOT_PASSWORD=P@ssw0rd

MYSQL_USER=user

MYSQL_PASSWORD=password

MYSQL_DB=bento_app_db


## 実行方法
1. Docker Desktopがインストールされていることを確認してください。

2. ターミナルでプロジェクトルートディレクトリに移動し、以下のコマンドを実行します。

docker-compose up --build
  *  --buildオプションは、Dockerfileが変更された場合や、初回起動時にイメージをビルドするために必要です。
  *  初回起動時は、MySQLイメージのダウンロードやデータベースの初期化に時間がかかる場合があります。

3. ブラウザでアクセスします。
  *  Dockerコンテナが正常に起動すれば、以下のURLでアクセスできます。

http://localhost:5000