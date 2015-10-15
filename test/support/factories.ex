defmodule BdPro.Factories do
  use ExMachina.Ecto, repo: BdPro.Repo

  def factory(:campaign, _attrs) do
    %BdPro.Campaign{
      name: sequence(:name, &"Test Campaign #{&1}")
    }
  end

  def factory(:vehicle, attrs) do
    %BdPro.Vehicle{
      remote_id: attrs[:remote_id] || sequence(:remote_id, &"000#{&1}"),
      campaign_id: assoc(attrs, :campaign).id,
      product: attrs[:product] || "Kong Wrap"
    }
  end

  # Each vehicle position will be contained inside the default tract
  def factory(:vehicle_position, attrs) do
    %BdPro.VehiclePosition{
      vehicle_remote_id: assoc(attrs, :vehicle).remote_id,
      lat: sequence(:lat, &String.to_float("39.121537#{&1}")),
      lng: sequence(:lng, &String.to_float("-84.51782#{&1}"))
    }
  end

  def factory(:tract, _attrs) do
    %BdPro.Tract{
      shape: %Geo.MultiPolygon{ 
        coordinates: [[[
          { -84.819946,39.334297 },
          { -84.303589,39.330049 },
          { -84.270630,39.040520 },
          { -84.852905,39.027719 },
          { -84.819946,39.334297 }
        ]]]
      }
    }
  end

  def factory(:demographic, attrs) do
    %BdPro.Demographic{
      tract_id: assoc(attrs, :tract).id,
      demographic_field_id: assoc(attrs, :demographic_field).id
    }
  end

  def factory(:demographic_field, attrs) do
    %BdPro.DemographicField{}
  end

  def factory(:user, attrs) do
    %BdPro.User{
      email: sequence(:email, &"test-#{&1}@example.com"),
      password: "password"
    }
  end

  def factory(:demographic_field, _attrs) do
    %BdPro.DemographicField{}
  end
end
