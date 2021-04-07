defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def call(%{
        complete_date: naiveTime,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }) do
    naiveTime
    |> Booking.build(local_origin, local_destination, user_id)
    |> save_booking()
  end

  defp save_booking({:ok, %Booking{} = booking}), do: BookingAgent.save(booking)
end
