class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :address
      t.string :townName
      t.string :townFact
      t.string :townGood
      t.string :townBad
    end
  end
end
