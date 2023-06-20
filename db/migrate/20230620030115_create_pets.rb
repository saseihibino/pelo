class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string     :petname,     null: false
      t.date       :birthday
      t.integer    :gender_id,   null: false
      t.string     :pet_type
      t.text       :memo
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
