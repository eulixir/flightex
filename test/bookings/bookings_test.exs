defmodule Flightex.Bookings.BookingTest do
  use ExUnit.Case, async: false

  alias Flightex.Bookings.Booking

  describe "build/4" do
    test "when all params are valid, returns a booking" do
      response =
        Booking.build(
          {:ok, ~N[2001-05-07 01:46:20]},
          "Brasilia",
          "ilha das bananas",
          "12345678900"
        )

      {_ok, booking} = response

      expected_response =
        {:ok,
         %Flightex.Bookings.Booking{
           complete_date: {:ok, ~N[2001-05-07 01:46:20]},
           id: booking.id,
           local_destination: "ilha das bananas",
           local_origin: "Brasilia",
           user_id: "12345678900"
         }}

      assert response == expected_response
    end

    test "when have 3 params, returns an error" do
      response =
        Booking.build(
          {:ok, ~N[2001-05-07 01:46:20]},
          "Brasilia",
          "ilha das bananas"
        )

      assert response == {:error, "Need more parameters /1"}
    end

    test "when have 2 params, returns an error" do
      response =
        Booking.build(
          [2001, 5, 7, 1, 46, 20],
          "Brasilia"
        )

      assert response == {:error, "Need more parameters /2"}
    end

    test "when have 1 params, returns an error" do
      response = Booking.build([2001, 5, 7, 1, 46, 20])

      assert response == {:error, "Need more parameters /3"}
    end

    test "when no have params, returns an error" do
      response = Booking.build()

      assert response == {:error, "This function needed parameters /4"}
    end
  end
end
