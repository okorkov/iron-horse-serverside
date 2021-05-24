class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :header_image
      t.string :header_text
      t.string :main_image
      t.string :about_text
      t.string :contact_email

      t.timestamps
    end
  end
end
