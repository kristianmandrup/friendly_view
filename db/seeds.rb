# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#


# loads seed counts from config/seed/seed_da.yml
seed        = MainApp.config.instance.seed
users 			= seed.users
properties 	= SeedProperties.new seed.property

# iterate all user types and generate users for each based on seed counts for each user type
[:tenant, :landlord, :both].each do |user_type|
	users[user_type.to_s].times do
		# then create a property for that user using the seed counts for each property type
		FactoryGirl.create :user, :type => user_type, :house_type => properties.next_type
	end
end


