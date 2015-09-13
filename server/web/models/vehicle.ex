defmodule BdPro.Vehicle do
  use BdPro.Web, :model

  schema "vehicles" do
    field :remote_id, :string
    belongs_to :campaign, BdPro.Campaign
    has_many :vehicle_positions, BdPro.VehiclePosition, foreign_key: :vehicle_remote_id, references: :remote_id

    timestamps
  end

  @required_fields ~w(remote_id)
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
