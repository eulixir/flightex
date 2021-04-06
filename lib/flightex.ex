defmodule Flightex do

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate, as: CreateOrUpdateUser

  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.CreateOrUpdate, as: CreateOrUpdateBookings

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call

  defdelegate create_or_update_booking(params), to: CreateOrUpdateBookings, as: :call

  # Flightex.create_or_update_booking(%{complete_date: [2001, 5, 7, 3, 5, 0], local_origin: "Brasilia", local_destination: "Bananeiras", user_id: "201921613"})
end
