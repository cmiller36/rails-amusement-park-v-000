class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction


  def tall_enough
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets
    self.user.tickets >= self.attraction.tickets
  end

  def ride_update
    self.user.update(
      tickets: user.tickets - attraction.tickets,
      nausea: user.nausea + attraction.nausea_rating,
      happiness: user.happiness + attraction.happiness_rating
    )
  end

  def take_ride
    if tall_enough && enough_tickets
      ride_update
      "Thanks for riding the #{attraction.name}!"
    elsif !tall_enough && !enough_tickets
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !tall_enough && enough_tickets
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{attraction.name}."
    end
  end


end
