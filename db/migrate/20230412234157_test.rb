class Test < ActiveRecord::Migration[5.1]
  def change
    create_table :test do |t|
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end