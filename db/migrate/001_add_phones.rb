class AddPhones < ActiveRecord::Migration
  def up
    add_column :Contacts, :home_phone, :string
    add_column :Contacts, :work_phone, :string
    add_column :Contacts, :cell_phone, :string
  end

  def down
  end
end
