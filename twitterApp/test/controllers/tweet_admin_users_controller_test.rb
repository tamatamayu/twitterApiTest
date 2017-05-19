require 'test_helper'

class TweetAdminUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet_admin_user = tweet_admin_users(:one)
  end

  test "should get index" do
    get tweet_admin_users_url, as: :json
    assert_response :success
  end

  test "should create tweet_admin_user" do
    assert_difference('TweetAdminUser.count') do
      post tweet_admin_users_url, params: { tweet_admin_user: { access_token: @tweet_admin_user.access_token, access_token_secret: @tweet_admin_user.access_token_secret, consumer_key: @tweet_admin_user.consumer_key, consumer_secret: @tweet_admin_user.consumer_secret, name: @tweet_admin_user.name } }, as: :json
    end

    assert_response 201
  end

  test "should show tweet_admin_user" do
    get tweet_admin_user_url(@tweet_admin_user), as: :json
    assert_response :success
  end

  test "should update tweet_admin_user" do
    patch tweet_admin_user_url(@tweet_admin_user), params: { tweet_admin_user: { access_token: @tweet_admin_user.access_token, access_token_secret: @tweet_admin_user.access_token_secret, consumer_key: @tweet_admin_user.consumer_key, consumer_secret: @tweet_admin_user.consumer_secret, name: @tweet_admin_user.name } }, as: :json
    assert_response 200
  end

  test "should destroy tweet_admin_user" do
    assert_difference('TweetAdminUser.count', -1) do
      delete tweet_admin_user_url(@tweet_admin_user), as: :json
    end

    assert_response 204
  end
end
