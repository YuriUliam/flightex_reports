defmodule Flightex.Bookings.AgentTest do
  use ExUnit.Case
  use Agent

  import Flightex.Factory

  alias Flightex.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    test "saves the order" do
      order = build(:booking)

      BookingAgent.start_link()

      assert {:ok, _uuid} = BookingAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link()

      :ok
    end

    test "when the order is found, returns the order" do
      booking = build(:booking)

      {:ok, booking_id} = BookingAgent.save(booking)

      response = BookingAgent.get(booking_id)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = BookingAgent.get("invalid-id")

      expected_response = {:error, "Flight Booking not found"}

      assert response == expected_response
    end
  end
end
