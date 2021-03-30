defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Booking

  describe "build/3" do
    test "when all params are valid, returns the user" do
      %{id: user_id} = build(:user)

      assert {:ok, _id} =
               Booking.build("2021-03-24 22:00:00.000", "Sao Paulo", "Guarulhos", user_id)
    end
  end
end
