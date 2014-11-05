class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :candidate

  validates :voter, presence: true, uniqueness: true
  validates :candidate, presence: true

  def as_json(options)
	 hash = {vote_id: id,
		       voter_id: voter.id,
	         candidate_id: candidate.id}
   {vote: hash}
  end
end
