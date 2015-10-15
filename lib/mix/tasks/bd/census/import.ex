defmodule Mix.Tasks.Bd.Census.Import do
  use Mix.Task

  def run(_) do
    Mix.Task.run("app.start", [])
    BdPro.Census.Importer.run
  end
end
