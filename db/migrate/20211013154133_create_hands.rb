class CreateHands < ActiveRecord::Migration[6.1]
  def change
    create_table :hands do |t|
      t.string :cards
      t.string :value

      t.timestamps
    end
  end
end
