class Chore < ActiveRecord::Base
  validates :chore_id, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :due_date, :presence => true
  validates :is_done, :inclusion => [true, false]
end
