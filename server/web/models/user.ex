defmodule BdPro.User do
  use BdPro.Web, :model

  schema "users" do
    field :email, :string
    field :password_digest, :string
    field :password, :string, virtual: true

    timestamps
  end

  @required_fields ~w(email password)
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

  def authenticate(user, password) do
    if password == "password" do
      {:ok, user}
    else
      {:error, %{}}
    end
  end

  defmodule Query do
    alias BdPro.Repo

    def find_by_email(email) do
      Repo.one(from u in BdPro.User, where: u.email == ^email)
    end
  end
end
