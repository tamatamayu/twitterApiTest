class TweetAdminUsersController < ApplicationController
  # ライブラリ群
  require 'twitter'

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

  # ツイートの検索
  def search
    admin_user = TweetAdminUser.find(params[:id])
    if admin_user == nil
      retEmptyJson
    else
      # Twitterクライアントの作成
      client = Twitter::REST::Client.new(
        consumer_key: admin_user.consumer_key,
        consumer_secret: admin_user.consumer_secret,
        access_token: admin_user.access_token,
        access_token_secret: admin_user.access_token_secret
      )
      # 結果を格納する配列
      tweetList = Array.new

      # 検索条件の設定
      search_hash_tag = "#ハッシュタグを入力"

      # count : 取得する件数 result_type : 内容指定。recentで最近の内容、popularで人気の内容。 exclude : 除外する内容。retweetsでリツイートを除外。 since_id : 指定ID以降から検索だが、検索結果が100件以上の場合は無効。
      result_tweets = client.search(search_hash_tag, count: 1000, result_type: "recent", exclude: "retweets", since_id: nil)
      result_tweets.take(10000).each do |tweet|
        tweetList.push(tweet)
      end
      insertTweetRecode(tweetList)
      result = {}
      result.store("textList",tweetList)
      p(result.size)
      render json: result
    end
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

    # 空のJSONレスポンスを返す
    def retEmptyJson
      render json: {}
    end

    # ツイート内容のインサート
    def insertTweetRecode(tweetList)
      tweetList.each do |tweet|
        # 4byte文字の削除
        text = tweet.text.each_char.select{|c| c.bytes.count < 4 }.join('')
        Tweet.create(tweet_text: text, tweet_create_at:tweet.created_at)
      end
    end
end
