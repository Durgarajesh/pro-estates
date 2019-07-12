class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
    	t.integer :number, null: :false
    	t.string :area
    	t.integer :property_id

    	t.index :property_id, unique: true

      t.timestamps
    end
  end
end
