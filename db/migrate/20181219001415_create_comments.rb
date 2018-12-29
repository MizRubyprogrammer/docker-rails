class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :board, foreign_key: true
      # foreign_key 共通キーがない場合保存されない。データ不整合を防ぐ
      t.string :name, nill:false
      t.text :comment, nill:false
      # null:falseで空白時保存されないようにしている

      t.timestamps
    end
  end
end
