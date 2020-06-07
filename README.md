# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# PicTag DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :posts
- belongs_to :tag
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string|null: false|
|good|integer||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :post_tags
- has_many :tags,   through:  :post_tags
- has_many :comments

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- belongs_to :user
- has_many :post_tags
- has_many  :posts,  through:  :post_tags

## post_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user