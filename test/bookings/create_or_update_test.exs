defmodule Flightex.Bookings.CreateOrUpdateTest do
  use ExUnit.Case, async: false

  alias Flightex.Bookings.{CreateOrUpdate, Agent}

  describe "call/1" do
    setup do
      Agent.start_link(%{})

      :ok
    end

    test "when all params are valid, returns an :ok and booking uuid" do
      params = %{
        complete_date: [2001, 5, 7, 3, 5, 0],
        local_origin: "Brasilia",
        local_destination: "Bananeiras",
        user_id: "12345678900",
        id: UUID.uuid4()
      }

      response = CreateOrUpdate.call(params)

      {_ok, uuid} = response

      assert response == {:ok, uuid}
    end
  end
end
