class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :info,           null: false
      t.integer :category_id,           null: false
      t.string :name,           null: false
      t.string :name,           null: false
      t.string :name,           null: false
      t.string :name,           null: false
      t.string :name,           null: false
      t.string :name,           null: false
      t.string :name,           null: false

      | name                 | string     | null: false                    |
| info                 | text       | null: false                    |
| category_id          | integer    | null: false                    |
| sales_status_id      | integer    | null: false                    |
| fee_status_id        | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_schedule_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
      t.timestamps
    end
  end
end
