class CategorysController < ApplicationController
  def index
  end

  def random
    @categorys = Category.order("RANDOM()").first(4)
  end

  def search
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

    # SSL/TLS通信を有効にする
    http.use_ssl = true
    # HTTPのGETリクエストを表すクラス
    req = Net::HTTP::Get.new(uri)

    res = http.request(req)
    @results = JSON.parse(res.body)["rest"]
  end

end
