class CreateAdils < ActiveRecord::Migration
  def self.up
    create_table :adils do |t|
      t.string :video_url
      t.datetime :created
      t.string :thumb_104
      t.string :thumb_208

      t.timestamps
    end
  end

  def self.down
    drop_table :adils
  end
end
