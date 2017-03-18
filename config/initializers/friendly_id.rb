
FriendlyId.defaults do |config|

  config.use :reserved

  config.reserved_words = %w(new edit index session login logout users admin
    stylesheets assets javascripts images)

  
 config.use :finders

  config.use :slugged

  config.slug_column = 'slug'

  config.sequence_separator = '-'

  config.use Module.new {
      def should_generate_new_friendly_id?
        slug.blank? || title_changed?
      end
    }
end
