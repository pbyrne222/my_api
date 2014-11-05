class API::V1::CandidatesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_candidate, only: [:show]

  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])

    render json: @candidate
  end

  private

  def load_candidate
    @candidate = Candidate.find(params[:id])
  end
end
