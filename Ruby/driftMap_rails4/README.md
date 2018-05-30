# README

driftMaps.com integrates all the adventures of world exploration into an expressive cartographic experience.

* How does it work?
     - driftMaps.com is organized into <span>Journeys</span> and <span>Way Points.</span>  For example a trek across South America, will have many stops along the way in cities, towns or parks.

- What kind of stuff will a Way Point include?
    * Way Point content creation is organized into 3 categories: Photos, Friends and Journals.

- Interested in Contributing?
    * Great!  Take a look around, and send me an email.

# Technology Stack
 * Rails 4.2.0
 * Ruby 2.3.1
 * RSpec 3.6.0 - https://github.com/rspec/rspec
 * Front End - ERB
 * DB - Postgres

# To get up a running
 1. database
    * configure config/database.yml
    ```
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    ```
 * Start Server
    ```
    $ rails s
    ```

# To execute tests
    $ rspec