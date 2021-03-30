defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking
  alias Flightex.Users.Agent, as: UserAgent

  def call(user_id, %{date: date, origin_city: origin_city, destiny_city: destiny_city}) do
    with {:ok, _user} <- UserAgent.get(user_id) do
      date
      |> Booking.build(origin_city, destiny_city, user_id)
      |> save_booking()
    else
      error -> error
    end
  end

  defp save_booking({:ok, %Booking{} = booking}) do
    BookingAgent.save(booking)
  end
end
