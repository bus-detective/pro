defmodule BdPro.SignInPage do
  use BdPro.Page

  def visit do
    navigate_to("/session/new")
  end

  def sign_in(email: email, password: password) do
    fill_field({:css, ".qa-session-email"}, email)
    fill_field({:css, ".qa-session-password"}, password)
    click({:css, ".qa-session-submit"})
  end

  def sign_out do
    click({:css, ".qa-sign-out"})
  end

  def signed_in? do
    has_css?(".qa-current-user")
  end

  def signed_out? do
    has_css?(".qa-sign-in")
  end
end
