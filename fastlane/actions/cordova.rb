module Fastlane
  module Actions
    class CordovaActionAction < Action
      def self.run(params)
        node_version = Actions.lane_context[SharedValues::NODE_VERSION]

        sh ". $NVM_DIR/nvm.sh && nvm use #{node_version} && cd .. && export PARTH=$PATH:node_modules/.bin && cordoa #{params[:action]} #{params[:platform]}"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Define and install cordova version"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :action,
                                         description: "Cordova action",
                                         optional: false),
            FastlaneCore::ConfigItem.new(key: :platform,
                                         env_name: "FL_CORDOVA_PLATFORM", # The name of the environment variable
                                         description: "Cordova platform target for build", # a short description of this parameter)
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
