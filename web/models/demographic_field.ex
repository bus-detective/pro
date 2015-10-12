defmodule BdPro.DemographicField do
  use BdPro.Web, :model

  schema "demographic_fields" do
    field :name, :string
    field :remote_name, :string

    has_many :demographics, BdPro.Demographic

    timestamps
  end

  @optional_fields ~w()
  @required_fields ~w(
    name
    remote_name
  )

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  defmodule Query do
    def find_by_name(name) do
      from demographic_field in BdPro.DemographicField,
        where: demographic_field.name == ^name,
        limit: 1
    end
  end
end
