require "liquid/tag"
require "jekyll/graphviz/renderer"

module Jekyll
  module Graphviz
    class DotF < Liquid::Tag
        def initialize tag_name, path, tokens
            super
            @path = path
        end

        def render context
            config = context.registers[:site].config
            renderer = Jekyll::Graphviz::Renderer.new(config["graphviz"])

            page = context.registers[:page]
            path = File.dirname(page[:relative_path]) + "/" + @path
            renderer.render_dotf path
        end
    end
  end
end
