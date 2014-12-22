# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create(:title => 'Guardians pf the Galaxy 2',
  :description => 
    %{<p>
        <em>Guardians pf the Galaxy 2</em> Coming soon
      </p>},
  :image_url =>   '',    
  :price => 17.95)

