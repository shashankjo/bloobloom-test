class Frame < ApplicationRecord
  ACTIVE   = 'active'
  INACTIVE = 'inactive'

  VALID_STATUSES = [ACTIVE, INACTIVE].freeze

  validates :name, :price, :status, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
  validates :stock, presence: true, numericality: { only_integer: true }
end
