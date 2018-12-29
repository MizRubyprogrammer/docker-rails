# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :board_tag_relations, dependent: :delete_all
  # dependentを使用する際、メソッドはdestroyのみに対応する　＊deleteではダメ コントローラ確認
  has_many :tags,through: :board_tag_relations
  #アソシエーション 対応するテーブルに記述
  validates :name,presence:true, length:{maximum:10}
  validates :title,presence:true, length:{maximum:30}
  validates :body,presence:true, length:{maximum:1000}
end