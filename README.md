# README

# Bookfreak :book:
Bookfreakは本好きが集まる書評投稿サイトです。

推しの本をオススメしたり、次に買う本を探したりできます。

https://bookfreak.herokuapp.com/

![スクリーンショット 2022-02-22 0 31 49](https://user-images.githubusercontent.com/67816862/154985940-ea54bfea-f03d-4f9b-a5b7-22ecdb4808e6.png)

# 使い方

他の人のレビューを読むだけならログイン不要です。検索機能もあります。

ログイン後には、好きな本のレビューを投稿することができます。

また、気になる本はお気に入り登録できます。

今後買う本をリストアップしましょう。

![スクリーンショット 2022-02-22 0 45 19](https://user-images.githubusercontent.com/67816862/154987472-8920ccbf-1b15-44b0-8ca5-e4d8ba45f8a8.png)

また、楽天APIによって関連商品が自動的に表示されます。

![スクリーンショット 2022-02-26 3 29 47](https://user-images.githubusercontent.com/67816862/155782659-d90073da-dae4-4eec-9e63-99a30e51e75a.png)

# ER図

![スクリーンショット 2022-02-26 3 15 45](https://user-images.githubusercontent.com/67816862/155783833-a0bfab8e-3a65-4fbe-9c8f-e3d1fd789f09.png)

# 機能一覧

ログイン機能(Devise)

プロフィール機能

フォロー機能

書評の登録、閲覧、更新、削除、お気に入り登録など

画像投稿機能

検索機能(Ransack)

星1~5で評価(Raty.js, jQuery)

ページめくり機能(will_paginate)

楽天APIによる関連商品表示機能

ゲストユーザーログイン機能

# 使用した技術

## フロントエンド

HTML / CSS / Bootstrap / jQuery

## サーバーサイド

Ruby '2.7.5'

Ruby on Rails '6.1.4.4'

## インフラ

AWS / Mysql / Heroku / Docker / 

## その他

Rspec / Capybara / FactoryBot / Faker / Rubocop / 楽天API
