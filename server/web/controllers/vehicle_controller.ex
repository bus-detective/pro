defmodule BdPro.VehicleController do
  use BdPro.Web, :controller

  alias BdPro.Vehicle

  plug :scrub_params, "vehicle" when action in [:create, :update]

  def index(conn, _params) do
    vehicles = Repo.all(Vehicle)
    render(conn, "index.json", vehicles: vehicles)
  end

  def create(conn, %{"vehicle" => vehicle_params}) do
    changeset = Vehicle.changeset(%Vehicle{}, vehicle_params)

    case Repo.insert(changeset) do
      {:ok, vehicle} ->
        conn
        |> put_status(:created)
        |> render("show.json", vehicle: vehicle)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BdPro.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vehicle = Repo.get!(Vehicle, id)
    render conn, "show.json", vehicle: vehicle
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Repo.get!(Vehicle, id)
    changeset = Vehicle.changeset(vehicle, vehicle_params)

    case Repo.update(changeset) do
      {:ok, vehicle} ->
        render(conn, "show.json", vehicle: vehicle)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BdPro.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Repo.get!(Vehicle, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    vehicle = Repo.delete!(vehicle)

    send_resp(conn, :no_content, "")
  end
end
