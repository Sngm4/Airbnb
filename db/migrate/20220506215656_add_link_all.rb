class AddLinkAll < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :city, foreign_key: true
    add_reference :reservations, :listing, foreign_key: true
    add_reference :city, :listing, foreign_key: true
  end
end
