class FoodsController < ApplicationController

  def index
    @foods = Gohan.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

end
