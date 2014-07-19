require 'pry-byebug'

module DoubleDog
  def self.db
    @__db_instance ||= Database::InMemory.new
  end
end

require_relative 'double_dog/entities/item.rb'
require_relative 'double_dog/entities/user.rb'
require_relative 'double_dog/entities/order.rb'

require_relative 'double_dog/database/item.rb'
require_relative 'double_dog/database/order.rb'
require_relative 'double_dog/database/session.rb'
require_relative 'double_dog/database/user.rb'
require_relative 'double_dog/database/inmemory.rb'

require_relative 'double_dog/scripts/Create.rb'
require_relative 'double_dog/scripts/admin_session.rb'
require_relative 'double_dog/scripts/create_account.rb'
require_relative 'double_dog/scripts/create_item.rb'
require_relative 'double_dog/scripts/sign_in.rb'
require_relative 'double_dog/scripts/see_all_orders.rb'
require_relative 'double_dog/scripts/create_order.rb'

