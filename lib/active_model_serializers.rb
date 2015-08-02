require 'active_model'
require 'active_model/serializer/version'
require 'active_model/serializer'
require 'active_model/serializer/fieldset'
require 'active_model/serializer/pagination'
require 'active_model/serializable_resource'

begin
  require 'active_model/serializer/railtie'
  require 'action_controller'
  require 'action_controller/serialization'

  ActiveSupport.on_load(:action_controller) do
    include ::ActionController::Serialization
    ActionDispatch::Reloader.to_prepare do
      ActiveModel::Serializer.serializers_cache.clear
    end
  end
rescue LoadError
  # rails not installed, continuing
end
