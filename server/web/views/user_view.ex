defmodule BdPro.UserView do
  use BdPro.Web, :view

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email
    }
  end
end

