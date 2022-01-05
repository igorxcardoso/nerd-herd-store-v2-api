class Api::V1::DeliverysController < ApplicationController
  before_action :set_delivery, only: %i[show update destroy]

  # GET api/v1/deliverys
  def index
    @deliverys = Delivery.all

    render json: @deliverys
  end

  # GET api/v1/deliverys/1
  def show
    if @delivery.nil?
      render json: ErrorSerializer.serialize(@delivery.errors), status: :unprocessable_entity
    else
      render json: @delivery
    end
  end

  # POST api/v1/deliverys
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      render json: @delivery, status: :created
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/deliverys/1
  def update
    if @delivery.update(delivery_params)
      render json: @delivery, status: :created
    else
      render json: @delivery.erros, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/deliverys/1
  def destroy
    @delivery.destroy
  end

  private

  def set_delivery
    @delivery = Delivery.find(params[:id])
  end

  def delivery_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
