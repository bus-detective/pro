defmodule BdPro.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers
      hound_session
    end
  end

  setup_all do
    on_exit fn ->
      :ok
    end
  end

  setup do
    BdPro.Endpoint.start_link
    :ok
  end
end
