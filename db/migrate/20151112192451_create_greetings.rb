class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.string :message
      t.timestamps null: false
    end
  end
end
