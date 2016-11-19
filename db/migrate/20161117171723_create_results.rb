class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :content
      t.string :tag_name
      t.hstore :tag_attributes, default: {} # mostly for a tag
      t.references :history

      t.timestamps
    end
  end
end
