# require 'open-uri'

# Seeds for all Environments
ethan = User.create( 
  first_name: 'ethan',
  last_name: 'ozelius',
  email:    'e.ozelius@gmail.com',
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
  activated: true,
  activated_at: Time.zone.now,
  admin: true,
  from: 'concord new hampshire',
  gps: 'queens new york',
  profile_pic: open('https://driftmap.s3.amazonaws.com/uploads/user/profile_pic/1/20160120_154421.jpg')
)

ethan.save

# Create driftmap for ethan
ethan.driftmap = Driftmap.create(
  title:  "./driftmap",
  body:   "just a computer hacker trying to get some more sunshine.",
  init_x: 0.924206230200376,
  init_y: -34.2400771379471,
  init_zoom: 2,
)

ethan.driftmap.save!

colombia = ethan.driftmap.journeys.create!(
  title: '2015 - Colombia',
  description: 'A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.',
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/user/profile_pic/1/20160120_154421.jpg'),
  x: 4.6077624,
  y: -74.0745113
)

bogota = colombia.waypoints.create!(
  title: 'bogota',
  body: 'The Capital and largest city in Colombia, Bogota is home to more than 9 million.  The majority of my time I spent in Chapinero, a neighborhood to the north of the old town, tucked in the foot of the massive mountains that overlook the city, and give Bogota it\'s rainy climate.  My days in Bogota were sometimes energetic, sometimes dreary but always informative.  As the first city I would visit, I dove and stumbled headfirst into the language and culture of Colombians.  Bogota was my introduction into the lives, dance, and struggle everyday Colombians; ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey'.html_safe,
  x: 4.6077624, 
  y: -74.0745113,
  date: DateTime.new(2015, 9, 7),
  coverphoto: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/20/bogota_fut.jpg")
)

bogota_gallery = bogota.galleries.create!(
  title: 'bogota gallery',
  description: 'bogota gallery',
  coverphoto: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/19/bogota_plaza_bolivar.jpg"),
  x: 4.6077624, 
  y: -74.0745113
)

bogota_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/19/bogota_plaza_bolivar.jpg"))
bogota_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/20/bogota_fut.jpg"))
bogota_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/21/bogota_monsarate.jpg"))
bogota_gallery.save!
bogota.save!

medellin = colombia.waypoints.create!(
  title: 'medellin',
  body: "A majority of my time in Colombia was spent in Medellin, the city of eternal spring is renowned for it\'s beautiful weather and mujeres latinas.  A common destination for vacationers, partiers and drifters like myself, Medellin offered paradise to all.  A theory of mine, is that all the greatest cities in the world require you to climb over some garbage to get to the best parts, while this city of Paisas, like every city is not without rough sectors.  Yet almost every single trip, subway ride and party was secure and appealing.  It is unforunate that Medellin has yet again portrayed as a home of the narcos, when in reality, this city is an exemplary example of innovation in the wake of disaster.  Not only has this city become safe for citizens and travelers, it is clean, friendly and damn good fun if you can dance a little.  Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I've come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.".html_safe,
  x: 6.2807872, 
  y: -75.5511055,
  date: DateTime.new(2015, 11, 29),
  coverphoto: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/59/DSCF6108.JPG")
)

medellin_gallery = medellin.galleries.create!(
  title: 'medellin gallery',
  description: 'medellin gallery',
  coverphoto: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/59/DSCF6108.JPG"),
  x: 6.2807872, 
  y: -75.5511055
)

medellin_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/59/DSCF6108.JPG"));
medellin_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/60/DSCF6103.JPG"));
medellin_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/25/DSCF5895.JPG"));
medellin_gallery.save!
medellin.save!

laureles = colombia.waypoints.create!(
  title: 'laureles',
  body: 'Laureles is one of the wealthier neighborhoods in medellin and a common destination for backpackers and students looking to avoid the gringo central of the poblado neighborhood.',
  x: 6.2450411,
  y: -75.5926666,
  date: DateTime.new(2015, 12, 5),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/29/DSCF5897.JPG')
)

laureles_gallery = laureles.galleries.create!(
  title: 'laureles gallery',
  description: 'laureles gallery',
  x: 6.2450411,
  y: -75.5926666,
  coverphoto: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/29/DSCF5897.JPG")
)

laureles_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/29/DSCF5897.JPG"))
laureles_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/31/DSCF6157.JPG"))
laureles_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/30/DSCF5933.JPG"))
laureles_gallery.save!
laureles.save!

estrella = colombia.waypoints.create!(
  title: 'la estrella',
  body: 'Estrella is a more rural pueblo on the southern outskirts of Medellin where I escaped the party of downtown Medellin for a moment.  It becomes evident how quickly Colombia can transform from a busy city into a rich jungle, alive with wildlife and the most vivid vegetation imaginable.',
  x: 6.16069422425591,
  y: -75.6432723999023,
  date: DateTime.new(2016, 1, 3),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/33/DSCF6365.JPG')
)

estrella_gallery = estrella.galleries.create!(
  title: 'estrella gallery',
  description: 'estrella gallery',
  x: 6.16069422425591,
  y: -75.6432723999023
)

estrella_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/33/DSCF6365.JPG"))
estrella_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/34/DSCF6378.JPG"))
estrella_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/35/DSCF6360.JPG"))
estrella_gallery.save!
estrella.save!

manizales = colombia.waypoints.create!(
  title: 'manizales',
  body: 'I packed my bag in a hurry to head south to Manizales for the city Feria.  The night I arrived I instantly made friends with a dude from manizales at a salsa concert.'.html_safe,
  x: 5.1073584, 
  y: -75.5126810,
  date: DateTime.new(2016, 2, 18),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/33/DSCF6365.JPG')
)

manizales_gallery = manizales.galleries.create!(
  title: 'manizales gallery',
  description: 'manizales gallery',
  x: 5.1073584, 
  y: -75.5126810
)

manizales_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/33/DSCF6365.JPG"))
manizales_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/34/DSCF6378.JPG"))
manizales_gallery.waypoint_images.create!(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/36/DSCF6384.JPG"))
manizales_gallery.save!
manizales.save!

pereira = colombia.waypoints.create!(
  title: 'pereira',
  body: 'In Pereira, the lower points of the digital nomal lifestyle took a bit of a toll. Work was excessive and friends were few and far between. As in, I was literally the only guest at my residency.',
  x: 4.81560176379169,
  y: -75.6971740722656,
  date: DateTime.new(2016, 2, 10),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/42/DSCF6431.JPG')
)

pereira_gallery = pereira.galleries.create!(
  title: 'pereira gallery',
  description: 'pereira gallery',
  x: 4.81560176379169,
  y: -75.6971740722656
)

pereira_gallery.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/42/DSCF6431.JPG'))
pereira_gallery.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/41/DSCF6436.JPG'))
pereira_gallery.waypoint_images.create!(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/44/DSCF6458.JPG'))
pereira_gallery.save!
pereira.save!

salento = colombia.waypoints.create!(
  title: 'salento',
  body: 'Finally, what Colombia is famous for, the delicious coffee.  If pereira was the place where the digital nomad lifestyle left me feeling like I got hit by a car, in Salento my lack of planning left me feeling like I fell into a Volcano.  Colombias coffee zone is one of the most beautiful places I have ever visited, and staying only an afternoon is an absolute travesty.  In spite of my procrastination, I rented a bicycle and ventured into the hills above the town and it was one of the greatest rides I have ever undertaken.'.html_safe,
  x: 4.6671150, 
  y: -75.5951801,
  date: DateTime.new(2016, 2, 27),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/50/DSCF6479.JPG')
)

salento_gallery = salento.galleries.create!(
  title: 'salento gallery',
  description: 'salento gallery',
  x: 4.6671150, 
  y: -75.5951801
)

salento_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/50/DSCF6479.JPG"))
salento_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/51/DSCF6473.JPG"))
salento_gallery.waypoint_images.build(image: open("https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/58/DSCF6496.JPG"))
salento_gallery.save!
salento.save!

cali = colombia.waypoints.create!(
  title: 'cali',
  body: 'tierra de salsa The weather is blazing hot',
  x: 3.434259218098,
  y: -76.5115356445312,
  date: DateTime.new(2016, 3, 15),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/65/160127-115556.jpg')
)

cali_gallery = cali.galleries.create!(
  title: 'cali gallery',
  description: 'cali gallery',
  x: 3.434259218098,
  y: -76.5115356445312
)

cali_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/65/160127-115556.jpg'))
cali_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/66/20160123_182401.jpg'))
cali_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/70/20160123_192435.jpg'))
cali_gallery.save!
cali.save!
colombia.save!

europe = ethan.driftmap.journeys.create!(
  title: '2016 - Europe',
  description: 'Backpacking across the pond',
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/journey/coverphoto/2/DSCF7104.JPG'),
  x: 55.6895847,
  y: 12.5706253
)

copenhagen = europe.waypoints.create!(
  title: 'copenhagen', 
  body: 'I was much less anxious or nervous for this adventure, as compared to my Colombian journey. Something about being about to not only speak but Understand the language is a game-changer. Although that unforgettable jumpy, fidgety feeling that all drifters exist for never fails to accompany you as you board and exit the plane. There is a lot of beauty in travelling solo. At this moment in the first hour of my journey it is a constant ebb and flow of excitement and anxiety in regards to meeting new faces from all over, like the first day of school walking into the cafeteria, all eyes watching all the other eyes. The Danish people remind me vaguely of the Canadians, their accent is a little funny, but overall good people.'.html_safe, 
  x: 55.6895847, 
  y: 12.5706253,
  date: DateTime.new(2016, 10, 2),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/2/DSCF6643.JPG')
)

copenhagen_gallery = copenhagen.galleries.create(
  title: 'copenhagen gallery',
  description: 'copenhagen gallery',
  x: 55.6895847, 
  y: 12.5706253
)

copenhagen_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/2/DSCF6643.JPG'))
copenhagen_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/4/DSCF6614.JPG'))
copenhagen_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/5/DSCF6600.JPG'))
copenhagen_gallery.save!
copenhagen.save!

berlin = europe.waypoints.create!(
  title: 'berlin',
  body: 'Berlin, was one of my favorite cities that I had the privledge of visiting, I also almost died while going to a club one night.  I never was a huge history buff, bit seeing not only the relics proud and somber, and talking with berliners gives a new twist on this rich city.'.html_safe,
  x: 52.5479659177324,
  y: 13.359375,
  date: DateTime.new(2016, 10, 7),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/15/DSCF6709.JPG')
)

berlin_gallery = berlin.galleries.create!(
  title: 'berlin gallery',
  description: 'berlin gallery',
  x: 52.5479659177324,
  y: 13.359375
)

berlin_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/15/DSCF6709.JPG'))
berlin_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/10/DSCF6683.JPG'))
berlin_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/11/14709436_1182611415147266_4934580762092503040_n.jpg'))
berlin_gallery.save!
berlin.save!

amsterdam = europe.waypoints.create!(
  title: 'amsterdam',
  body: 'amsterdam',
  x: 52.1065051907563,
  y: 5.625,
  date: DateTime.new(2016, 10, 11),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/72/14714435_307114913002993_4977066067483426816_n.jpg')
)

amsterdam_gallery = amsterdam.galleries.create!(
  title: 'amsterdam gallery',
  description: 'amsterdam gallery',
  x: 52.1065051907563,
  y: 5.625
)

amsterdam_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/72/14714435_307114913002993_4977066067483426816_n.jpg'))
amsterdam_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/73/DSCF6781.JPG'))
amsterdam_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/71/14723694_1805654773024700_269774381989756928_n.jpg'))
amsterdam_gallery.save!
amsterdam.save!

paris = europe.waypoints.create!(
  title: 'paris',
  body: 'Absinthe is one heck of a concoction.'.html_safe,
  x: 48.8827795934513,
  y: 2.2906494140625,
  date: DateTime.new(2016, 10, 15),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/75/DSCF7010.JPG')
)

paris_gallery = paris.galleries.create!(
  title: 'paris gallery',
  description: 'paris gallery',
  x: 48.8827795934513,
  y: 2.2906494140625
)

paris_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/75/DSCF7010.JPG'))
paris_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/78/DSCF7032.JPG'))
paris_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/79/DSCF7013.JPG'))
paris_gallery.save!
paris.save!

switzerland = europe.waypoints.create!(
  title: 'park ela',
  body: 'This could be the greatest place I\'ve been in the entire world. Before I embarked on this trip, I had just one thing that I knew I had to do in Europe, the rest I knew I could figure out on the way. If for whatever reason I missed out on driving a really fast (really slow in reality) car through the Swiss Alps, my journey would have been a failure. The greatest driving roads in the world are in the Alps between here and the Italian border. The hiking and other outdoors stuff is very decent as well'.html_safe,
  x: 46.2548972628291,
  y: 12.117919921875,
  date: DateTime.new(2016, 10, 22),
  coverphoto: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/90/DSCF7223.JPG')
)

switzerland_gallery = switzerland.galleries.create!(
  title: 'switzerland gallery',
  description: 'switzerland gallery',
  x: 46.2548972628291,
  y: 12.117919921875
)

switzerland_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/90/DSCF7223.JPG'))
switzerland_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/91/DSCF7123.JPG'))
switzerland_gallery.waypoint_images.build(image: open('https://driftmap.s3.amazonaws.com/uploads/waypoint_image/image/92/DSCF7070.JPG'))
switzerland_gallery.save!
switzerland.save!
europe.save!