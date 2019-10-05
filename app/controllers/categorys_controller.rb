class CategorysController < ApplicationController
  def index
  end

  def random
    @categorys = Category.order("RANDOM()").first(4)
  end

  def search
  end

end
