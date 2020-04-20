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
      has to be the same as password
      
  Example of what the request should look like. (*make sure to mark this as a POST request*)
  
  `https://sweater-weather-ss.herokuapp.com/api/v1/users?email=example@example.com&password=example1&password_confirmation=example1`
      
### Endpoints 


#### Backgrounds

  This endpoint gives you backgrounds for whatever location you type in. Your API key will be manditory for this query. please make sure you have a valid api key ready to use. 
  
  *params*
  
    :api_key(required) = <YOUR API KEY>
    :location(required) = example: Denver, co 
    
   Example of what the request should look like: 
   
   `https://sweater-weather-ss.herokuapp.com/api/v1/backgrounds?location=Denver,co&api_key=<YOUR_API_KEY>`
   
   
    
 
