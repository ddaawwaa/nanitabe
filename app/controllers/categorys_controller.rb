class CategorysController < ApplicationController
  def index
    @categorys = Category.order("RANDOM()").first(4)
  end

  def random
  end

  def result
    require 'json'
    require 'net/https'
    require "uri"
    require "active_support/core_ext"

    keyid = ENV["GRN_ACCESS_KEY"]
    data={"keyid": keyid,
          "category_s": params[:category][:name],
          "freeword": params[:station]
          }
    query=data.to_query
    uri = URI("https://api.gnavi.co.jp/RestSearchAPI/v3/?"+query)


    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Get.new(uri)

    res = http.request(req)
    @results = JSON.parse(res.body)["rest"]
  end
end
