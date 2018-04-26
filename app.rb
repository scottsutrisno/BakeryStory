require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
include SendGrid






get "/" do
erb :index
end



post "/" do
cookies = "Cookies -- Caramel Cookie, Chocolate Chip Cookie, Chocolate Thumbprint Cookie, Gingerbread Cookie, Oatmeal Cookie, Sugar Cookie, Red Velvet Cookie, Peanut-Butter Cookie --//"
cakes = "Cakes -- Matcha Choco Crepes, Blackberry Cake, Carrot Cake, New York Cheesecake, Raspberry Cake, Red Velvet Cake, Linda's Fudge Cake, Strawberry Lemonade --//"
muffins = "Muffins -- Apple Pie Muffins, Blueberry Muffins, Chocolate Muffins, Pumpkin-Spice Muffins, Pistachio Muffins, Oatmeal Raisin Muffins, Reese's Cup Muffins, Assorted Muffins --// "
comment = ", Thanks for signing up for our catalog! Heres a list of all our tasty edibles: "
from = Email.new(email: 'scottsutrisno@gmail.com')
to = Email.new(email: params[:email])
subject = 'Edible Catalog'
content = Content.new(type: 'text/plain', value: "Hey " + params[:name] + comment + cookies + cakes + muffins )
mail = Mail.new(from, subject, to, content)
sg = SendGrid::API.new(api_key: ENV["SENDGRID"])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts params[:name], ENV["SENDGRID"]
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

