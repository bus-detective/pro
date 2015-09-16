defmodule BdPro.Collector do
  use GenServer
  alias BdPro.Collector.Runner
  require Logger

  @interval 60_000

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init([]) do
    schedule_collect()
    {:ok, []}
  end

  def handle_info(:collect, _message) do
    Logger.info "Collecting Vehicle Positions"
    Runner.collect()
    schedule_collect()
    {:noreply, nil}
  end

  def schedule_collect do
    Process.send_after(self(), :collect, @interval)
  end
end
