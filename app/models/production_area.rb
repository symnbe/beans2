class ProductionArea < ApplicationRecord
 has_many :beans, dependent: :destroy
end
