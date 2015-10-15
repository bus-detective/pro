defmodule Mix.Tasks.BdPro.ImportZipCodes do
  use Mix.Task

  @shortdoc "Import zip codes into database"

  def run(_) do
    System.cmd("psql", ["-d", "bd_pro_dev", "-f", "test/fixtures/zip_codes_ohio.sql"])
  end
end
