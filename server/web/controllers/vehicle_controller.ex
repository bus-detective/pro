defmodule BdPro.VehicleController do
  use BdPro.Web, :controller

  alias BdPro.Vehicle

  plug :scrub_params, "vehicle" when action in [:create, :update]

  def create(conn, %{"vehicle" => vehicle_params}) do
    changeset = Vehicle.changeset(%Vehicle{}, vehicle_params)

    Repo.insert(changeset) |> render_response(conn)
  end

  def update(conn, %{"id" => id, "vehicle" => vehicle_params}) do
    vehicle = Repo.get!(Vehicle, id)
    changeset = Vehicle.changeset(vehicle, vehicle_params)

    Repo.update(changeset) |> render_response(conn)
  end

  def delete(conn, %{"id" => id}) do
    vehicle = Repo.get!(Vehicle, id)
    vehicle = Repo.delete!(vehicle)

    send_resp conn, :no_content, ""
  end

  def render_response({ :ok, vehicle}, conn) do
    render conn, "show.json", vehicle: vehicle
  end

  def render_response({:error, vehicle}, conn) do
    conn
    |> put_status(:unprocessable_entity)
    |> render BdPro.ChangesetView, "error.json", changeset: vehicle
  end
end
