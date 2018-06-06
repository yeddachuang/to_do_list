class Task < ApplicationRecord
  validates_presence_of :due_date, :note, :name
end
