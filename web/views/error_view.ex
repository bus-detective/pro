defmodule BdPro.ErrorView do
  use BdPro.Web, :view

  def render("404.html", _assigns) do
    "Page not found"
  end

  def render("500.html", _assigns) do
    "Server internal error"
  end

  def render("404.json", _assigns) do
    %{ error: "Not found" }
  end

  def render("403.json", _assigns) do
    %{ error: "Unauthorized" }
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end