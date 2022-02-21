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

# ER図

![名称未設定](https://user-images.githubusercontent.com/67816862/155001311-e4af7edb-f618-46b4-8a27-8583875eb3e7.jpg)

# 機能一覧

ログイン機能(Devise)

プロフィール機能

書評の登録、閲覧、更新、削除、お気に入り登録など

画像投稿機能

検索機能(Ransack)

星1~5で評価(Raty.js, jQuery)

ページめくり機能(will_paginate)

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

Rspec / Capybara / FactoryBot / Faker / Rubocop
