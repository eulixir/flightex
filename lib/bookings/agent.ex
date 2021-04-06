defmodule Flightex.Bookings.Agent do
  alias Flightex.Bookings.Booking

  def start_link(%{}) do
    Agent.start(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, &update_state(&1, booking, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_order(&1, uuid))

  def list_all_bookings, do: Agent.get(__MODULE__, & &1)

  def get_order(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end

  defp update_state(state, %Booking{} = booking, uuid), do: Map.put(state, uuid, booking)
end
