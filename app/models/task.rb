class Task < ApplicationRecord
  belongs_to :project

  enum status: [:high, :medium, :low]
end
