require 'test_helper'

@render_stub_result = nil

class Jekyll::Graphviz::BlockTest < Minitest::Test
  def render content
    site = MiniTest::Mock.new
    site.expect(:config, {})
    registers = { site: site }
    template = Liquid::Template.parse(content)
    template.render({}, registers: registers)
  end

  def test_it_convert_dots_code
    svg = render "{% digraph foobar %} aaa -> bbb {% enddigraph %}"
    assert_match "<svg ", svg
    assert_match "<div ", svg
    assert_match "<title>aaa</title>", svg
    assert_match "<title>bbb</title>", svg
  end
end
