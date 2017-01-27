module Fastlane
  module Actions
    module SharedValues
      NODE_VERSION = :NODE_VERSION
    end

    class NodeVersionAction < Action
      def self.run(params)
        node_version = params[:node_version]
        Actions.lane_context[SharedValues::NODE_VERSION] = node_version
        Actions::NvmInstallAction.run
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Define and install a node version"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :node_version,
                                         env_name: "FL_NODE_VERSION", # The name of the environment variable
                                         description: "Define Node version for build", # a short description of this parameter)
                                         optional: false)
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
