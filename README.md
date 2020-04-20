<h1 align=center>Welcome to <a href="https://sweater-weather-ss.herokuapp.com/" style="color: #ef3852">Sweater Weather</a></h1>

### Knowing how to dress

  The purpose of sweater weather is to provide information for people who are traveling. We are here to help people find out
  what the weather is like where they are going. So that planning a trip has more piece of mind. 
  
### Setup 

 click the `Fork` button at the top of the page
 click the `Clone&Download` button and copy it into your local CLI
 
 after the repo is copied make sure you run 
 
 `bundle install`
 `rake db:create`
 `rake db:migrate`
 
 now you are set up and ready to checkout out our API 
 
### Sign Up

  This endpoint will allow you to sign up for a api_key. Sorry no fancy views here this is the only way to get the api key
  that you deserve. Sorry for that! 
  
  *params*
    
    :email(required) = example@example.com
    :password(required) = example1
    :password_confirmation(required) = example1 
      (has to be the same as password)
      
  Example of what the request should look like. (*make sure to mark this as a POST request*)
  
  `https://sweater-weather-ss.herokuapp.com/api/v1/users?email=example@example.com&password=example1&password_confirmation=example1`
  
  Your response should look something like this: 
  
  `response_body = {
        :data => 
          {:attributes=>
            {:api_key=> AJGOIJ3Q409TUW5Y0QTE409, 
            :email=> example@example.com}, 
          :id=>"1", 
          :type=>"users"
      }}
      `
      
### Sign In

  This endpoint will allow you to sign into the app. again sorry for the lack of a form!!! I know that things can get a 
  little crazy some times so if you ever miss place your api key you can get it again by signing in! 
  
  *params* 
    
    :email(required) = example@example.com
    :password(required) = example1
      
 Example of what your request should look like (*make sure to mark this as a POST request*)
 
    `https://sweater-weather-ss.herokuapp.com/api/v1/sessions?email=#example@example.com&password=example1`
    
 Your response should look something like this:
 
    ` response_body = {
      :data => 
        {:attributes=>
          {:api_key=>clean_response[:data][:attributes][:api_key], 
          :email=>@user.email}, 
        :id=>"1", 
        :type=>"session"
        }}
        `
        
### Endpoints 

#### Backgrounds

  This endpoint gives you backgrounds for whatever location you type in. Your API key will be manditory for this query. please make sure you have a valid api key ready to use. 
  
  *params*
  
    :api_key(required) = <YOUR API KEY>
    :location(required) = example: Denver, co 
    
   Example of what the request should look like: 
   
   `https://sweater-weather-ss.herokuapp.com/api/v1/backgrounds?location=Denver,co&api_key=<YOUR_API_KEY>`
   
   Your Response should look something like this:
   
   ` response_body = {:data=>
  {:id=>nil,
   :type=>"destination_image",
   :attributes=>
    {:id=>nil,
     :image_1=>
      "https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg",
     :image_2=>
      "https://images.pexels.com/photos/3626622/pexels-photo-3626622.jpeg",
     :image_3=>
      "https://images.pexels.com/photos/3153198/pexels-photo-3153198.jpeg",
     :image_4=>
      "https://images.pexels.com/photos/3183165/pexels-photo-3183165.jpeg",
     :image_5=>
      "https://images.pexels.com/photos/2566581/pexels-photo-2566581.jpeg"}}}
    `
    
 #### Destination Forecast 
 
   This Endpoint is designed to provide you with the data of any destinations forecast infromation that is put into the argument
    
    *params*
    
      :location(required) = Denver, Co
      :api_key(required) = <YOUR_API_KEY>
      
    
   Example of how your request should look 
    
    `https://sweater-weather-ss.herokuapp.com/api/v1/forecast?location=Denver,Co&api_key=<YOUR_API_KEY>`
    
   Your Response should look something like this:
    
    `{"data"=>
    {"id"=>nil,
     "type"=>"destination_forecast",
     "attributes"=>
      {"id"=>nil,
       "lat"=>39.7392358,
       "lng"=>-104.990251,
       "current_temp"=>60.78,
       "feels_like"=>289.14,
       "humidity"=>26,
       "visibility"=>16093,
       "uv_index"=>7.93,
       "hourly_temp"=>60.78,
       "current_sunrise"=>1587384847,
       "current_sunset"=>1587433377,
       "friday"=>
        {"dt"=>1587405600,
         "sunrise"=>1587384847,
         "sunset"=>1587433377,
         "temp"=>
          {"day"=>289.14,
           "min"=>286.11,
           "max"=>291.78,
           "night"=>286.11,
                    . . . 
                    `
   
  ### Road Trip Planner
   
   This Endpoint provides you with essential data during a road trip. You can put in a starting point and an ending point and 
   it will return all the weather data you need to plan a perfect trip! 
   
   *params* 
    
    :origin(required) = Denver, Co
    :destination(required) = Pueblo, Co
    :api_key(required) = <YOUR_API_KEY>
    
   Your request should look something like this: 
   
   `https://sweater-weather-ss.herokuapp.com/api/v1/road_trip?origin=Denver,Co&destination=Pueblo,Co&api_key=<YOUR_API_KEY>`
   
   Your response should look something like this: 
   
   `response_body = {:data => 
      {:attributes=>  
        {:arrival_forecast=>42.64, 
        :id=>nil, 
        :lat=>38.2544472, 
        :lng=>-104.6091409, 
        :travel_time=>"1 hour 48 mins", 
        :weather_description=>"overcast clouds"}, 
        :id=>nil, 
        :type=>"road_trip"}
    }
    `
    
  
 
