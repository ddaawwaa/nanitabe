# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'net/https'
require "uri"
require "active_support/core_ext"

keyid = GRN_ACCESS_KEY

data={"keyid": keyid,
      "lang": "ja"
      }

query=data.to_query
uri = URI("https://api.gnavi.co.jp/master/CategorySmallSearchAPI/v3/?"+query)

http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = true
req = Net::HTTP::Get.new(uri)

res = http.request(req)
result = JSON.parse(res.body)

categorys = result["category_s"]

categorys.each do |cate|
	Category.create(name: cate["category_s_name"], code: cate["category_s_code"])
end