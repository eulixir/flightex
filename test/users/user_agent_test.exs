defmodule Flightex.Users.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent

  describe "save/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "save the users" do
      user = build(:users)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      id = UUID.uuid4()
      cpf = "12345678900"

      {:ok, id: id, cpf: cpf}
    end

    test "when the user is found, returns the user", %{id: id, cpf: cpf} do
      :users
      |> build(id: id, cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok, %Flightex.Users.User{cpf: cpf, email: "jp@banana.com", id: id, name: "Jp"}}

      assert response == expected_response
    end

    test "when the user is't founded, returns an error", %{id: id, cpf: cpf} do
      :users
      |> build(id: id, cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get("banana")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
