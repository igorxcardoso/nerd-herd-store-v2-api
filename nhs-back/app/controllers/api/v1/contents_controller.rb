class Api::V1::ContentsController < ApplicationController
  before_action :set_content, only: %i[show update destroy]

  # GET api/v1/contents
  def index
    @content = Content.all

    render json: @content
  end

  # GET api/v1/contents/1
  def show
    if @content.nil?
      render json: ErrorSerializer.serialize(@content.errors), status: :unprocessable_entity
    else
      render json: @content
    end
  end

  # POST api/v1/contents
  def create
    @content = Content.new(content_params)

    if @content.save
      render json: @content, status: :created
    else
      render json: @content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/contents/1
  def update
    byebug
    if @content.update(content_params)
      render json: @content, status: :created
    else
      render json: @content.erros, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/contents/1
  def destroy
    @content.destroy
  end

  private

  def set_content
    @content = Content.find(params[:id])
  end

  def content_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end
end
