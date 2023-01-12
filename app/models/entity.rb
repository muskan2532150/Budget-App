class Entity < ApplicationRecord
    belong_to :user
    validates :name, presence:true
    validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
