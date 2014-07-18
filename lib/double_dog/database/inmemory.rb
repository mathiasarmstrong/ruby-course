module DoubleDog
  module Database
    class InMemory

      include Item_model
      include Order_model
      include Session_model
      include User_model


      def initialize
        item_initialize
        order_initialize
        session_initialize
        user_initialize
      end




    end
  end
end
