ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rack/test'
require 'lib/barcode_service'

class BarcodeServiceTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context "on GET to /" do
    setup {
      get '/'
    }
    should "return ok" do
      assert last_response.ok?
    end
    should "have some kind of welcome" do
      assert last_response.body =~ /<img/
    end
  end

  {:eps => /%!PS-Adobe-2.0 EPSF-1.2/,
   :gif => /^GIF89/,
   :png => /^.?PNG/,
   :jpeg => //
  }.each do |format, fileheader|
    context "on GET with code and #{format} type" do
      setup {
        get "/1234322.#{format}"
      }
      should "return ok" do
        assert last_response.ok?
      end
      should "cache for a year" do
        assert_equal 'public, max-age=31536000',
                     last_response.headers['Cache-Control']
      end
      should "return #{format} content-type" do
        assert_equal "image/#{format}", last_response.headers['Content-Type']
      end
      should "return the #{format} document" do
        body = last_response.body
        body.force_encoding('binary') if body.respond_to?(:force_encoding)
        assert body =~ fileheader
      end
    end
  end

  TYPES.each do |type,_|
    context "on GET with code and #{type} barcode" do
      setup {
        get "/1234322.png?type=#{type}"
      }
      should "return ok" do
        assert last_response.ok?
      end
      should "return png content-type" do
        assert_equal "image/png", last_response.headers['Content-Type']
      end
    end
  end
end