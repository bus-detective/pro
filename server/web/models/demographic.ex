defmodule BdPro.Demographic do
  use BdPro.Web, :model

  schema "demographics" do
    field :population_total, :integer
    field :population_male, :integer
    field :population_female, :integer
    field :population_18_24, :integer
    field :population_25_44, :integer
    field :population_45_64, :integer
    field :population_65_plus, :integer
    field :income_median, :integer
    field :income_total, :integer

    belongs_to :tract, BdPro.Tract

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w(
    tract_id
    population_total
    population_male
    population_female
    population_18_24
    population_25_44
    population_45_64
    population_65_plus
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
end
