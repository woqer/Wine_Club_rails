class ChangeTypeFromWinesAndPackage < ActiveRecord::Migration
  def change
    remove_column :wines, :type
    remove_column :packages, :type

    add_column :wines, :color, :string
    add_column :packages, :mix, :string
  end
end
