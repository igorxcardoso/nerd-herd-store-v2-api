class Api::V1::StocksController < ApplicationController
    # GET api/v1/stocks
  def index
    @stocks = Stock.all

    render json: @stocks
  end

  # GET api/v1/stocks/1
  def show
    @stock = Stock.find(params[:id])

    if @stock.nil?
      render json: ErrorSerializer.serialize(@stock.errors), status: :unprocessable_entity
    else
      render json: @stock
    end
  end

  # POST api/v1/stocks
  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      render json: @stock, status: :created
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/stocks/1
  def update
  end

  # DELETE api/v1/stocks/1
  def destroy
    @stock.destroy
  end

  private

  def stock_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
