defmodule BdPro.Vehicle do
  use BdPro.Web, :model
  alias BdPro.VehiclePosition
  alias BdPro.Repo

  schema "vehicles" do
    field :remote_id, :string
    field :product, :string
    belongs_to :campaign, BdPro.Campaign
    has_many :vehicle_positions, BdPro.VehiclePosition, foreign_key: :vehicle_remote_id, references: :remote_id

    timestamps
  end

  @required_fields ~w(remote_id product campaign_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_vehicle_id
  end


  defp validate_vehicle_id(changeset) do
    remote_id = changeset.params["remote_id"]

    if(is_nil(remote_id)) do
      changeset
    else
      query = from vp in VehiclePosition,
              where: vp.vehicle_remote_id == ^remote_id,
              select: vp,
              limit: 1

      matching_vehicle = Repo.all(query)

      case length(matching_vehicle) do
        0 ->
          Ecto.Changeset.add_error(changeset, :remote_id, "Not a valid Vehicle ID")
        1 ->
          changeset
      end
    end
  end
end
