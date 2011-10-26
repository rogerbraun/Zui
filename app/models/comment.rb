class Comment < ActiveRecord::Base
  acts_as_taggable
  belongs_to :fragment
  belongs_to :user

  validates_presence_of :fragment, :user

  has_ancestry
end
