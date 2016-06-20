class AddAdminEmailPasswordColumnsToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :admin, :boolean, default: false
    add_column :customers, :email, :string
    add_column :customers, :password_digest, :string
  end
end
