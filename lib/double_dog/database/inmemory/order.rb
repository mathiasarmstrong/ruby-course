module DoubleDog
  module Database
    module Order_model
      def order_initialize
        @orders = {}
        @order_id_counter = 600
      end

      def create_order(attrs)
        new_id = (@order_id_counter += 1)
        @orders[new_id] = attrs
        attrs[:id] = new_id
        Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
      end

      def get_order(id)
        attrs = @orders[id]
        Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
      end

      def all_orders
        @orders.values.map do |attrs|
          Order.new(attrs[:id], attrs[:employee_id], attrs[:items])
        end
      end
    end
  end
end
