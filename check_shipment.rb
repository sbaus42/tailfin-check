#!/usr/bin/env ruby
require 'httparty'
require 'nokogiri'
require 'twilio-ruby'
require 'pry'
require_relative './secrets'

page = HTTParty.get SITE
status = page["parcels"]["parcel"]["deliveryStatus"]["status"]
entries = 8

if status.length > entries
  # Load client
  @client = Twilio::REST::Client.new SID, AUTH

  # Send sms
  @client.messages.create(
   from: TWI_NUMBA,
   to: MY_NUMBA,
   body: "New entry (there are now #{status.length})at #{SITE}"
  )
end
