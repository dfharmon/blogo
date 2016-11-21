class CreateBlogoImages < ActiveRecord::Migration
  def change
    images_table = "#{Blogo.table_name_prefix}images"

    create_table(images_table)do |t|
      t.references :post
      t.boolean :is_hero
      t.attachment :image

      t.timestamps null: false
    end
  end
end
