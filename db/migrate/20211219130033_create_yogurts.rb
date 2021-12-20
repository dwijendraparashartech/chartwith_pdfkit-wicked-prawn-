class CreateYogurts < ActiveRecord::Migration[6.1]
  def change
    create_table :yogurts do |t|
      t.string :flavor

      t.timestamps
    end
  end
end
