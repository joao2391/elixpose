defmodule ElixposeTest do
  use ExUnit.Case
  doctest Elixpose

  test "returns number 03" do
    assert Elixpose.count_css("https://pt.stackoverflow.com/") == 3
  end

  test "returns number 16" do
    assert Elixpose.count_js("https://pt.stackoverflow.com/") == 16
  end

  test "returns number 1" do
    assert Elixpose.count_html_elements("https://pt.stackoverflow.com/") == 1
  end

  test "returns number 12" do
    assert Elixpose.count_meta_tags("https://pt.stackoverflow.com/") == 12
  end

  #todo
  #test "returns string's list" do

  #end


  #https://pt.stackoverflow.com/
end
