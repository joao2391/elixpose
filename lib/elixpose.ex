defmodule Elixpose do
  @moduledoc """
  Documentation for `Elixpose`.
  """

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
    Count the OnClick events

    ## Examples

        iex> Elixpose.count_onclick_events("https://pt.stackoverflow.com/")
        15
  """
  def count_onclick_events(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("body")
      |> Floki.find("[onclick]")
      |> Enum.count()

      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Count the amount of Forms in the HTML

    ## Examples

        iex> Elixpose.count_forms("https://pt.stackoverflow.com/")
        1
  """
  def count_forms(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("form")
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
        StackExchange.realtime.subscribeToTopBarNotifications('526');\r\n        });\r\n "]
  """
  def get_js_content(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("script:not([src])")
      |> Enum.map(fn {_chave, _valor1, valor2} -> valor2 end)

      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Get the text content from <style> Html Tag

    ## Examples

        iex> Elixpose.get_css_content("https://pt.stackoverflow.com/")
        [["body,.top-bar{margin-top:1.9em}"], ["\r\n    "]]

  """
  def get_css_content(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("style")
      |> Enum.map(fn {_chave, _valor1, valor2} -> valor2 end)

      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

  @doc """
    Return information about the form tag

    ## Examples

        iex> Elixpose.get_forms_info("https://pt.stackoverflow.com/")
        [
          [
            {"id", "search"},
            {"role", "search"},
            {"action", "/search"},
            {"class", "flex--item fl-grow1 searchbar px12 js-searchbar "},
            {"autocomplete", "off"}
          ]
        ]
  """
  def get_forms_info(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("form")
      |> Enum.map(fn {_key, value1, _value2} -> value1 end)

      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

   @doc """
    Returns the page size in kb

    ## Examples

        iex> Elixpose.get_page_size("https://pt.stackoverflow.com/")
        12
  """
  def get_page_size(url, headers \\ []) do
    case HTTPoison.get(url, headers) do
      {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
      html = raw_body
      {:ok, document} = Floki.parse_document(html)

      document
      |> Floki.find("form")
      |> Enum.map(fn {_key, value1, _value2} -> value1 end)

      {:error, %{reason: reason}} -> {:error, reason}
    end
  end

end
