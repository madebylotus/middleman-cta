module CTA
  class Extension < ::Middleman::Extension
    option :cta_directory, 'cta', 'Directory containing your CTA images'
    option :cta_data, 'cta', 'Details of each CTA in YML or JSON format'

    def initialize(app, options_hash={}, &block)
      super
    end

    def after_configuration
       app.logger.info("== CTA: #{ options.cta_data } is not a valid data key") unless app.data.key?(options.cta_data)

       if app.config[:markdown_engine] == :redcarpet
         require 'middleman-core/renderers/redcarpet'
         Middleman::Renderers::MiddlemanRedcarpetHTML.send(:include, CTA::Redcarpet::CTARenderer)
       end
    end

    def cta_datasource
      app.data[options.cta_data]
    end

    def find_cta(id)
      attributes = cta_datasource.find { |cta| cta[:id] == id }
      raise "Unable to locate CTA[#{ id }]" if attributes.blank?

      Instance.new(attributes)
    end

    helpers do
      def cta_controller
        app.extensions[:cta]
      end

      def cta(id, options={})
        result = cta_controller.find_cta(id)

        options[:class] ||= 'cta-image'

        link_to result.url_for(sitemap), class: 'cta-link' do
          image_tag(File.join(cta_controller.options.cta_directory, result.image), options)
        end
      end
    end
  end
end
