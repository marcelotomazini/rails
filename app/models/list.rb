class List < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    has_and_belongs_to_many :gifts
end
