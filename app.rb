require 'sinatra'
require 'sinatra/reloader'


require 'sendgrid-ruby'

include SendGrid



sg = SendGrid::API.new(api_key: ENV["SENDGRID"])


get "/" do
erb :index
end



post "/" do
puts params[:name], ENV["SENDGRID"]
to = Email.new(email: params[:email])
from = Email.new(email: 'scottsutrisno@gmail.com')
subject = params[:name]
content = Content.new(type: 'text/plain', value: params[:comment])
mail = Mail.new(from, subject, to, content)
response = sg.client.mail._('send').post(request_body: mail.to_json)

puts response.status_code
puts response.body
# puts response.parsed_body
puts response.headers
redirect "/thankyou"
end

get "/thankyou" do
erb :thankyou
end

get "/cookies" do
erb :cookies
end

get "/cakes" do
erb :cakes
end

get "/muffins" do
erb :muffins
end

