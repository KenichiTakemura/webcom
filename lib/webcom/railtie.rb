require 'webcom/view_helpers/utils_helper'
require 'webcom/view_helpers/messages_helper'
require 'webcom/view_helpers/sns_helper'
require 'webcom/view_helpers/mobiles_helper'

module Webcom
  class Railtie < Rails::Railtie
    initializer "webcom.view_helpers" do
      ActionView::Base.send :include, ViewHelpers::UtilsHelper
      ActionView::Base.send :include, ViewHelpers::MessagesHelper
      ActionView::Base.send :include, ViewHelpers::SnsHelper
      ActionView::Base.send :include, ViewHelpers::MobilesHelper
    end
  end
end