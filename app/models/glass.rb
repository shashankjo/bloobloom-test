class Glass < ApplicationRecord
  belongs_to :user
  belongs_to :frame
  belongs_to :len
end
