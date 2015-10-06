defmodule BdPro.Page do
  defmacro __using__(_) do
    quote do
      use Hound.Helpers

      def has_content?(content) do
        String.contains?(page_source, content)
      end

      def has_css?(css) do
        find_element(:css, css)
      end

      def has_css?(css, %{text: text}) do
        visible_text({:css, css}) == text
      end
    end
  end
end
