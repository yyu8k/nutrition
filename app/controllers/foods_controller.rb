class FoodsController < ApplicationController

  def index
    @foods = Gohan.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    @foods = Food.where('name LIKE(?)', "%#{params[:keyword]}%") #paramsとして送られてきたkeyword（入力された語句）で、Gohanモデルのnameカラムを検索し、その結果を@gohansに代入する
    respond_to do |format| 
      format.json { render 'index', json: @foods } #json形式のデータを受け取ったら、@gohansをデータとして返す そしてindexをrenderで表示する
    end
  end

end
