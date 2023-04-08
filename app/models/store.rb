class Store < ApplicationRecord

  has_many :beans, dependent: :destroy

end
