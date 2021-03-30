defmodule Flightex.Bookings.ReportTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Bookings.Report
  alias Flightex.Bookings.Agent, as: BookingAgent

  describe "create/1" do
    test "creates the report file" do
      BookingAgent.start_link()

      :booking
      |> build()
      |> BookingAgent.save()

      :booking
      |> build(id: "36fa5626-34d8-4bdf-8545-195419dc3af4")
      |> BookingAgent.save()

      expected_response =
        "47459a49-b26d-4fbd-9553-9e91d8bff5ff,Sao Paulo,Guarulhos,2021-03-24 22:00:00.000\n" <>
          "47459a49-b26d-4fbd-9553-9e91d8bff5ff,Sao Paulo,Guarulhos,2021-03-24 22:00:00.000\n"

      Report.create("report_test.csv")

      response = File.read!("reports/report_test.csv")

      assert response == expected_response
    end
  end
end
