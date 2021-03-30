defmodule Flightex.Users.AgentTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.User

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link()

      assert {:ok, _uuid} = UserAgent.save(user)
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link()

      user_id = "040837f5-4d15-48ee-b1aa-ce25c12e35d4"

      {:ok, user_id: user_id}
    end

    test "when the user is found, returns the user", %{user_id: user_id} do
      :user
      |> build(id: user_id)
      |> UserAgent.save()

      response = UserAgent.get(user_id)

      expected_response =
        {:ok,
         %User{
           cpf: "12345678911",
           email: "aldo@banana.com",
           id: "040837f5-4d15-48ee-b1aa-ce25c12e35d4",
           name: "Aldo"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("invalid-id")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
