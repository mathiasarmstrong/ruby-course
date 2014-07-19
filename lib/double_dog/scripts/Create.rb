module DoubleDog
  class Create

    def self.run(inputs)
      self.new.run(inputs)
    end

    private
      def failure(error_name)
        return :success? => false, :error => error_name
      end

      def success(data)
        return data.merge(:success? => true)
      end
  end
end
