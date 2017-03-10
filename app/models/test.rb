class Test < ApplicationRecord
  has_many :ahihis, 	dependent: :destroy
  
  validates :name, presence: true
  validates :score, presence: true
end
