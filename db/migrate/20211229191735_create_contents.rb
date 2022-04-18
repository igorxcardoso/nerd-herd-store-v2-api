class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.references :product, null: false, foreign_key: true
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end
