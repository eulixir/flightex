defmodule Flightex.Bookings.Booking do
  @keys [:complete_date, :local_origin, :local_destination, :user_id, :id]
  @enforce_keys @keys
  defstruct @keys

  def build( naiveTime, local_origin, local_destination, user_id) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       complete_date: naiveTime,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: user_id
     }}
  end

  def build(_complete_date, _local_origin, _local_destination),
    do: {:error, "Need more parameters /1"}

  def build(_complete_date, _local_origin), do: {:error, "Need more parameters /2"}
  def build(_complete_date), do: {:error, "Need more parameters /3"}
  def build(), do: {:error, "This function needed parameters /4"}
end
