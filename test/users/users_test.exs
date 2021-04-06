defmodule Flightex.Users.UserTest do
  use ExUnit.Case

  alias Flightex.Users.User

  import Flightex.Factory

  describe "build/4" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Jp",
          "jp@banana.com",
          "12345678900"
        )

      {_ok, id} = response

      expected_response = {:ok, build(:users, id: id.id)}

      assert response == expected_response
    end

    test "when cpf is a integer" do
      response =
        User.build(
          "Jp",
          "jp@banana.com",
          112_250_055
        )

      expected_response = {:error, "Cpf must be a String"}

      assert response == expected_response
    end

    test "when reached 2 params" do
      response =
        User.build(
          "Jp",
          "jp@banana.com"
        )

      expected_response = {:error, "Need more Parameters"}

      assert response == expected_response
    end

    test "when reached 1 params" do
      response = User.build("Jp")

      expected_response = {:error, "Need more Parameters"}

      assert response == expected_response
    end

    test "when no reached params" do
      response = User.build()

      expected_response = {:error, "This function need parameters"}

      assert response == expected_response
    end
  end
end
