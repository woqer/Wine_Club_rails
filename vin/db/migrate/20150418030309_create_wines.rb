class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :type
      t.integer :rating

      t.timestamps
    end
  end
end
