class Comment < ActiveRecord::Base
  belongs_to :fragment
  belongs_to :user

  validates_presence_of :fragment, :user

  has_ancestry
end
