class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :content
      t.string :tag_name
      t.string :link # mostly for a tag
      t.references :search

      t.timestamps
    end
  end
end
