class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
