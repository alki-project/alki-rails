require 'alki'

module Alki
  module Rails
    module Instance
      def self.build_assembly
        unless File.exist? ::Rails.root.join('config','assembly.rb').to_s
          raise "Alki::Rails requires a config/assembly.rb file to exist!!"
        end
        Alki.create_assembly(config_dir: ::Rails.root.join('config').to_s, name: 'alki_rails_assembly')
      end

      def self.alki_module
        @module ||= build_assembly
      end

      def self.instance
        @instance ||= alki_module.new do
          mount :reloader, 'alki/reload' do
            set(:root_dir) { ::Rails.root }
            set(:enable) { !::Rails.application.config.cache_classes }
          end
        end.tap do |instance|
          ActiveSupport::Reloader.after_class_unload do
            instance.reloader.reload
          end
        end
      end
    end

    def respond_to_missing?(name,_include_all)
      Alki::Rails::Instance.instance.respond_to? name
    end

    def method_missing(name,*args,&blk)
      if Alki::Rails::Instance.instance.respond_to? name
        Alki::Rails::Instance.instance.send name, *args, &blk
      else
        super
      end
    end

    extend self
  end
end
