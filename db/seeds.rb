# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "open-uri"

50.times do |number|
  begin
    url = "http://portal.starterleague.com/courses/#{number}.json"
    raw_response = open(url).read
    parsed_response = JSON.parse(raw_response)
    tsl_alumnis = parsed_response['students']
  rescue Exception => e
    puts e
    tsl_alumnis = []
  end
  tsl_alumnis.each do |tsl_alumni|
    alumni = User.new
    alumni.tsl_key = SecureRandom.uuid
    alumni.password = alumni.tsl_key
    alumni.password_confirmation = alumni.tsl_key
    alumni.first_name = tsl_alumni['first_name']
    alumni.last_name = tsl_alumni['last_name']
    alumni.github_id = tsl_alumni['github']
    alumni.twiter_id = tsl_alumni['twitter']
    puts "#{alumni.save}:  #{alumni.first_name}  #{alumni.last_name}"
  end
end
