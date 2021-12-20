defmodule ElixposeTest do
  use ExUnit.Case
  doctest Elixpose

  test "returns number 03 from count_css" do
    assert Elixpose.count_css("https://pt.stackoverflow.com/") == 3
  end

  test "returns number 19 from count_js" do
    assert Elixpose.count_js("https://pt.stackoverflow.com/") == 19
  end

  test "returns number 1 from count_html_elements" do
    assert Elixpose.count_html_elements("https://pt.stackoverflow.com/") == 1
  end

  test "returns number 12 from count_meta_tags" do
    assert Elixpose.count_meta_tags("https://pt.stackoverflow.com/") == 12
  end

  test "returns number 15 from count_onclick_events" do
    assert Elixpose.count_onclick_events("https://pt.stackoverflow.com/") == 15
  end

  test "returns number 1 from count_forms" do
    assert Elixpose.count_forms("https://pt.stackoverflow.com/") == 1
  end

  test "returns number 102 from get_page_size" do
    assert Elixpose.get_page_size("https://pt.stackoverflow.com/") == 101
  end

  test "returns string's list of js content" do
    assert Elixpose.get_js_content("https://pt.stackoverflow.com/")
    |> length() == 16
  end

  test "returns string's list of css content" do
    assert Elixpose.get_css_content("https://pt.stackoverflow.com/")
    |> length() == 2
  end

  test "returns string's list of forms info" do
    assert Elixpose.get_forms_info("https://pt.stackoverflow.com/")
    |> length() == 1
  end

  test "return report" do
    assert is_nil(Elixpose.get_json_report("https://pt.stackoverflow.com/")) == false
  end

end
