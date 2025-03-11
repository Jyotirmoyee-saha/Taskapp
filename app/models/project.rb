class Project < ApplicationRecord
    has_many :managements
    has_many :users, through: :Managements
    has_many :tasks


    
end
