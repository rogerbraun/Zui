class Project < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, :through => :collaborations, :source => :user
  has_many :fragments

  attr_reader :collaborator_tokens

  def collaborator_tokens=(tokens)
    self.collaborator_ids = tokens.split(",")
  end
end
