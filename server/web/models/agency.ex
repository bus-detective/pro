defmodule BdPro.Agency do
  use BdPro.Web, :model

  schema "agencies" do
    field :name, :string
    field :feed_url, :string

    timestamps
  end

  @required_fields ~w(name, feed_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end