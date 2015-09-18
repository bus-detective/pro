defmodule BdPro.VehiclePosition do
  use BdPro.Web, :model

  schema "vehicle_positions" do
    field :trip_remote_id, :string
    field :vehicle_remote_id, :string
    field :lat, :float
    field :lng, :float
    field :timestamp, Ecto.DateTime
    belongs_to :agency, BdPro.Agency
    timestamps
  end

  @required_fields ~w(trip_remote_id lat lng)
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
