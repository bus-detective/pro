defmodule BdPro.ManageCampaignPage do
  use BdPro.Page

  def has_error? do
    find_element(:class, "qa-error-message")
  end

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
end
