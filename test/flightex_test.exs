defmodule FlightexTest do
  use ExUnit.Case

  alias Flightex.Users.Agent, as: UserAgent

  describe "create_user/1" do
    test "creates the user" do
      UserAgent.start_link()

      user_params = %{name: "Aldo", email: "aldo@banana.com", cpf: "12345678911"}

      assert {:ok, _uuid} = Flightex.create_user(user_params)
    end
  end

  describe "create_booking/2" do
    setup do
      Flightex.start_agents()

      booking_params = %{
        date: "2021-03-24 22:00:00.000",
        origin_city: "Sao Paulo",
        destiny_city: "Guarulhos"
      }

      {:ok, booking_params: booking_params}
    end

    test "when all params area valid, returns the booking", %{booking_params: booking_params} do
      user_params = %{name: "Aldo", email: "aldo@banana.com", cpf: "12345678911"}

      {:ok, user_id} = Flightex.create_user(user_params)

      assert {:ok, _uuid} = Flightex.create_booking(user_id, booking_params)
    end

    test "when user id is invalid, returns an error", %{booking_params: booking_params} do
      response = Flightex.create_booking("invalid-user-id", booking_params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end

  describe "get_booking/1" do
    setup do
      Flightex.start_agents()

      :ok
    end

    test "when all params are valid, returns the booking" do
      user_params = %{name: "Aldo", email: "aldo@banana.com", cpf: "12345678911"}

      booking_params = %{
        date: "2021-03-24 22:00:00.000",
        origin_city: "Sao Paulo",
        destiny_city: "Guarulhos"
      }

      {:ok, user_id} = Flightex.create_user(user_params)
      {:ok, booking_id} = Flightex.create_booking(user_id, booking_params)

      assert {:ok, _uuid} = Flightex.get_booking(booking_id)
    end

    test "when booking id is invalid, returns an error" do
      response = Flightex.get_booking("generic-id")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
