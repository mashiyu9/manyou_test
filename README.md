# データベースの設計

## User

| culumn   | type   |
| -------- | ------ |
| name     | string |
| email    | text   |
| password | text   |

## Task

| culumn     | type       |
| ---------- | ---------- |
| user_id    | references |
| title      | string     |
| content    | text       |
| importance | string     |
| status     | string     |
| deadline   | datetime   |

## Label

| culumn | type   |
| ------ | ------ |
| series | string |

## Division

| culumn   | type       |
| -------- | ---------- |
| task_id  | references |
| label_id | references |

# Deployment

- ruby 2.6.5

- rails 5.2.3

1. アセットプリコンファイルの実行

> `rails assets:precompile RAILS_ENV=production`

2. git puch origin ブランチ名

3. プルリクエストをマージしてもらう

4. 必要に応じてデータベースの更新

> `heroku run rails db:migrate`

6. heroku に必要に応じて環境変数を設定する

> `heroku config:set 変数名=入れる値`
