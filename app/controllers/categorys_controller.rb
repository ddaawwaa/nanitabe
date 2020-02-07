class CategorysController < ApplicationController
  def index
  end

  def random
    # if flash[:random4].blank?
      @categorys = Category.order("RANDOM()").first(4)
      # flash[:random4] = @categorys.map{|ca| ca[:id]}
    # else
      
      # @categorys = Category.where(id: flash[:random4])
      # flash[:random4] = @categorys.map{|ca| ca[:id]}
    # end
  end

  def search
    require 'json'
    require 'net/https'
    require "uri"
    require "active_support/core_ext"

    keyid = ENV["GRN_ACCESS_KEY"]
    # if params[:station].blank?
      # flash.keep[:random4]
      # redirect_to action: 'random'
    # else
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
    # end
  end

end
