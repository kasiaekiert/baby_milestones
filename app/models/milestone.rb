class Milestone < ApplicationRecord
  has_many :assignments, dependent: :destroy
end
