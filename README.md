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