json.id             user.id
json.first_name     user.first_name
json.last_name      user.last_name
json.email          user.email
json.phone          user.phone
json.gender         user.gender
if workday
  json.partial! 'workday', user: user
end