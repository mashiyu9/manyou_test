class User < ApplicationRecord
  has_many :tasks, :dependent => :destroy
  has_many :labels, :dependent => :destroy




  has_secure_password

  before_validation { email.downcase! }
  after_destroy :admin_user_present?
  after_update :admin_user_present?

  validates :name, presence: true,
  length: { maximum: 30 }
  validates :email, presence: true,
  length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def admin_user_present?
    raise ActiveRecord::Rollback  if User.where(admin: true).count == 0
  end

end
