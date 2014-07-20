module DoubleDog
  module Database
    module User_model
      def user_initialize
        @users = {}
        @users_id_counter = 100
      end

      def create_user(attrs)
        new_id = (@users_id_counter += 1)
        @users[new_id] = attrs
        attrs[:id] = new_id
        User.new(attrs[:id], attrs[:username], attrs[:password], attrs[:admin])
      end

      def get_user(id)
        attrs = @users[id]
        User.new(attrs[:id], attrs[:username], attrs[:password], attrs[:admin])
      end

      def get_user_by_username(username)
        user_attrs = @users.values.find { |attrs| attrs[:username] == username }
        return nil if user_attrs.nil?
        User.new(user_attrs[:id], user_attrs[:username], user_attrs[:password], user_attrs[:admin])
      end
    end
  end
end
