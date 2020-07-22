# README

## アプリ名
### PicTag

## 概要
Instagramのような写真投稿アプリです。<br>
アカウントを作成し、投稿、投稿閲覧、いいね&コメントをする事ができる。
投稿には任意の数タグをつけることができ、特定のタグのついた投稿のみを閲覧したり、人気のタグを確認したりすることができる。

## 制作背景
私は新しいものや流行のものを見聞きするのが好きで、SNS上でトレンドを探すのが趣味でもある。
しかし、若者が普段利用するツイッターやインスタではハッシュタグという機能はあるものの、あまり有効に活用されていないと私は感じた。そこでもっとタグ付けに重点をおいたアプリを制作するに至った。タグのランキングなどを作ることで流行がひと目で分かり、私のような流行りに敏感な若者のニーズに答えれるのでは？と考えた。
自分たちがよく利用するようなSNSを模倣することで、利用者の視点から普段感じる「こんな機能あったらいいな」を自分で作れるようになりたいと思った。また、そのようなアプリケーションがどのようにして作られているか、どんな工夫が施されているか、利用者のニーズにどう応えていくかなど、制作の内側に立って考え、アプリケーションの製作者として実際の現場で大きな力になるようなスキルを身につけたいと感じた。

## DEMO
### ログイン/新規登録画面
![ログイン](https://user-images.githubusercontent.com/61592505/86577909-ee868300-bfb5-11ea-832c-15220d641794.png)
![新規登録](https://user-images.githubusercontent.com/61592505/86578229-6f457f00-bfb6-11ea-9732-2dfbe130f09f.png)

### トップページ(投稿一覧/タグ使用数ランキング)
トップページには投稿一覧が表示されている。
![NEW POSTS](https://user-images.githubusercontent.com/61592505/86578479-d400d980-bfb6-11ea-86b1-cd666c984250.gif)
上部のタブ切り替えでタグの使用数ランキングを表示することができる。
![TAG RANKING](https://user-images.githubusercontent.com/61592505/86584203-83da4500-bfbf-11ea-8135-26d39b5eccfa.gif)

### サイドバー
サイドバーには各ページへのリンクが表示されている。
- CREATE A POST(新規投稿)
- MY POSTS(自分の投稿一覧)
- MY LIKES(自分のいいねした投稿一覧)
- EDIT ACCOUNT(アカウント情報編集)
- LOG OUT(ログアウト) 
<br>
サイドバー<br>
<a href="サイドバー"><img src="https://user-images.githubusercontent.com/61592505/86588435-a2900a00-bfc6-11ea-9737-f6b7e6a2e490.png" width="300px;" /></a>
  <br>
未ログイン時には表示が変わる。<br>
<a href="未ログイン"><img src="https://user-images.githubusercontent.com/61592505/86587745-2b0dab00-bfc5-11ea-9e68-750a2309bf6a.png" width="300px;" /></a>

### 新規投稿(写真選択/タグ付)
写真を選択すると、プレビューが表示される
![プレビュー](https://user-images.githubusercontent.com/61592505/86586917-b0905b80-bfc3-11ea-8f14-e183b729647c.gif)
タグ入力時にカンマ区切りすることで、タグを複数個紐づけることができる。
![タグ入力](https://user-images.githubusercontent.com/61592505/86587529-be92ac00-bfc4-11ea-8e13-a01872fc2220.png)
![タグ表示](https://user-images.githubusercontent.com/61592505/86587667-044f7480-bfc5-11ea-8b87-0da8fbbd6f51.png)

### いいね機能
ハートマークのボタンを押すと任意の投稿に「いいね」をすることができる。もう一度押す事で取り消しも可能。
![いいね](https://user-images.githubusercontent.com/61592505/86588023-d0c11a00-bfc5-11ea-8493-f0058ab2cebb.gif)

### コメント機能
吹き出しマークのボタンを押すと投稿詳細ページに飛び、コメントを閲覧・投稿することができる。
![コメント](https://user-images.githubusercontent.com/61592505/86588924-99ec0380-bfc7-11ea-8a8d-83a0d29a5f73.gif)

## 実装予定
- いいね機能の非同期化
- フォロー機能、DM機能など
- 本番環境へのデプロイ

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