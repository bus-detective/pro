defmodule BdPro.SessionView do
  use BdPro.Web, :view

  def render("show.json", %{session: session}) do
    %{ 
      session: render_one(session, BdPro.SessionView, "session.json"),
      users: render_many([session.user], BdPro.UserView, "user.json")
    }
  end

  def render("session.json", %{session: session}) do
    %{
      user_id: session.user.id
    }
  end
end

