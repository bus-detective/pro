defmodule BdPro.TractFactory do
  alias BdPro.Repo
  alias BdPro.Tract

  def build(attrs \\ %{}) do
    %Tract{
      name: attrs[:name] || "Test Tract"
    }
  end

  def create(attrs \\ %{}) do
    Repo.insert! build(attrs)
  end
end
