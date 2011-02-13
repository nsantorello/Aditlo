class AddPseudohashToAdils < ActiveRecord::Migration
  def self.up
    add_column :adils, :pseudohash, :string
  end

  def self.down
    remove_column :adils, :pseudohash
  end
end
