class Management < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :tasks, through: :project
  scope :by_user, ->(user) { where(user_id: user.id) }
  scope :by_exception, ->(user) { where.not(user_id: user.id) }
 
  # Ex:- scope :active, lambda {where(:active => true)} { where(:attibute => value)}
  # Ex:- scope :active, -> {where(:active => true)}
end
