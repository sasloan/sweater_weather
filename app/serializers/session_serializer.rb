class SessionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email,
             :api_key
end