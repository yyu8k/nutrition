class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  def index
    @records = Record.all
    @foods = Food.all
  end

  def show
  end

  def new
    @record = Record.new
    @foods = Food.new(params[:food_id])
  end

  def edit
  end

  def create
    # binding.pry
    @record = Record.new(record_params)
    @foods = Food.all
    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        redirect_to food_path
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:date, {food_ids: []}).merge(user_id: current_user.id)
    end

end
