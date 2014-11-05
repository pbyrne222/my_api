require 'test_helper'

class API::V1::VotesControllerTest < ActionController::TestCase
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:votes)
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post :create, vote: { candidate: @vote.candidate, voter: @vote.voter }
    end

    assert_response 201
  end

  test "should show vote" do
    get :show, id: @vote
    assert_response :success
  end

  test "should update vote" do
    put :update, id: @vote, vote: { candidate: @vote.candidate, voter: @vote.voter }
    assert_response 204
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete :destroy, id: @vote
    end

    assert_response 204
  end
end
