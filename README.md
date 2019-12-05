# データベースの設計

## User

- name: string

## Task

- user_id: references
- title: string
- content: text
- importance: string
- status: string
- deadline: datetime

## label

- series: string

## division

- task_id: reference
- label_id: reference
