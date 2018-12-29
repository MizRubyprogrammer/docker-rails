# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord

  has_many :board_tag_relations,dependent: :delete_all
  # dependentを使用する際、メソッドはdestroyのみに対応する　＊deleteではダメ　コントローラ確認
  has_many :boards, through: :board_tag_relations
end
