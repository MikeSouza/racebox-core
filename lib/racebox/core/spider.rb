require 'phantomjs'
require 'capybara'
require 'capybara/poltergeist'

module Racebox
  module Core
    class Spider
      # Extends/ Includes
      include Capybara::DSL
      include Racebox::Core::Crawling
      include Racebox::Core::Scraping

      # Inner Classes
      # Constants
      # Attribute Macros
      attr_accessor :driver

      # Public Class Methods

      # Public Instance Methods
      def initialize(url = nil)
        if ENV['IN_BROWSER']
          # On demand: non-headless tests via Selenium/WebDriver
          # To run the scenarios in browser (default: Firefox), use the following command line:
          # IN_BROWSER=true
          Capybara.default_driver = :selenium
        else
          # DEFAULT: headless tests with poltergeist/PhantomJS
          Capybara.register_driver :poltergeist do |app|
            @driver = Capybara::Poltergeist::Driver.new(
                app,
                window_size: [800, 600],
                debug: false,
                js_errors: false,
                phantomjs_options: ['--load-images=no']
            )
          end
          Capybara.default_driver = :poltergeist
          Capybara.javascript_driver = :poltergeist
        end

        # Do not boot a rack application automatically
        Capybara.run_server = false

        navigate_to url
      rescue => e
        puts e.to_s
      end

      def navigate_to(url)
        visit url unless url == nil
      rescue => e
        puts e.to_s
      end

      def dispose
        @driver.quit if @driver.respond_to?(:quit)
      end

      # Protected Methods
      # Private Methods

    end
  end
end