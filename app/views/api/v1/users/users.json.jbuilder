json.users @users do |user|
  json.partial! 'essential_information', user: user, workday: @workday
end