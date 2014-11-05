require 'test_helper'

class API::V1::CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { name: @candidate.name, party: @candidate.party }
    end

    assert_response 201
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

  test "should update candidate" do
    put :update, id: @candidate, candidate: { name: @candidate.name, party: @candidate.party }
    assert_response 204
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, id: @candidate
    end

    assert_response 204
  end
end
