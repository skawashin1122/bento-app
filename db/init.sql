-- データベースが存在しない場合、作成します
CREATE DATABASE IF NOT EXISTS bento_app_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- データベースの使用
USE bento_app_db;

-- 現在の文字セット設定を確認（デバッグ用）
-- SELECT @@character_set_server, @@collation_server;

-- 商品マスタテーブル
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL COMMENT '商品名',
    price INT NOT NULL COMMENT '価格',
    description TEXT COMMENT '商品説明',
    image_url VARCHAR(500) DEFAULT NULL COMMENT '画像URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='商品マスタ';

-- 注文テーブル
CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注文日時',
    total_price INT NOT NULL COMMENT '合計金額',
    customer_name VARCHAR(255) COMMENT '顧客名',
    status VARCHAR(50) DEFAULT 'pending' COMMENT 'ステータス'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='注文テーブル';

-- 注文詳細テーブル
CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL COMMENT '注文ID',
    product_id INT NOT NULL COMMENT '商品ID',
    quantity INT NOT NULL COMMENT '数量',
    price_at_order INT NOT NULL COMMENT '注文時価格',
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='注文詳細テーブル';

-- 初期データ投入（商品マスタ）
-- INSERT IGNOREの代わりにON DUPLICATE KEY UPDATEを使用
INSERT INTO products (id, name, price, description, image_url) VALUES
(1, 'からあげ弁当', 550, 'みんな大好き、ジューシーなからあげ弁当！','karaage.jpg'),
(2, '鮭弁当', 600, '栄養満点、ふっくら鮭弁当！', 'sake.jpg'),
(3, 'ハンバーグ弁当', 650, 'ボリューム満点、手作りハンバーグ弁当！', 'hamburger.jpg'),
(4, '日替わり弁当', 500, '毎日変わる、店長のおすすめ弁当！', 'daily.jpg'),
(5, '野菜炒め弁当', 550, 'ヘルシー志向の方におすすめ、野菜炒め弁当！', 'vegetable.jpg')
ON DUPLICATE KEY UPDATE
name = VALUES(name),
price = VALUES(price),
description = VALUES(description);

-- 文字セット設定の確認クエリ（必要に応じてコメントアウト）
-- SHOW VARIABLES LIKE 'character%';
-- SHOW VARIABLES LIKE 'collation%';