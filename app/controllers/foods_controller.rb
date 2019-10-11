class FoodsController < ApplicationController

  def index
    @foods = Food.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    @foods = Food.where('name LIKE(?)', "%#{params[:keyword]}%") #paramsとして送られてきたkeyword（入力された語句）で、foodモデルのnameカラムを検索し、その結果を@foodsに代入する
    respond_to do |format| 
      format.json { render 'index', json: @foods } #json形式のデータを受け取ったら、@foodsをデータとして返す そしてindexをrenderで表示する
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :email)
  end

end
