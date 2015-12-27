require 'test_helper'

class Jekyll::GraphvizTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jekyll::Graphviz::VERSION
  end
end
