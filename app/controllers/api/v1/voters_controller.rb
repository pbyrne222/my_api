class API::V1::VotersController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :set_voter, only: [:update, :show]
  before_filter :restrict_access_to_voter, only: [:update, :show]

  def show
    @voter = Voter.find(params[:id])

    render json: @voter
  end


  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter, status: :created
    else
      render json: @voter.errors, status: :bad_request
    end
  end

  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      render json: @voter, status: :ok
    else
      render json: @voter.errors, status: :bad_request
    end
  end

  private

  def voter_params
    params.require(:voter).permit(:name, :party)
  end

  def set_voter
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_voter
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

end
