module Fastlane
  module Actions
    class CordovaGetConfigValueAction < Action
      def self.run(params)
        config = Hash.from_xml(File.read(Actions.lane_context[SharedValues::CORDOVA_PATH] + '/config.xml'))
        return config["widget"][params[:key]]
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Define and install cordova version"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :key,
                                         description: "Key to search in file", # a short description of this parameter)
                                         optional: false)
        ]
      end

      def self.output
        [
          ['CORDOVA_VERSION', 'Cordova version'],
          ['CORDOVA_PATH', 'config.xml path']
        ]
      end

      def self.authors
        ["https://github.com/HollyPony/"]
      end

      def self.is_supported?(platform)
        [:android, :ios, :mac].include?(platform)
      end
    end
  end
end
