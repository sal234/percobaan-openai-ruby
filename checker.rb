require 'mongo'
require 'byebug'

class Checker
  dbMongo = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'db_analytic')

  years = 2020..2021
  months = 1..12
  days = 1..31

  db = dbMongo.database

  collection = db[:content_offer_daily]

  years.each do |year|
    months.each do |month|
      days.each do |day|
        date="#{year}-#{"%02d" % month}-#{"%02d" % day}"
        data = collection.find( { date: date } ).first
        if data.nil?
          puts "========== data #{date} tidak ada =========="
        else
          puts "========== DATA #{date} ADA =========="
          puts data["total_impression"]
        end
        # puts "#{year}-#{month+i}-#{day}"
        # puts "%02d" % month
      end
    end
  end
end
