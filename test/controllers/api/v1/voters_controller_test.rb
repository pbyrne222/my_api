require 'test_helper'

class API::V1::VotersControllerTest < ActionController::TestCase
  setup do
    @voter = voters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voters)
  end

  test "should create voter" do
    assert_difference('Voter.count') do
      post :create, voter: { name: @voter.name, party: @voter.party }
    end

    assert_response 201
  end

  test "should show voter" do
    get :show, id: @voter
    assert_response :success
  end

  test "should update voter" do
    put :update, id: @voter, voter: { name: @voter.name, party: @voter.party }
    assert_response 204
  end

  test "should destroy voter" do
    assert_difference('Voter.count', -1) do
      delete :destroy, id: @voter
    end

    assert_response 204
  end
end
