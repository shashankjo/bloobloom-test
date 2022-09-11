class Len < ApplicationRecord
  has_many :glasses

  FASHION       = 'fashion'
  SINGLE_VISION = 'single_vision'
  VARIFOCALS    = 'varifocals'

  CLASSIC       = 'classic'
  BLUE_LIGHT    = 'blue_light'
  TRANSITION    = 'transition'

  PRESCRIPTION_TYPE = [FASHION, SINGLE_VISION, VARIFOCALS].freeze
  LENS_TYPE         = [CLASSIC, BLUE_LIGHT, TRANSITION].freeze

  validates :price, :color, presence: true
  validates :prescription_type, presence: true, inclusion: { in: PRESCRIPTION_TYPE }
  validates :lens_type, presence: true, inclusion: { in: LENS_TYPE }
  validates :stock, presence: true, numericality: { only_integer: true }
end
