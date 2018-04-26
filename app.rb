require 'sinatra'
require 'sinatra/reloader'
require 'sendgrid-ruby'
require 'sinatra/content_for'
include SendGrid






get "/" do
erb :index
end



post "/" do


from = Email.new(email: 'scottsutrisno@gmail.com')
to = Email.new(email: params[:email])
subject = 'Edible Catalog'
content = Content.new(type: 'text/html', value:

    "<p><strong><u>Congratulations, you have subscribed to Edibleland's Catalog.</u></strong></p>
    <br>
    <br>
    <br>
    <p><strong><u>This is our list of Edibles!</u></strong><p>
    <br>
    <br>
        <ul>
        <h5>Cookies:</h5>
            <li>Caramel Cookie --- $2/cookie ... $10/lb</li>
            <li>Chocolate Chip Cookie --- $1/cookie ... $8/lb</li>
            <li>Chocolate Thumbprint Cookie --- $1/cookie ... $8/lb</li>
            <li>Gingerbread Cookie --- $1/cookie ... $8/lb</li>
            <li>Oatmeal Cookie --- $2.50/cookie ... $12/lb</li>
            <li>Sugar Cookie --- $1/cookie ... $8/lb</li>
            <li>Red Velvet Cookie --- $2/cookie ... $10/lb</li>
            <li>Peanut-Butter Cookie --- $2/cookie ... $10/lb</li>
        </ul>
    <br>
        <ul>
        <h5>Cakes:</h5>
            <li>Matcha Choco Crepes --- $15 Per Slice ... $70 Whole Cake</li>
            <li>Blackberry Cake --- $6 Per Slice ... $36 Whole Cake</li>
            <li>Carrot Cake --- $8 Per Slice $40 ... Whole Cake</li>
            <li>New York Cheesecake --- $6 Per ... Slice $36 Whole Cake</li>
            <li>Raspberry Cake --- $8 Per Slice ... $36 Whole Cake</li>
            <li>Red Velvet Cake --- $10 Per Slice ... $46 Whole Cake</li>
            <li>Linda's Fudge Cake --- $15 Per Slice ... $70 Whole Cake</li>
            <li>Strawberry Lemonade --- $15 Per Slice ... $70 Whole Cake</li>
        </ul>
    <br>
        <ul>
        <h5>Muffins:</h5>
            <li>Apple Pie Muffins --- $10halfdozen...$20dozen</li>
            <li>Blueberry --- $10halfdozen ... $20dozen</li>
            <li>Chocolate Muffins --- $10halfdozen ... $20dozen</li>
            <li>Pumpkin-Spice Muffins --- $10halfdozen ... $20dozen</li>
            <li>Pistachio Muffins --- $10halfdozen ... $22dozen</li>
            <li>Oatmeal Raisin Muffins --- $10halfdozen ... $20dozen</li>
            <li>Reese's Cup Muffins --- $10halfdozen ... $20dozen</li>
            <li>Assorted Muffins --- $-halfdozen ... $-dozen</li>
        </ul>")
mail = Mail.new(from, subject, to, content)
sg = SendGrid::API.new(api_key: ENV["SENDGRID"])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts params[:name], "Your Form is working my guy!"
puts response.status_code
puts response.body
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

