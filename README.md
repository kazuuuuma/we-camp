# アプリケーション名
We CAMP

# アプリケーション概要
キャンプ場の投稿。
いきたいキャンプ場の検索とお気に入り追加。
マップでの場所確認。

# URL


# テスト用アカウント


# 利用方法
ログインなしで投稿一覧、検索機能は使用可能。
アカウント新規登録をすると、投稿・コメント・お気に入り機能

# 目指した課題解決
キャンプ場を探す人に向けたアプリケーション。
ユーザーがキャンプ情報を投稿でき、お気に入りのキャンプ場があれば、
詳細を確認でき、お気に入り登録が出来る。

# 洗い出した要件
##　投稿機能
ユーザーのキャンプ情報を投稿する。
キャンプ場名、画像、場所、詳細情報を登録できる。
##　お気に入り機能
他のユーザーの投稿したキャンプ場をお気に入り登録できる。
お気に入り一覧ページでお気に入り登録した投稿の一覧を表示できる。
##　都道府県別表示機能
キャンプ場を都道府県別に表示する。
任意の都道府県を選択し、一覧として該当する投稿を表示する。
##　マップ表示機能
投稿されたキャンプ情報の位置をマップで確認できる。
マップ上にマーカーで表示される。
## 条件検索機能
登録情報を選択して絞り込み検索がし、一覧として表示する。

# 工夫したポイント
キャンプ場の情報を詳細情報と一緒にマップ上で位置を確認できるようにした点。

# 実装予定の機能
条件検索機能

# 開発環境
## バックエンド
Ruby,Ruby on Rails
## フロントエンド
Html, Sass, JavaScript, jQuery, Ajax, Bootstrap
## データベース
MySQL
## 本番環境
Heroku
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode

# テーブル設計
## Usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| firstname          | string | null: false               |
| familyname         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| profile            | text   | null: false               |

### Association
- has_many :posts
- has_many :favorites
- has_many :reviews

## Favoriteテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| post     | references | foreign_key: true |


### Association
- belongs_to :user
- belongs_to :post

## Postsテーブル
| Column    | Type      | Options           |
| --------- | --------- | ----------------- |
| image     | text      | null: false       |
| campsite  | string    | null: false       |
| text      | text      |                   |
| place_id  | integer   | null: false       |
| toilet_id | integer   | null: false       |
| fire_id   | integer   | null: false       |
| river_id  | integer   | null: false       |
| gomi_id   | integer   | null: false       |
| water_id  | integer   | null: false       |
| price     | string    | null: false       |
| user      | reference | foreign_key: true |

### Association
- belongs_to :user
- has_many :favorites
- has_many :post_tags
- has_many :reviews

## Post_tagテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| post     | references | foreign_key: true |
| tags     | references | foreign_key: true |

### Association
- belongs_to :post
- belongs_to :tag

## Tagsテーブル
| Column | Type   | Options |
| ------ | ------ | ------- |
| name   | string |         |

### Association
- has_many :post_tags

## Reviewsテーブル
| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| comment   | string     | null: false       |
| image     | text       |                   |
| visit_day | string     |                   |
| user      | references | foreign_key: true |
| post      | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

# ローカルでの動作方法
