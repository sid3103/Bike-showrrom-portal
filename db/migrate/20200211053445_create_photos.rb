class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :two_wheeler
      t.attachment :image
      t.timestamps
    end
  end
end
