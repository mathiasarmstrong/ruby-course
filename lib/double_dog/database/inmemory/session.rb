module DoubleDog
  module Database
    module Session_model
      def session_initialize
        @sessions = {}
        @sessions_id_counter = 100
      end

      def create_session(attrs)
        new_id = (@sessions_id_counter += 1)
        @sessions[new_id] = attrs
        return new_id
      end

      def get_user_by_session_id(sid)
        return nil if @sessions[sid].nil?
        user_id = @sessions[sid][:user_id]
        get_user(user_id)
      end

    end
  end
end
