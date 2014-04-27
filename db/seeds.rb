Contact.delete_all

# http://en.wikipedia.org/wiki/List_of_most_popular_given_names
first_names = ['James',	'John',	'Robert',	'Michael', 'William', 'David', 'Richard', 'Charles', 'Joseph', 'Thomas']

# http://names.mongabay.com/most_common_surnames.htm
last_names = ['SMITH', 'JOHNSON', 'WILLIAMS','JONES', 'BROWN', 'DAVIS', 'MILLER', 'WILSON', 'MOORE', 'TAYLOR', 'ANDERSON', 'THOMAS', 'JACKSON', 'WHITE', 'HARRIS', 'MARTIN', 'THOMPSON', 'GARCIA', 'MARTINEZ', 'ROBINSON']

20.times do
  fname = first_names[rand(first_names.length)].capitalize
  lname = last_names[rand(last_names.length)].capitalize
  home = rand.to_s[2..4]+'-'+rand.to_s[2..4]+'-'+rand.to_s[2..5]
  work = rand.to_s[2..4]+'-'+rand.to_s[2..4]+'-'+rand.to_s[2..5]
  cell = rand.to_s[2..4]+'-'+rand.to_s[2..4]+'-'+rand.to_s[2..5]
  Contact.create(:first_name => fname, :last_name => lname, :email => "#{fname}.#{lname}@mail.com", :home_phone => home, :work_phone => work, :cell_phone => cell)
end





