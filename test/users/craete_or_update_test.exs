defmodule Flightex.Users.CreateOrUpdateTest do
  use ExUnit.Case

  import Flightex.Factory

  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate

  describe "call/1" do
    test "when all params are valid, saves the user" do
      user = build(:user)

      UserAgent.start_link()

      assert {:ok, _uuid} = CreateOrUpdate.call(user)
    end
  end
end
