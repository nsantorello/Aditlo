class RemoveCreatedFromAdils < ActiveRecord::Migration
  def self.up
  	remove_column :adils, :created
  end

  def self.down
  	add_column :adils, :created, :datetime
  end
end
