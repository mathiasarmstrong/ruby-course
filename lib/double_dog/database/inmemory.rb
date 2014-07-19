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


      def get_user_by_session_id(sid)
        return nil if @sessions[sid].nil?
        user_id = @sessions[sid][:user_id]
        user_attrs = @users[user_id]
        User.new(user_attrs[:id], user_attrs[:username], user_attrs[:password], user_attrs[:admin])
      end

    end
  end
end
