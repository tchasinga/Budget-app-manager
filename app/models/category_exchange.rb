class CategoryExchange < ApplicationRecord
  belongs_to :group
  belongs_to :exchange
end
