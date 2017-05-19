require 'test_helper'

class HashTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hash_tag = hash_tags(:one)
  end

  test "should get index" do
    get hash_tags_url, as: :json
    assert_response :success
  end

  test "should create hash_tag" do
    assert_difference('HashTag.count') do
      post hash_tags_url, params: { hash_tag: { hash_tag_text: @hash_tag.hash_tag_text, tweet_id: @hash_tag.tweet_id } }, as: :json
    end

    assert_response 201
  end

  test "should show hash_tag" do
    get hash_tag_url(@hash_tag), as: :json
    assert_response :success
  end

  test "should update hash_tag" do
    patch hash_tag_url(@hash_tag), params: { hash_tag: { hash_tag_text: @hash_tag.hash_tag_text, tweet_id: @hash_tag.tweet_id } }, as: :json
    assert_response 200
  end

  test "should destroy hash_tag" do
    assert_difference('HashTag.count', -1) do
      delete hash_tag_url(@hash_tag), as: :json
    end

    assert_response 204
  end
end
