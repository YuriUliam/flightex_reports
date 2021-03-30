defmodule Flightex.Factory do
  use ExMachina

  alias Flightex.Bookings.Booking
  alias Flightex.Users.User

  def user_factory do
    %User{
      cpf: "12345678911",
      email: "aldo@banana.com",
      id: "47459a49-b26d-4fbd-9553-9e91d8bff5ff",
      name: "Aldo"
    }
  end

  def booking_factory do
    %Booking{
      complete_date: ~N[2021-03-24 22:00:00.000],
      destiny_city: "Guarulhos",
      id: "2b37e7f4-4baa-49e2-973f-e3b983ad8a5c",
      origin_city: "Sao Paulo",
      user_id: "47459a49-b26d-4fbd-9553-9e91d8bff5ff"
    }
  end
end
