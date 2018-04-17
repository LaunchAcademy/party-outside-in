class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description, null: false
    end
  end
end
