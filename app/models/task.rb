class Task < ApplicationRecord

  enum importance:{低: 0, 中: 1, 高: 2}

  validates :title, presence: true, uniqueness: true
  validates :importance, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  validates :content, presence: true

  # scope :task_desc, -> (test) {order(test: :desc)}
  scope :desc_created, -> {order(created_at: :desc)}
  scope :asc_deadline, -> {order(deadline: :asc)}
  scope :desc_importance, -> {order(importance: :desc)}
  scope :where_like_status_title, -> (title, status) {where(['title LIKE ? AND status LIKE ?', "%#{title}%", "%#{status}%"])}
  # scope :kaminari -> {page(params[:page]).per(4)}

end
