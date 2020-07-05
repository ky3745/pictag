# README

## アプリ名
### PicTag

## 概要
Instagramのような写真投稿アプリです。
アカウントを作成し、投稿、投稿閲覧、いいね&コメントをする事ができる。
投稿には任意の数タグをつけることができ、特定のタグのついた投稿のみを閲覧したり、人気のタグを確認したりすることができる。

## 制作背景
自分がよく使用するようなSNSを模倣し、そのようなアプリケーションがどのようにして作られているか、どんな工夫が施されているかなど、制作の内側に立って考え、自己のスキルアップにつなげたいと思った。またタグをつけることに重きを置いたアプリケーションはまだあまり無いなと感じたため、このようなコンセプトを考えるに至った。

## DEMO

## 実装予定
いいね機能の非同期化
フォロー機能、DM機能など
本番環境へのデプロイ

## DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :posts
- belongs_to :tag
- has_many :comments
- has_many :likes

### postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :post_tags
- has_many :tags,   through:  :post_tags
- has_many :comments
- has_many :likes

### tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :user
- has_many :post_tags
- has_many  :posts,  through:  :post_tags

### post_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

### likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user