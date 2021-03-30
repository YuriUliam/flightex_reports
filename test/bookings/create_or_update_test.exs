defmodule Flightex.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.CreateOrUpdate
  alias Flightex.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      Flightex.start_agents()

      booking_params = %{
        date: "2021-03-24 22:00:00.000",
        origin_city: "Sao Paulo",
        destiny_city: "Guarulhos"
      }

      {:ok, booking_params: booking_params}
    end

    test "when all params are valid, saves the order", %{
      booking_params: booking_params
    } do
      user_id = "94fdf0d7-11f5-4bdc-b4e2-7e57ad356cba"
      user = build(:user, id: user_id)

      UserAgent.save(user)

      response = CreateOrUpdate.call(user_id, booking_params)

      assert {:ok, _uuid} = response
    end

    test "when there is no user with given cpf, returns an error", %{
      booking_params: booking_params
    } do
      response = CreateOrUpdate.call("invalid-user-id", booking_params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
