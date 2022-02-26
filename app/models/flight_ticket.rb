class FlightTicket < ApplicationRecord
  #belongs_to :user
  belongs_to :departure, class_name: 'Airport'
  belongs_to :arrival, class_name: 'Airport'
  has_many :purchase
  validates :airline_code, presence: true
  validates :ticket_number, presence: true, numericality: { only_integer: true }, length: { is: 13 }
  validates :departure_at, presence: true
  validate :fields_a_and_b_are_different
  validates :flight_number, format: { with: /\A[a-zA-z]{2}[\d]{3,4}\z/, message: "please enter flight in correct format: 2 letters and 3-4digits"}

  def fields_a_and_b_are_different
    if self.departure_id == self.arrival_id
      errors.add(:arrival_id, 'arrival and departure must be different')
      errors.add(:departure_id, 'arrival and departure must be different')
      #errors.add(:arrival_id, 'must be different to departure')
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :departure_id, :arrival_id ],
    using: {
      tsearch: { prefix: true }
    }
end
