defmodule BdPro.Factories do
  use ExMachina.Ecto, repo: BdPro.Repo
  
  def factory(:campaign) do
    %BdPro.Campaign{
      name: sequence(:name, &"Test Campaign #{&1}")
    }
  end

  def factory(:vehicle, attrs) do
    %BdPro.Vehicle{
      remote_id: sequence(:remote_id, &"000#{&1}"),
      campaign_id: assoc(attrs, :campaign).id
    }
  end

  def factory(:vehicle_position, attrs) do
    %BdPro.VehiclePosition{
      vehicle_remote_id: assoc(attrs, :vehicle).remote_id,
      lat: sequence(:lat, &String.to_float("39.#{&1}00")),
      lng: sequence(:lng, &String.to_float("-81.#{&1}00"))
    }
  end
end
