class HashTagsController < ApplicationController
  before_action :set_hash_tag, only: [:show, :update, :destroy]

  # GET /hash_tags
  def index
    @hash_tags = HashTag.all

    render json: @hash_tags
  end

  # GET /hash_tags/1
  def show
    render json: @hash_tag
  end

  # POST /hash_tags
  def create
    @hash_tag = HashTag.new(hash_tag_params)

    if @hash_tag.save
      render json: @hash_tag, status: :created, location: @hash_tag
    else
      render json: @hash_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hash_tags/1
  def update
    if @hash_tag.update(hash_tag_params)
      render json: @hash_tag
    else
      render json: @hash_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hash_tags/1
  def destroy
    @hash_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hash_tag
      @hash_tag = HashTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hash_tag_params
      params.require(:hash_tag).permit(:hash_tag_text, :tweet_id)
    end
end
