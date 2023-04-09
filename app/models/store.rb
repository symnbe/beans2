class Store < ApplicationRecord

  has_many :beans, dependent: :destroy


  # アソシエーションに関して外部キーの取得をする場合のwhereの使用方法
  # def hoge_beans
  #   Bean.where(store_id: self.id)
  # end


  # あるストアのブラジル産の豆を取得する場合
  # def brazilian_beans
  #   Bean.where(store_id: self.id, area: "ブラジル" )
  #   下記でproduction_areaのidを取得する必要がある
  #   production_area = ProductionArea.find_by(area:"ブラジル")
  #   self.beans.where(production_area_id: production_area.id)
  # end

end
