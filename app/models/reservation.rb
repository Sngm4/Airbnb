class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :listing

  validates :start_must_be_before_end_time

  def start_must_be_before_end_time
    errors.add(:start_date, "must be before end date") unless
      start_date < end_date
  end
end
