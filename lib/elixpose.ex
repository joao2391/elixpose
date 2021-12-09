defmodule Elixpose do
  @moduledoc """
  Documentation for `Elixpose`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Elixpose.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
    Count the CSS referenced

    ## Examples

        iex> Elixpose.count_css("https://pt.stackoverflow.com/")
        3
  """
  def count_css(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("link[rel=stylesheet]")
      |> Enum.count()
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Count the JS referenced

    ## Examples

        iex> Elixpose.count_js("https://pt.stackoverflow.com/")
        16
  """
  def count_js(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("script")
      |> Enum.count()
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Count the HTML Elements

    ## Examples

        iex> Elixpose.count_html_elements("https://pt.stackoverflow.com/")
        1
  """
  def count_html_elements(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("html")
      |> Enum.count()
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

   @doc """
    Count the HTML Elements

    ## Examples

        iex> Elixpose.count_meta_tags("https://pt.stackoverflow.com/")
        12
  """
  def count_meta_tags(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("meta")
      |> Enum.count()
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Get the text content from <script> Html Tag

    ## Examples

        iex> Elixpose.get_js_content("https://pt.stackoverflow.com/")
        ["\r\n            StackExchange.ready(function() {\r\n                StackExchange.realtime.subscribeToActiveQuestions('526', 'home-active');\r\n            });\r\n        "],
        ["\r\n        StackExchange.ready(function () {\r\n            StackExchange.realtime.init('wss://qa.sockets.stackexchange.com');\r\n                StackExchange.realtime.subscribeToReputationNotifications('526');\r\n
        StackExchange.realtime.subscribeToTopBarNotifications('526');\r\n        });\r\n    "]
  """
  def get_js_content(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("script:not([src])")
      |> Enum.map(fn {chave, valor1, valor2} -> valor2 end)
        #if String.contains? valor2, "https" do
         #  valor2
         # end
      #end)
      #|> Enum.each(fn (x) -> x end)
      #|> elem(2)
      #|> Enum.at(4)
      #|> elem(2)
      #|> Enum.find(fn (x) ->  IO.puts(x) end)
      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

end
