defmodule BdPro.Page do
  use Hound.Helpers

  def has_content?(content) do
    String.contains?(page_source, content)
  end
end
