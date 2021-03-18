class User < ApplicationRecord
  has_many :my_tasks, class_name: 'Task', foreign_key: :author_id
  has_many :assigned_tasks, class_name: 'Task', foreign_key: :assignee_id

  has_secure_password

  validates :first_name, presence: true, length: { minimum: 2, too_short: '%<count>s characters is the minimum allowed' }
  validates :last_name, presence: true, length: { minimum: 2, too_short: '%<count>s characters is the minimum allowed' }
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: '%<value>s invalid' }
end
