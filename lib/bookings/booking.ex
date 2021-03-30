defmodule Flightex.Bookings.Booking do
  @keys [:id, :complete_date, :origin_city, :destiny_city, :user_id]
  @enforce_keys @keys

  defstruct @keys

  def build(complete_date, origin_city, destiny_city, user_id) do
    id = UUID.uuid4()

    {:ok,
     %__MODULE__{
       id: id,
       complete_date: NaiveDateTime.from_iso8601!(complete_date),
       origin_city: origin_city,
       destiny_city: destiny_city,
       user_id: user_id
     }}
  end
end
