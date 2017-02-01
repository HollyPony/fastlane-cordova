module Fastlane
  module Actions
    class WhereAmIAction < Action
      def self.run()
        UI.message(sh "pwd")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.available_options
        nil
      end

      def self.output
        nil
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?
        true
      end
    end
  end
end
