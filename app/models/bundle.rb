class Bundle < ActiveRecord::Base
  has_many :games, :inverse_of => :bundle
  has_many :issues, :through => :games

  STATES = [
      ['Planned', :planned],
      ['In Development', :development],
      ['Pending Release', :pending],
      ['Active', :active],
      ['Completed', :completed]
  ]

  validates_presence_of :name, :state, :description
  validates_inclusion_of :state, :in => STATES.map { |m| m.second.to_s }, :message => "state %{value} is not a valid state"
end
