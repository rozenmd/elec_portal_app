require 'test_helper'

class RssFeedsControllerTest < ActionController::TestCase
  setup do
    @rss_feed = rss_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_feed" do
    assert_difference('RssFeed.count') do
      post :create, rss_feed: { max_items: @rss_feed.max_items, user_id: @rss_feed.user_id }
    end

    assert_redirected_to rss_feed_path(assigns(:rss_feed))
  end

  test "should show rss_feed" do
    get :show, id: @rss_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_feed
    assert_response :success
  end

  test "should update rss_feed" do
    put :update, id: @rss_feed, rss_feed: { max_items: @rss_feed.max_items, user_id: @rss_feed.user_id }
    assert_redirected_to rss_feed_path(assigns(:rss_feed))
  end

  test "should destroy rss_feed" do
    assert_difference('RssFeed.count', -1) do
      delete :destroy, id: @rss_feed
    end

    assert_redirected_to rss_feeds_path
  end
end
