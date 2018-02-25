require 'httparty'
require 'nokogiri'
require 'twilio-ruby'
require 'pry'
load 'secrets.rb'

page = HTTParty.get SITE
status = page["parcels"]["parcel"]["deliveryStatus"]["status"]

if status.length > 7
  # Load client
  @client = Twilio::REST::Client.new SID, AUTH

  # Send sms
  @client.messages.create(
   from: TWI_NUMBA,
   to: MY_NUMBA,
   body: "New entry at #{SITE}"
  )
end
