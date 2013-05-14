module Kuhsaft
  module Cms
    module AdminHelper

      def render_language_switch?
        I18n.available_locales.size > 1
      end
    end
  end
end