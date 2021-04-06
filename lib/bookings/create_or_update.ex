defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def call(%{complete_date: [year, month, day, hour, minute, second], local_origin: local_origin, local_destination: local_destination, user_id: user_id}) do
    [year, month, day, hour, minute, second]
    |> Booking.build(local_origin, local_destination, user_id)
    |> save_booking()
  end

  defp save_booking({:ok, %Booking{} = booking}), do: BookingAgent.save(booking)

  defp save_booking({:error, _reason} = error), do: error

end
