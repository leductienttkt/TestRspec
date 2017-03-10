class Ahihi < ApplicationRecord
  belongs_to :test

  validates :name, presence: true
end
