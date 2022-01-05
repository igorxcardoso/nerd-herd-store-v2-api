class Api::V1::ShoppingCartsController < ApplicationController
  before_action :set_shopping_cart, only: %i[show update destroy]

  # GET api/v1/shopping_carts
  def index
    @shopping_carts = ShoppingCart.all

    render json: @shopping_carts
  end

  # GET api/v1/shopping_carts/1
  def show
    if @shopping_cart.nil?
      render json: ErrorSerializer.serialize(@shopping_cart.errors), status: :unprocessable_entity
    else
      render json: @shopping_cart
    end
  end

  # POST api/v1/shopping_carts
  def create
    @shopping_cart = ShoppingCart.new(delivery_params)

    if @shopping_cart.save
      render json: @shopping_cart, status: :created
    else
      render json: @shopping_cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/shopping_carts/1
  def update
    if @shopping_cart.update(delivery_params)
      render json: @shopping_cart, status: :created
    else
      render json: @shopping_cart.erros, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/shopping_carts/1
  def destroy
    @shopping_cart.destroy
  end

  private

  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  def delivery_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
