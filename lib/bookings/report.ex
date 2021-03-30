defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def create(filename \\ "report.csv") do
    order_list = build_booking_list()

    File.write("reports/#{filename}", order_list)
  end

  defp build_booking_list() do
    BookingAgent.get_all()
    |> Map.values()
    |> Enum.map(&booking_string(&1))
  end

  defp booking_string(%Booking{
         complete_date: complete_date,
         destiny_city: destiny_city,
         origin_city: origin_city,
         user_id: user_id
       }) do
    "#{user_id},#{origin_city},#{destiny_city},#{complete_date}\n"
  end
end
