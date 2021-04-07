defmodule Flightex.Bookings.ReportTest do
  use ExUnit.Case

  alias Flightex.Bookings.Report

  describe "generate/1" do
    setup do
      Flightex.start_agents()

      :ok
    end

    test "when called, return :ok" do
      Flightex.create_or_update_booking(%{
        complete_date: {:ok, ~N[2001-05-07 03:05:00]},
        local_origin: "Brasilia",
        local_destination: "Bananeiras",
        user_id: "12345678900",
        id: UUID.uuid4()
      })

      response = Report.generate("report-test.csv")

      assert response == {:ok, "Report created"}
    end
  end
end
