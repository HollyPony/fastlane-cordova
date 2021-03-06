module Fastlane
  module Actions
    class CordovaAction < Action
      def self.run(params)
        node_version = Actions.lane_context[SharedValues::NODE_VERSION]

        sh ". $NVM_DIR/nvm.sh && nvm use #{node_version} && cd #{Actions.lane_context[SharedValues::CORDOVA_PATH]} && export PATH=$PATH:node_modules/.bin && cordova #{params[:action]} #{params[:platform]}"
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

      def self.authors
        ["https://github.com/HollyPony/"]
      end

      def self.is_supported?(platform)
        [:android, :ios, :mac].include?(platform)
      end
    end
  end
end
