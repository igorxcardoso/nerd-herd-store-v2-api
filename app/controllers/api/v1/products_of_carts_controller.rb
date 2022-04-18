class Api::V1::ProductsOfCartsController < ApplicationController
  before_action :set_products_of_cart, only: %i[show update destroy]

  # GET api/v1/products_of_carts
  def index
    @products_of_carts = ProductsOfCart.all
    render(json: @products_of_carts)
  end

  # GET api/v1/products_of_carts/1
  def show
    if @products_of_cart.nil?
      render json: ErrorSerializer.serialize(@products_of_cart.errors), status: :unprocessable_entity
    else
      render json: @products_of_cart
    end
  end

  # POST api/v1/products_of_carts
  def create
    @products_of_cart = ProductsOfCart.new(products_of_cart_params)

    if @products_of_cart.save
      render json: @products_of_cart, status: :created
    else
      render json: @products_of_cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/products_of_carts/1
  def update
    if @products_of_cart.update(products_of_cart_params)
      render json: @products_of_cart, status: :created
    else
      render json: @products_of_cart.erros, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/products_of_carts/1
  def destroy
    @products_of_cart.destroy
  end


  private

  def set_products_of_cart
    # @products_of_cart = ProductsOfCart.includes(:stocks, :contents).find_by_id(params[:id])
    @products_of_cart = ProductsOfCart.find_by_id(params[:id])
  end

  def products_of_cart_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params) # Deserialization of params
  end
end
