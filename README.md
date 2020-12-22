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

## アプリケーション名

Plan_Design

## アプリケーション概要

ToDoリストです。ユーザー登録をすることで、大項目・中項目・小項目の登録を行えます。

## URL

https://plan-design-32118.herokuapp.com/

## テスト用アカウント

Email:    test_user@test.com
Password: 1qaz2wsx

## 利用方法

- ユーザー登録後、「新規作成」からプラン(大項目)を作成します。
- 作成したプランから「アイテム作成」でアイテム(中項目)を作成します。
- アイテム作成後、「詳細登録」から詳細を登録します。

## 目指した課題解決

仕事をしている人の予定やすべきことを可視化させることを目指しました。

## 洗い出した要件

### user管理機能
- 目的：新規登録・ログイン・ログアウトができること。
- 詳細：nickname、emeil、passwordを入力すると登録できること。ログイン、ログアウトができること。
- ユースケース：新規登録を行うことでユーザー一人一人がプランを作成することができる

### plan作成機能
- 目的：すべきことを可視化させるため。
- 詳細：大項目・中項目・小項目で管理できるようにする。小項目には概要と内容を登録できること。
- ユースケース：ログイン状態で新規作成よりプラン(大項目)の作成。アイテム作成で中項目、詳細登録で詳細を追加できる。

## 実装した機能についての説明

### user管理機能
nickname、email、password、password再入力を行うことで新規登録することができます。
ログインで必要となる情報はemail、passwordのみです。

### plan作成機能
プラン(大項目)ではタイトルを入力します。アイテム(中項目)でもプラン同様にタイトルの入力が必要です。
詳細(小項目)では概要と内容の入力が必要です。

## 実装予定の機能

- カード移動機能
- カレンダー機能
- ドロップアウトメニューに変更

## データベース設計

### usersテーブル
| column             | type   | option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :plans, dependent: :destroy

### plansテーブル
| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :items, dependent: :destroy

### itemsテーブル
| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| plan   | references | null: false, foreign_key: true |
 
- belongs_to :plan
- has_many :details, dependent: :destroy

### detailsテーブル
| column | type       | option                         |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| item   | references | null: false, foreign_key: true |

- belongs_to :item

## ローカルでの動作方法
開発環境：ruby 2.6.5、Rails 6.0.3.4

下記コマンドを実行し、ローカルホストにアクセスします。
```
git clone https://github.com/o281700/plan_design.git
cd plan_design
bundle install
yarn install
rails db:create
rails db:migrate
rails s
```
