class Api::V1::ProductsController < ApplicationController

  # GET api/v1/products
  def index
    @products = Product.all

    render json: @products
  end

  # GET api/v1/products/1
  def show
    @product = Product.find(params[:id])

    if @product.nil?
      render json: ErrorSerializer.serialize(@product.errors), status: :unprocessable_entity
    else
      render json: @product
    end
  end

  # POST api/v1/products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/products/1
  def update
  end

  # DELETE api/v1/products/1
  def destroy
    @product.destroy
  end

  private

  def product_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params) # Deserialization of params
  end
end
