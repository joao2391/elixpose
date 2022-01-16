[![Elixpose version](https://img.shields.io/hexpm/v/elixpose.svg)](https://hex.pm/packages/elixpose)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/elixpose/)
[![Hex.pm](https://img.shields.io/hexpm/dt/elixpose.svg)](https://hex.pm/packages/)

# Elixpose

It is a package for helping you to scrap web pages. It shows you a lot of information about the page.

## Notes
Version 0.1.0:

- Added features to get information from the page.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixpose` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixpose, "~> 0.1.0"}
  ]
end
```

## Features
```elixir
count_css(url, headers \\ [])

count_js(url, headers \\ [])

count_html_elements(url, headers \\ [])

count_meta_tags(url, headers \\ [])

count_onclick_events(url, headers \\ [])

count_forms(url, headers \\ [])

get_js_content(url, headers \\ [])

get_css_content(url, headers \\ [])

get_forms_info(url, headers \\ [])

get_page_size(url, headers \\ [])

get_onclick_values(url, headers \\ [])

has_ajax_call?(url, headers \\ [])

get_json_report(url, headers \\ [])
```

## Documentation

Documentation can be found at [https://hexdocs.pm/elixbacen](https://hexdocs.pm/elixbacen).

## License
[MIT](https://choosealicense.com/licenses/mit/)

