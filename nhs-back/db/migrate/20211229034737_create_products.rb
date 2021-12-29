class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :code_bar

      t.timestamps
    end
  end
end
