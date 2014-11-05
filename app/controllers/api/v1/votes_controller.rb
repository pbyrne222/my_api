class VotesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :restrict_access, only: [:create]


  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created
    else
      render json: @vote.errors, status: :bad_request
    end
  end

  private

    def vote_params
      params.require(:vote).permit(:voter_id, :candidate_id)
    end

    def restrict_access
      unless @voter.token == params[:token]
       render nothing: true, status: :unauthorized
      end
    end
end
