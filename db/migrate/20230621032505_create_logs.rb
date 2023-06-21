class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string     :toilet
      t.string     :meal
      t.integer    :mood
      t.integer    :walktime
      t.string     :bodytemperature
      t.string     :weight
      t.string     :length
      t.text       :memo
      t.references :user,               null: false, foreign_key: true
      t.references :pet,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
