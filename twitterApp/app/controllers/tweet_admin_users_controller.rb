class TweetAdminUsersController < ApplicationController
  before_action :set_tweet_admin_user, only: [:show, :update, :destroy]

  # GET /tweet_admin_users
  def index
    @tweet_admin_users = TweetAdminUser.all

    render json: @tweet_admin_users
  end

  # GET /tweet_admin_users/1
  def show
    render json: @tweet_admin_user
  end

  # POST /tweet_admin_users
  def create
    @tweet_admin_user = TweetAdminUser.new(tweet_admin_user_params)

    if @tweet_admin_user.save
      render json: @tweet_admin_user, status: :created, location: @tweet_admin_user
    else
      render json: @tweet_admin_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweet_admin_users/1
  def update
    if @tweet_admin_user.update(tweet_admin_user_params)
      render json: @tweet_admin_user
    else
      render json: @tweet_admin_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweet_admin_users/1
  def destroy
    @tweet_admin_user.destroy
  end

  def search
    admin_user = TweetAdminUser.find(params[:id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_admin_user
      @tweet_admin_user = TweetAdminUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_admin_user_params
      params.require(:tweet_admin_user).permit(:name, :consumer_key, :consumer_secret, :access_token, :access_token_secret)
    end
end
