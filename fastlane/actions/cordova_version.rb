module Fastlane
  module Actions
    module SharedValues
      CORDOVA_VERSION = :CORDOVA_VERSION
    end

    class CordovaVersionAction < Action
      def self.run(params)
        node_version = Actions.lane_context[SharedValues::NODE_VERSION]
        cordova_version = params[:cordova_version]
        Actions.lane_context[SharedValues::CORDOVA_VERSION] = cordova_version

        sh ". $NVM_DIR/nvm.sh && nvm use #{node_version} && cd .. && npm install cordova@#{cordova_version}"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Define and install cordova version"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :cordova_version,
                                         env_name: "FL_CORDOVA_VERSION", # The name of the environment variable
                                         description: "Define Cordova version for build", # a short description of this parameter)
                                         optional: false)
        ]
      end

      def self.output
        [
          ['CORDOVA_VERSION', 'Cordova version']
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
