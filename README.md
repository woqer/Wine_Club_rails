# Wine_Club_rails
Final project of CS445 Spring2015 at IIT

* Rails app as an API provider using JSON
* API implemented http://cs.iit.edu/~virgil/cs445/mail.spring2015/project-api.html
* Ruby version: 1.9.3

### Client
Client on test folder `vin/test/vin-client.rb`. Provides a RestClient with all methods needed to test the use cases defined in the API
* JSON data examples under `vin/lib/data` folder
* For implementing different JSON examples, just copy the file in that folder and pass the name of the file as an argument to any client method in the options hash with the key `:read`. The client program will read automatically the file from that folder
```
some_method(arg1, arg2, { :read => "my_example.json" })
```

### Server
Server on root folder `vin`
* Type `rails s` to start server at port 3000
* Database creation and initialization: type `rake db:create`

Author: [Wilfrido Vidana](wvidanas@gmail.com)
