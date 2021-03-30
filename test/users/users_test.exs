defmodule Flightex.Users.UserTest do
  use ExUnit.Case

  alias Flightex.Users.User

  describe "build/3" do
    test "when all params are valid, returns the user" do
      assert {:ok, _uuid} = User.build("Aldo", "aldo@banana.com", "12345678911")
    end
  end
end
