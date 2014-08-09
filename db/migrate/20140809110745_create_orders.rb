class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :name
      t.string :address
      t.string :city
      t.string :county
      t.string :post_code
      t.string :phone

      t.timestamps
    end
  end
end
