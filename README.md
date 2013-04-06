# JsInfo

JsInfo is a simple gem that trys to integrate javascript alert, confirm and prompt functions into Rails controller level. You can alert the users with a message without showing it in the view like the Flash of ActionDispatch does by using javascript functions.

The principles of JsInfo are:

1. Easy to use
2. Call from the controller
3. No extra codes in View layer

## Installation

Add this line to your application's Gemfile:

    gem 'js_info'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install js_info

## Usage

You can call JsInfo functions in the controllers:

    js_alert("Your subscription is ok!")
    js_confirm("Are you sure you want to visit google?", "http://www.google.com")
    js_prompt("Please enter your name", "http://example.com")


### js_alert

And here is a typical example in the users controller:

    def create
      @user = User.find(params[:id])
      if @user.save
        js_alert("Your profile created successfully!")
      else
        render :new
      end
    end

You can specify the target url as the second parameter:

    js_alert("We are moving to github!", "https://github.com")
    

or more conventional way:

    js_alert("Welcome Back!", root_path)
    

Please note that the default of the target url is *request.referer*

### js_confirm

Sometimes a yes-no question is required:

    js_confirm("Are you sure you want to sign up?", new_subscription_path)
    
As for js_confirm, the second parameter is necessary. If you want to redirect to another path when the user click **no** or **cancel**, it is possible to use the third parameter:

    js_confirm("Are you sure you want sign up?", new_subscription_path, cancel_subscription_path)
        
Also note that the default value for third parameter is *request.referer*, so when the user click **cancel** will return to the previous page.

### js_prompt

js_prompt is a method that will carry user's input to developer's target url with specified parameter name, here is an example:

    js_prompt("what is your name?", new_user_path)
    

The typical javascript prompt will pop up with a dialog as you expected. As you can key in some values in the input box. When the user press the **Enter**, it will redirect to the new_user_path with a parameter named *params_name* with the value of user's input, say, *Chuyi* is the value of the input. it might look like **"http://example.com?params_name=Chuyi"** in the location bar. 

Of course we can define the default value of the input or change the parameter to fit our needs:

    js_prompt("Enter your email", new_user_path, "email", "yourname@example.com")

After pressing the confirm button the page will be redirected to **"http://example.com?email=yourname@example.com"**. As you can see, the third parameter is the parameter name and the forth one is the default value, simple as that.

##What you need to know

I test it in the rails development environment, so please let me know if there is any improvement or bug I need to fix, thank you. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
