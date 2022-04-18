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
    # if check_availability(@shopping_cart) && @shopping_cart.update(delivery_params)
    if @shopping_cart.update(total_price: sum_price_shopping_car)
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

  # def check_availability(shopping_carts)
  #   @products_of_cart = ProductsOfCart.where(shopping_cart_id: shopping_carts.id)
  #   # stock = Stock.find_by(product_id: )
  #   byebug
  #   true
  # end

  def sum_price_shopping_car
    sum = @shopping_cart.total_price
    @products_of_cart = ProductsOfCart.where(shopping_cart_id: @shopping_cart.id)
    @products_of_cart.each do |p|
      total = p.length_product*p.price_for_product
      sum += total-(total*p.off_for_product)
    end
    sum
  end


  def set_shopping_cart
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  def delivery_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
