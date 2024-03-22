module Sablon
  class Image
    include Singleton
    attr_reader :definitions
    attr_reader :rid_by_file

    Definition = Struct.new(:name, :data, :width, :height, :rid) do
      def inspect
        "#<Image #{name}:#{data}:#{width}:#{height}:#{rid}"
      end
    end

    def self.create_by_path(path)
      image_name = "#{Random.new_seed}-#{Pathname.new(path).basename.to_s}"
      Sablon::Image::Definition.new(image_name, IO.binread(path))
    end
  end
end
