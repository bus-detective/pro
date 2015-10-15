defmodule BdPro.Demographic do
  use BdPro.Web, :model

  schema "demographics" do
    field :value, :float

    belongs_to :tract, BdPro.Tract
    belongs_to :demographic_field, BdPro.DemographicField

    timestamps
  end

  @optional_fields ~w()
  @required_fields ~w(
    demographic_field_id
    tract_id
    value
  )

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
    def all do
      from d in BdPro.Demographic, limit: 10
    end
  end
end
