module Fastlane
  module Actions
    class NvmInstallAction < Action
      def self.run
        node_version = Actions.lane_context[SharedValues::NODE_VERSION]
        sh ". $NVM_DIR/nvm.sh && nvm install #{node_version}"
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        []
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['NVM_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If you method provides a return value, you can describe here what it does
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
