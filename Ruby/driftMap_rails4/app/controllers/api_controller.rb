class ApiController < ApplicationController
  def get_driftmap
    driftmap = Driftmap.find(params[:driftmap_id])
    journeys = format_journeys(driftmap.journeys)
    render json: { driftmap: driftmap,
                   journeys: journeys }
  end

  private
    def format_journeys(journeys)
      response = []

      journeys.each do |j|
        my_journey = {}

        waypoints = []

        j.waypoints.order(:date).each do |wp|
          galleries = []
          friends = []
          essays = []
          treks = []
          
          # galleries
          if wp.galleries.any?
            wp.galleries.each do |g|
            
              gallery_images = []

              if g.waypoint_images.any?
                g.waypoint_images.each do |img|
                  gallery_images.push(img.image)
                end
              end

              galleries.push({
                id: g.id,
                title: g.title,
                description: g.description,
                coverphoto: g.coverphoto,
                images: gallery_images,
                x: g.x,
                y: g.y,
                waypoint_id: g.waypoint_id
              })
            end
          end

          # friends  
          if wp.friends.any?
            wp.friends.each do |f|
              friends.push({
                id: f.id,
                first_name: f.first_name,
                last_name: f.last_name,
                photo: f.photo,
                description: f.description,
                x: f.x,
                y: f.y,
                member: f.member,
                visible: f.visible,
                email: f.email,
                waypoint_id: f.waypoint_id
              })
            end
          end
          
          # Essays
          if wp.essays.any?
            wp.essays.each do |e|
              essays.push({
                id: e,
                title: e.title,
                body: e.body,
                coverphoto: e.coverphoto,
                x: e.x,
                y: e.y,
                waypoint_id: e.waypoint_id
              })
            end
          end

          # treks
          if wp.treks.any?
            wp.treks.each do |t|
              treks.push({
                id: t.id,
                title: t.title,
                description: t.description,
                coverphoto: t.coverphoto,
                waypoint_id: t.waypoint_id
              })
            end
          end

          waypoints.push({ 
            id: wp.id,
            title: wp.title,
            body: wp.body,
            x: wp.x,
            y: wp.y,
            content: {
              galleries: galleries,
              friends: friends,
              essays: essays,
              treks: treks,
            },
            journey_id: wp.journey_id,
            driftmap_id: j.driftmap_id,
            coverphoto: wp.coverphoto,
            date: {
              year:  wp.date.year,
              month: wp.date.month,
              day:   wp.date.day 
            }
          })
        end

        response.push({ 
          journey: j, 
          waypoints: waypoints
        })
      end

      return response
    end
end

=begin

{
  "driftmap":{
    "id":1,
    "title":"./driftmap",
    "body":"just a computer hacker trying to get some more sunshine.",
    "init_x":0.924206230200376,
    "init_y": -34.2400771379471,
    "init_zoom":2,
    "user_id":1,
    "created_at":"2017-03-17T00:25:53.942Z",
    "updated_at":"2017-03-22T12:37:45.832Z",
    "color_scheme":"satellite"
  },
  "journeys":[
    {
      "journey":{
        "id":1,
        "description":"A Digital Nomad trek, laced with Gonzo adventure into the heart and cities of Colombia.",
        "title":"2015 - Colombia",
        "coverphoto":{
          "url":"/uploads/journey/coverphoto/1/chapinero"
        },
        "driftmap_id":1,
        "created_at":"2017-03-17T00:25:53.962Z",
        "updated_at":"2017-03-23T17:42:34.056Z"
      },
      "waypoints":
        [
          {
            "id":1,
            "title":"bogota",
            "body":"Ground zero for my nomadic travels, where I learned the fundamentals of Spanish and the only logical place to start my journey",
            "x":4.6077624,
            "y":-74.0745113,
            "content":{
            "galleries": [
              {
                "id":1,
                "title":"Photo collection from Bogota",
                "description":"bogota gallery",
                "coverphoto":{
                  "url":"/uploads/gallery/coverphoto/1/open-uri20170316-14598-1m1fbyi"
                },
                "images":[{"url":"/uploads/waypoint_image/image/13/10983648_340472826146185_912143433_a.jpg"},{"url":"/uploads/waypoint_image/image/14/chapinero"}],"x":4.6077624,"y":-74.0745113,"waypoint_id":1},{"id":14,"title":"Chapinero","description":"Chapinero","coverphoto":{"url":"/uploads/gallery/coverphoto/14/photos"},"images":[],"x":4.6077624,"y":-74.0745113,"waypoint_id":1}],"friends":[{"id":1,"first_name":"Ricardo","last_name":"Mexia","photo":{"url":"/uploads/friend/photo/1/10983648_340472826146185_912143433_a.jpg"},"description":"o the stories I could tell about ricardo.","x":4.6077624,"y":-74.0745113,"member":false,"visible":null,"email":"rmexia@gmail.com","waypoint_id":1},{"id":2,"first_name":"Jonathan","last_name":"Munez","photo":{"url":"/uploads/friend/photo/2/jonathan.jpg"},"description":"Jonathon I met from couchsurfing, super cool dude we climbed monseratte and drank coffee.","x":4.6077624,"y":-74.0745113,"member":false,"visible":null,"email":"jmunez@gmail.com","waypoint_id":1}],"essays":[{"id":{"id":2,"title":"An Afternoon in Candelaria","body":"I met up with a girl whose name is evading me, who I also excluded for good reason from my list of friends, as well as contacts in my phone.  \r\n\r\nEverything started out fine, we met in the old town, 'candelaria' for lunch, and other than some aged-out hippies laughing at my spanish, the afternoon was passing pleasantly.  The trouble began after we left the restaurant to meet up with two other travelers that she had be corresponding with via couchsurfing.com.  The first, I will call Jeremy, was a Thai kid of about 21, wearing a suit and Dre headphones.  Second, I'll call Igor, about 30 years old, and 30 pounds overweight was from Germany.  A motley crew to be sure.","coverphoto":{"url":"/uploads/essay/coverphoto/2/candelaria_bogota.jpg"},"x":4.6077624,"y":-74.0745113,"waypoint_id":1,"created_at":"2017-03-17T17:18:44.403Z","updated_at":"2017-03-17T17:18:44.403Z"},"title":"An Afternoon in Candelaria","body":"I met up with a girl whose name is evading me, who I also excluded for good reason from my list of friends, as well as contacts in my phone.  \r\n\r\nEverything started out fine, we met in the old town, 'candelaria' for lunch, and other than some aged-out hippies laughing at my spanish, the afternoon was passing pleasantly.  The trouble began after we left the restaurant to meet up with two other travelers that she had be corresponding with via couchsurfing.com.  The first, I will call Jeremy, was a Thai kid of about 21, wearing a suit and Dre headphones.  Second, I'll call Igor, about 30 years old, and 30 pounds overweight was from Germany.  A motley crew to be sure.","coverphoto":{"url":"/uploads/essay/coverphoto/2/candelaria_bogota.jpg"},"x":4.6077624,"y":-74.0745113,"waypoint_id":1},{"id":{"id":3,"title":"Bogota Test Essay","body":"Bogota test essay","coverphoto":{"url":"/uploads/essay/coverphoto/3/chapinero"},"x":4.6077624,"y":-74.0745113,"waypoint_id":1,"created_at":"2017-03-24T17:00:29.947Z","updated_at":"2017-03-24T17:00:29.947Z"},"title":"Bogota Test Essay","body":"Bogota test essay","coverphoto":{"url":"/uploads/essay/coverphoto/3/chapinero"},"x":4.6077624,"y":-74.0745113,"waypoint_id":1}],"treks":[{"id":1,"title":"Bogota Test Trek","description":"A trek","coverphoto":{"url":"/uploads/trek/coverphoto/1/10983648_340472826146185_912143433_a.jpg"},"waypoint_id":1}]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":"/uploads/waypoint/coverphoto/1/chapinero"},"date":{"year":2015,"month":9,"day":7}},{"id":2,"title":"medellin","body":"A majority of my time in Colombia was spent in Medellin, the city of eternal spring is renowned for it's beautiful weather and mujeres latinas.  A common destination for vacationers, partiers and drifters like myself, Medellin offered paradise to all.  A theory of mine, is that all the greatest cities in the world require you to climb over some garbage to get to the best parts, while this city of Paisas, like every city is not without rough sectors.  Yet almost every single trip, subway ride and party was secure and appealing.  It is unforunate that Medellin has yet again portrayed as a home of the narcos, when in reality, this city is an exemplary example of innovation in the wake of disaster.  Not only has this city become safe for citizens and travelers, it is clean, friendly and damn good fun if you can dance a little.  Without a question, Paisas, (the inhabitants of Medellin) are the friendliest people I've come across in all my travels.  In Christmas this wonderland takes on a purple tint, and the entire city lights up as every home dons lights.  Built in the bottom of a valley, every view is spectacular, the city runs up from the river into the walls of the valley that is not to be missed.","x":6.2807872,"y":-75.5511055,"content":{"galleries":[{"id":2,"title":"medellin gallery","description":"medellin gallery","coverphoto":{"url":"/uploads/gallery/coverphoto/2/open-uri20170316-14598-1cnkles"},"images":[],"x":6.2807872,"y":-75.5511055,"waypoint_id":2}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2015,"month":11,"day":29}},{"id":3,"title":"laureles","body":"Laureles is one of the wealthier neighborhoods in medellin and a common destination for backpackers and students looking to avoid the gringo central of the poblado neighborhood.","x":6.2450411,"y":-75.5926666,"content":{"galleries":[{"id":3,"title":"laureles gallery","description":"laureles gallery","coverphoto":{"url":"/uploads/gallery/coverphoto/3/open-uri20170316-14598-180foe"},"images":[{"url":"/uploads/waypoint_image/image/1/open-uri20170316-14598-19sckcf"},{"url":"/uploads/waypoint_image/image/2/open-uri20170316-14598-1dpqa3u"},{"url":"/uploads/waypoint_image/image/3/open-uri20170316-14598-f3gr9u"}],"x":6.2450411,"y":-75.5926666,"waypoint_id":3}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2015,"month":12,"day":5}},{"id":4,"title":"la estrella","body":"Estrella is a more rural pueblo on the southern outskirts of Medellin where I escaped the party of downtown Medellin for a moment.  It becomes evident how quickly Colombia can transform from a busy city into a rich jungle, alive with wildlife and the most vivid vegetation imaginable.","x":6.16069422425591,"y":-75.6432723999023,"content":{"galleries":[{"id":4,"title":"estrella gallery","description":"estrella gallery","coverphoto":{"url":null},"images":[{"url":"/uploads/waypoint_image/image/4/open-uri20170316-14598-1ywmecu"},{"url":"/uploads/waypoint_image/image/5/open-uri20170316-14598-1h36zyg"},{"url":"/uploads/waypoint_image/image/6/open-uri20170316-14598-1xo77z6"}],"x":6.16069422425591,"y":-75.6432723999023,"waypoint_id":4}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":"/uploads/waypoint/coverphoto/4/10983648_340472826146185_912143433_a.jpg"},"date":{"year":2016,"month":1,"day":3}},{"id":6,"title":"pereira","body":"In Pereira, the lower points of the digital nomal lifestyle took a bit of a toll. Work was excessive and friends were few and far between. As in, I was literally the only guest at my residency.","x":4.81560176379169,"y":-75.6971740722656,"content":{"galleries":[{"id":6,"title":"pereira gallery","description":"pereira gallery","coverphoto":{"url":null},"images":[{"url":"/uploads/waypoint_image/image/10/open-uri20170316-14598-q4ckmp"},{"url":"/uploads/waypoint_image/image/11/open-uri20170316-14598-3s9h5n"},{"url":"/uploads/waypoint_image/image/12/open-uri20170316-14598-mm11gb"}],"x":4.81560176379169,"y":-75.6971740722656,"waypoint_id":6}],"friends":[],"essays":[{"id":{"id":1,"title":"Pererira Essay","body":"The place in settled down in Pereira for a week or so, was both the best and worst place in the world for a digital nomad.  asdf ","coverphoto":{"url":"/uploads/essay/coverphoto/1/chapinero"},"x":4.81560176379169,"y":-75.6971740722656,"waypoint_id":6,"created_at":"2017-03-17T13:58:22.898Z","updated_at":"2017-03-17T13:58:22.898Z"},"title":"Pererira Essay","body":"The place in settled down in Pereira for a week or so, was both the best and worst place in the world for a digital nomad.  asdf ","coverphoto":{"url":"/uploads/essay/coverphoto/1/chapinero"},"x":4.81560176379169,"y":-75.6971740722656,"waypoint_id":6}],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":2,"day":10}},{"id":5,"title":"manizales","body":"I packed my bag in a hurry to head south to Manizales for the city Feria.  The night I arrived I instantly made friends with a dude from manizales at a salsa concert.","x":5.1073584,"y":-75.512681,"content":{"galleries":[{"id":5,"title":"manizales gallery","description":"manizales gallery","coverphoto":{"url":null},"images":[{"url":"/uploads/waypoint_image/image/7/open-uri20170316-14598-1qj9r85"},{"url":"/uploads/waypoint_image/image/8/open-uri20170316-14598-hoj752"},{"url":"/uploads/waypoint_image/image/9/open-uri20170316-14598-1sxtqw0"}],"x":5.1073584,"y":-75.512681,"waypoint_id":5}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":2,"day":18}},{"id":7,"title":"salento","body":"Finally, what Colombia is famous for, the delicious coffee.  If pereira was the place where the digital nomad lifestyle left me feeling like I got hit by a car, in Salento my lack of planning left me feeling like I fell into a Volcano.  Colombias coffee zone is one of the most beautiful places I have ever visited, and staying only an afternoon is an absolute travesty.  In spite of my procrastination, I rented a bicycle and ventured into the hills above the town and it was one of the greatest rides I have ever undertaken.","x":4.667115,"y":-75.5951801,"content":{"galleries":[{"id":7,"title":"salento gallery","description":"salento gallery","coverphoto":{"url":null},"images":[],"x":4.667115,"y":-75.5951801,"waypoint_id":7}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":2,"day":27}},{"id":8,"title":"cali","body":"tierra de salsa The weather is blazing hot","x":3.434259218098,"y":-76.5115356445312,"content":{"galleries":[{"id":8,"title":"cali gallery","description":"cali gallery","coverphoto":{"url":null},"images":[],"x":3.434259218098,"y":-76.5115356445312,"waypoint_id":8}],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":3,"day":15}},{"id":14,"title":"Santa Marta","body":"Beach!","x":26.2421835758181,"y":-21.0586023330688,"content":{"galleries":[],"friends":[],"essays":[],"treks":[]},"journey_id":1,"driftmap_id":1,"coverphoto":{"url":"/uploads/waypoint/coverphoto/14/candelaria_bogota.jpg"},"date":{"year":2017,"month":3,"day":21}}]},{"journey":{"id":2,"description":"Backpacking across the pond","title":"2016 - Europe","coverphoto":{"url":"/uploads/journey/coverphoto/2/open-uri20170316-14598-r8e66w"},"driftmap_id":1,"created_at":"2017-03-17T00:26:33.580Z","updated_at":"2017-03-17T00:26:33.580Z"},"waypoints":[{"id":9,"title":"copenhagen","body":"I was much less anxious or nervous for this adventure, as compared to my Colombian journey. Something about being about to not only speak but Understand the language is a game-changer. Although that unforgettable jumpy, fidgety feeling that all drifters exist for never fails to accompany you as you board and exit the plane. There is a lot of beauty in travelling solo. At this moment in the first hour of my journey it is a constant ebb and flow of excitement and anxiety in regards to meeting new faces from all over, like the first day of school walking into the cafeteria, all eyes watching all the other eyes. The Danish people remind me vaguely of the Canadians, their accent is a little funny, but overall good people.","x":55.6895847,"y":12.5706253,"content":{"galleries":[{"id":9,"title":"copenhagen gallery","description":"copenhagen gallery","coverphoto":{"url":null},"images":[],"x":55.6895847,"y":12.5706253,"waypoint_id":9}],"friends":[],"essays":[],"treks":[]},"journey_id":2,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":10,"day":2}},{"id":10,"title":"berlin","body":"Berlin, was one of my favorite cities that I had the privledge of visiting, I also almost died while going to a club one night.  I never was a huge history buff, bit seeing not only the relics proud and somber, and talking with berliners gives a new twist on this rich city.","x":52.5479659177324,"y":13.359375,"content":{"galleries":[{"id":10,"title":"berlin gallery","description":"berlin gallery","coverphoto":{"url":null},"images":[],"x":52.5479659177324,"y":13.359375,"waypoint_id":10}],"friends":[],"essays":[],"treks":[]},"journey_id":2,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":10,"day":7}},{"id":11,"title":"amsterdam","body":"amsterdam","x":52.1065051907563,"y":5.625,"content":{"galleries":[{"id":11,"title":"amsterdam gallery","description":"amsterdam gallery","coverphoto":{"url":null},"images":[],"x":52.1065051907563,"y":5.625,"waypoint_id":11}],"friends":[],"essays":[],"treks":[]},"journey_id":2,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":10,"day":11}},{"id":12,"title":"paris","body":"Absinthe is one heck of a concoction.","x":48.8827795934513,"y":2.2906494140625,"content":{"galleries":[{"id":12,"title":"paris gallery","description":"paris gallery","coverphoto":{"url":null},"images":[],"x":48.8827795934513,"y":2.2906494140625,"waypoint_id":12}],"friends":[],"essays":[],"treks":[]},"journey_id":2,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":10,"day":15}},{"id":13,"title":"park ela","body":"This could be the greatest place I've been in the entire world. Before I embarked on this trip, I had just one thing that I knew I had to do in Europe, the rest I knew I could figure out on the way. If for whatever reason I missed out on driving a really fast (really slow in reality) car through the Swiss Alps, my journey would have been a failure. The greatest driving roads in the world are in the Alps between here and the Italian border. The hiking and other outdoors stuff is very decent as well","x":46.2548972628291,"y":12.117919921875,"content":{"galleries":[{"id":13,"title":"switzerland gallery","description":"switzerland gallery","coverphoto":{"url":null},"images":[],"x":46.2548972628291,"y":12.117919921875,"waypoint_id":13}],"friends":[],"essays":[],"treks":[]},"journey_id":2,"driftmap_id":1,"coverphoto":{"url":null},"date":{"year":2016,"month":10,"day":22}}]}]}"
=end      