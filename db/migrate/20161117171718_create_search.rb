class CreateSearch < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :url

      t.timestamps
    end
  end
end
