# Alki::Rails

Rails integration for Alki! Allows easily using Alki in your Rails project. Alki is a dependency injection and program organization framework.

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'alki-rails'
```

And then execute:

    $ bundle

Create a `config/alki` directory and then create an empty Alki Assembly definition in an `assembly.rb` file inside that. 

.config/alki/assembly.rb
```ruby
Alki do

end
```

Finally, add the following to your ApplicationController class:

```ruby
include Alki::Rails
```

## Usage

Element defined in your Assembly definition will be callable directly from your assembly:

.config/alki/assembly.rb
```ruby
Alki do
  group :settings do
    set :msg, "Hello World"
  end
end
```

.app/controllers/home_controller.rb
```ruby
class HomeController < ApplicationController
  def show
    @msg = settings.msg
  end
end
```

Elements can also be accessed in the Rails console, or anywhere else in your Rails application, via Alki::Rails:

.Rails Console
```
2.3.2 :001 > Alki::Rails.settings.msg
 => "Hello World" 
```

Alki will automatically add your projects `lib` directory to the ruby load path, so you can require files from there directly. It also will handle auto-reloading files in lib.

See [here](https://github.com/alki-project/alki) for more documentation on how to use Alki.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alki-project/alki-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
