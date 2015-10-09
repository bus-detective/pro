defmodule BdPro.ManageCampaignPage do
  use BdPro.Page

  def add_attributes_and_save(attr) do
    fill_field({:name, "name"}, attr.name)
    click({:class, "qa-save"})
  end

  def cancel do
    click({:class, "qa-cancel"})
  end

  def delete do
    click({:class, "qa-delete"})
  end

  def add_vehicle_and_save(attr) do
    fill_field({:name, "remote-id"}, attr.remote_id)
    fill_field({:name, "product"}, attr.product)
    click({:class, "qa-save-vehicle"})
  end

  def edit_vehicle_and_save(vehicle, attrs) do
    vehicle_element = find_element(:class, "qa-vehicle-#{vehicle.id}")
    click(find_within_element(vehicle_element, :class, "qa-edit"))

    remote_id_element = find_within_element(vehicle_element, :name, "remote-id")
    fill_field(remote_id_element, attrs.remote_id)

    product_element = find_within_element(vehicle_element, :name, "product")
    fill_field(product_element, attrs.product)

    click(find_within_element(vehicle_element, :class, "qa-save-vehicle"))
  end

  def delete_vehicle(vehicle) do
    vehicle_element = find_element(:class, "qa-vehicle-#{vehicle.id}")
    click(find_within_element(vehicle_element, :class, "qa-delete"))
  end

  def vehicle_count do
    Enum.count(vehicles)
  end

  def has_updated_vehicle?(vehicle, attrs) do
    vehicle_row_text = visible_text(find_element(:class, "qa-vehicle-#{vehicle.id}"))
    String.contains?(vehicle_row_text, attrs.remote_id) && String.contains?(vehicle_row_text, attrs.product)
  end

  def has_error? do
    find_element(:class, "qa-error-message")
  end

  defp vehicles do
    refresh_page
    find_all_elements(:class, "qa-vehicle-remote-id")
  end
end
