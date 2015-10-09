defmodule BdPro.UserTest do
  use BdPro.ModelCase
  import BdPro.Factories
  alias BdPro.User

  test "setting the password digest" do
    changeset = User.changeset(%User{}, %{email: "test@test.com", password: "password"})
    {:ok, user} = Repo.insert(changeset)
    assert user.password_digest
  end

  setup do
    {:ok, user: create(:user, password: "valid_password")}
  end
  
  test "authenticate with a valid password", %{user: user} do
    assert {:ok} = User.authenticate(user, "valid_password") 
  end

  test "authenticate with an invalid password", %{user: user} do
    assert {:error, :unauthorized} = User.authenticate(user, "invalid_password") 
  end
end
