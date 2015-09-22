defmodule BdPro.TractTest do
  use BdPro.ModelCase

  alias BdPro.Tract

  @valid_attrs %{shape: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tract.changeset(%Tract{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tract.changeset(%Tract{}, @invalid_attrs)
    refute changeset.valid?
  end
end
