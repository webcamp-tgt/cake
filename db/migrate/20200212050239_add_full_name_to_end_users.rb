class AddFullNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :full_name, :string
  end
end
