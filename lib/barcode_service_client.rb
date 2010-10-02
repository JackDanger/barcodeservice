#
# HowTo:
#
#  client = BarcodeService::Client.new 'http://my-barcodeservice-app.com'
#  pdf_content = client.render '<html></html>'
#
module BarcodeService
  class Client
    # @server: "http://myserver.com"
    def initialize(server)
      require 'net/http'
      @server = URI.parse server
    end

    def render code
      start do |http|
        http.post('/', "code=#{code}").read_body
      end
    end

    protected

      def start
        Net::HTTP.start @server.host, @server.port do |http|
          yield http
        end
      end
  end
end