defmodule BdPro.VehiclePosition do
  use BdPro.Web, :model

  schema "vehicle_positions" do
    field :trip_remote_id, :string
    field :lat, :float
    field :lng, :float
    field :timestamp, Ecto.DateTime
    belongs_to :agency, BdPro.Agency
    belongs_to :vehicle, BdPro.Vehicle, references: :remote_id, foreign_key: :vehicle_remote_id, type: :string
    timestamps
  end

  @required_fields ~w(trip_remote_id vehicle_remote_id lat lng timestamp)
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

  defmodule Query do
    def find_by_remote_id(remote_id) do
      from vp in BdPro.VehiclePosition,
        where: vp.vehicle_remote_id == ^remote_id,
        select: vp,
        limit: 1
    end
  end
end
