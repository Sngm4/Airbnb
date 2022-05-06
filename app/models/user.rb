class User < ApplicationRecord
  has_many :reservations, foreign_key: 'guest_id', class_name: "Reservation"
  has_many :listings, foreign_key: 'admin_id', class_name: "Listing"
  
  validates :email,
    presence: true,
    uniqueness: true
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Please enter a valid email adress." }


  validates :phone_number,
    presence: true,
    format: { with: /\A(?:(?:+|00)33[\s.-]{0,3}(?:(0)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Please enter a valid french number." }
end

