class User < ApplicationRecord
  has_many :managements

  has_many :projects, through: :managements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :password, presence: true, 
                       length: { minimum: 6, maximum: 6 },
                       format: { with: /\A[a-zA-Z]+\@/,
                       message: "use a special symbol, a character" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
