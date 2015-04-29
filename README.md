# Wine_Club_rails
Final project of CS445 Spring2015 at IIT

* Rails app as an API provider using JSON
* API implemented http://cs.iit.edu/~virgil/cs445/mail.spring2015/project-api.html
* Ruby version: 1.9.3

### Installing ruby and necessary environmentn tools
* Examples for ubuntu (Ruby 1.9.3)
```
sudo apt-get install ruby-full
gem install bundler
```
* Thanks to `bundler`, the gems required for Rails can be installed by a simple command


### Server
Server on root folder
* Installing required gems (Rails included)
```
bundle install
```
* Database creation and initialization
```
rake db:create
```
* Type `rails s` to start server at port 3000. For other port (i.e. 8080)
```
rails s -p 8080
```


### Testing
To run unit tests, just type `rake test` on the root folder
* Test results will be printed in the terminal
* It will generate the `/coverage` folder, open `index.html` using a web browser to see coverage results


### Client
Client on test folder `vin/test/vin-client.rb`. Provides a RestClient with all methods needed to test the use cases defined in the API
* JSON data examples under `vin/lib/data` folder
* For implementing different JSON examples, just copy the file in that folder and pass the name of the file as an argument to any client method in the options hash with the key `:read`. The client program will read automatically the file from that folder
```
some_method(arg1, arg2, { :read => "my_example.json" })
```


Author: [Wilfrido Vidana](wvidanas@gmail.com)
