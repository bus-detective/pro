defmodule BdPro.Tract do
  use BdPro.Web, :model

  schema "tracts" do
    field :state_remote_id, :string
    field :county_remote_id, :string
    field :shape, Geo.MultiPolygon

    timestamps
  end

  @required_fields ~w()
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
