defmodule BdPro.SigningInFeature do
  use BdPro.FeatureCase
  import BdPro.Factories
  alias BdPro.SignInPage

  setup do
    {:ok, %{user: create(:user)}}
  end

  test "Signing in with valid credentials", %{user: user} do
    SignInPage.visit
    SignInPage.sign_in(email: user.email, password: user.password)
    assert SignInPage.signed_in?
  end
end

