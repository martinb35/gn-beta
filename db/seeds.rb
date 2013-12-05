# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{name: 'Administrador'},{name: 'Editor'},{name: 'Usuario'}])
User.create([
  { name: 'sw-admin', 
    password: 'Mida8lie',
    password_confirmation: 'Mida8lie',
    email: 'sales@semantic.mx', 
    role_id: 1},
  { name: 'goninis', 
    password: 'ooquai1O',
    password_confirmation: 'ooquai1O',
    email: 'goninis@gmail.com', 
    role_id: 2},
  { name: 'Carlos', 
    password: 'footoh7H',
    password_confirmation: 'footoh7H',
    email: 'test@semantic.mx', 
    role_id: 3}
])

Level.create([{title: 'Limpieza Profunda'}, {title: 'Limpieza Normal'}, {title: 'De Temporada'}])
Floor.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
Room.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
Bathroom.create([{title: 'Uno'}, {title: 'Dos'}, {title: 'Tres'}])
JobCategory.create([{title: 'Tareas del Hogar', icon: 'house.png'}, {title: 'Servicios Profesionales', icon: 'building.png'}])
SuggestedPrice.create([
  { floor: 1, room: 1, bathroom: 1, price1: '$101.25-$135', price2: '$217.5-$285', price3: '$190-$250' },
  { floor: 1, room: 1, bathroom: 2, price1: '$114.75-$148.5', price2: '$232.5-$300', price3: '$220-$290' },
  { floor: 1, room: 1, bathroom: 3, price1: '$121.5-$155.25', price2: '$240-$315', price3: '$240-$315' },
  { floor: 1, room: 1, bathroom: 4, price1: '$121.5-$162', price2: '$247.5-$322.5', price3: '$255-$340' },

  { floor: 1, room: 2, bathroom: 1, price1: '$114.75-$148.5', price2: '$247.5-$322.5', price3: '$420-$560' },
  { floor: 1, room: 2, bathroom: 2, price1: '$128.25-$162', price2: '$255-$337.5', price3: '$470-$630' },
  { floor: 1, room: 2, bathroom: 3, price1: '$135-$175.5', price2: '$270-$352.5', price3: '$510-$690' },
  { floor: 1, room: 2, bathroom: 4, price1: '$135-$175.5', price2: '$277.5-$360', price3: '$550-$730' },

  { floor: 1, room: 3, bathroom: 1, price1: '$121.5-$162', price2: '$255-$337.5', price3: '$440-$580' },
  { floor: 1, room: 3, bathroom: 2, price1: '$135-$175.5', price2: '$270-$360', price3: '$500-$660' },
  { floor: 1, room: 3, bathroom: 3, price1: '$141.75-$182.25', price2: '$285-$375', price3: '$540-$710' },
  { floor: 1, room: 3, bathroom: 4, price1: '$148.5-$189', price2: '$292.5-$382.5', price3: '$570-$760' },

  { floor: 1, room: 4, bathroom: 1, price1: '$128.25-$168.75', price2: '$270-$352.5', price3: '$450-$610' },
  { floor: 1, room: 4, bathroom: 2, price1: '$141.75-$182.25', price2: '$285-$375', price3: '$510-$680' },
  { floor: 1, room: 4, bathroom: 3, price1: '$148.5-$189', price2: '$292.5-$382.5', price3: '$550-$740' },
  { floor: 1, room: 4, bathroom: 4, price1: '$148.5-$195.75', price2: '$300-$390', price3: '$590-$780' },

  { floor: 2, room: 1, bathroom: 1, price1: '$155.25-$202.5', price2: '$322.5-$577.5', price3: '$570-$750' },
  { floor: 2, room: 1, bathroom: 2, price1: '$162-$216', price2: '$337.5-$442.5', price3: '$620-$830' },
  { floor: 2, room: 1, bathroom: 3, price1: '$168.75-$222.75', price2: '$345-$457.5', price3: '$660-$890' },
  { floor: 2, room: 1, bathroom: 4, price1: '$175.5-$229.5', price2: '$352.5-$465', price3: '$700-$930' },

  { floor: 2, room: 2, bathroom: 1, price1: '$168.75-$216', price2: '$352.5-$465', price3: '$610-$810' },
  { floor: 2, room: 2, bathroom: 2, price1: '$175.5-$229.5', price2: '$367.5-$480', price3: '$660-$880' },
  { floor: 2, room: 2, bathroom: 3, price1: '$182.25-$243', price2: '$376.5-$495', price3: '$700-$940' },
  { floor: 2, room: 2, bathroom: 4, price1: '$189-$243', price2: '$382.5-$502.5', price3: '$740-$980' },

  { floor: 2, room: 3, bathroom: 1, price1: '$175.5-$229.5', price2: '$367.5-$480', price3: '$630-$830' },
  { floor: 2, room: 3, bathroom: 2, price1: '$189-$243', price2: '$379.5-$502.5', price3: '$680-$910' },
  { floor: 2, room: 3, bathroom: 3, price1: '$195.75-$249.75', price2: '$390-$517.5', price3: '$720-$970' },
  { floor: 2, room: 3, bathroom: 4, price1: '$195.75-$256.5', price2: '$397.5-$525', price3: '$760-$1010' },

  { floor: 2, room: 4, bathroom: 1, price1: '$182.25-$236.25', price2: '$375-$495', price3: '$640-$860' },
  { floor: 2, room: 4, bathroom: 2, price1: '$189-$249.75', price2: '$390-$510', price3: '$700-$930' },
  { floor: 2, room: 4, bathroom: 3, price1: '$195.75-$263.25', price2: '$397.5-$525', price3: '$740-$990' },
  { floor: 2, room: 4, bathroom: 4, price1: '$202.5-$263.25', price2: '$405-$532.5', price3: '$780-$1040' }

])