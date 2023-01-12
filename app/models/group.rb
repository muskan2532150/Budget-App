class Group < ApplicationRecord
    belongs_to :user
    has_many :entitys, dependent: :destroy

    validates :name, presence:true
end
