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
