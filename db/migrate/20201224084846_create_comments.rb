class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true,  null: false
      t.references :board, foreign_key: true, null: false

      t.timestamps
    end
  end
end
