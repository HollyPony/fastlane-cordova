module Fastlane
  module Actions
    module SharedValues
      NODE_VERSION = :NODE_VERSION
    end

    class SetNodeVersionAction < Action
      def self.run(params)
        Actions.lane_context[SharedValues::NODE_VERSION] = params[:node_version]
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
        [
            FastlaneCore::ConfigItem.new(key: :node_version,
                                         env_name: "FL_SET_NODE_VERSION", # The name of the environment variable
                                         description: "Define Node version for build") # a short description of this parameter)
        ]
      end

      def self.output
        [
            ['NODE_VERSION', 'Node version to use with nvm']
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
