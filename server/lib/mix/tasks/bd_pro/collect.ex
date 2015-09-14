defmodule Mix.Tasks.BdPro.Collect do
  use Mix.Task

  def run(_) do
    Mix.Task.run "app.start", []
  end
end
