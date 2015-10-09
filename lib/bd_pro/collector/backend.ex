defmodule BdPro.Collector.Backend do
  def fetch(uri), do: current_backend.fetch(uri) 

  defp current_backend do
    Application.get_env(:bd_pro, :collector_backend) || BdPro.Collector.Backend.Real
  end
end

defmodule BdPro.Collector.Backend.Real do
  def fetch(uri) do
    HTTPoison.get!(uri).body
  end
end

defmodule BdPro.Collector.Backend.Fake do
  def fetch(_uri) do
    {:ok, file_contents} = File.read("test/fixtures/vehicle_positions_fixture.pb") 
    file_contents
  end
end
