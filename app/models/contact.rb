class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :home_phone, :work_phone, :cell_phone
end
