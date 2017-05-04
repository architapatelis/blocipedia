# wiki.rb is a Ruby class which represents the Wiki model
# This call will handle the logic and define the behavior of wikis

class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :private, presence: false
  validates :user, presence: true

  after_initialize { self.private ||= false }

  scope :publicly_visible, -> {where(private: false)}

  def public?
    true if self.private == false
  end

end
