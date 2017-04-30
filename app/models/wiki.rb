# wiki.rb is a Ruby class which represents the Wiki model
# This call will handle the logic and define the behavior of wikis

class Wiki < ActiveRecord::Base
  belongs_to :user


  #validates :title, length: {minimum: 5}, presence: true
  #validates :body, length: {minimum: 20}, presence: true

  #validates :user, presence: true
end
