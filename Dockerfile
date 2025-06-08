# Pythonの公式イメージをベースにする
FROM python:3.9-slim-buster

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係をインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションのコードをコピー
COPY app/ .

# Flaskアプリケーションがリッスンするポート
EXPOSE 5000

# アプリケーションを実行
# GunicornなどのWSGIサーバーを使うことも推奨されますが、開発・学習用途のためFlask標準サーバーで起動
CMD ["flask", "run", "--host", "0.0.0.0"]