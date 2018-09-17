json.user do 
  json.partial! 'essential_information', user: @user, workday: @workday
end