## Resources
require 'rubygems'
gem 'sinatra', '~> 1.0.0'
require 'sinatra'
gem 'gbarcode'
require 'gbarcode'



## Application


get '/:code.:extension' do
  # begin
    options = request.env['rack.request.query_hash']
    options = default_options.merge(options)

    content_type "image/#{params[:extension]}"

    Converter.encode params[:code], params[:extension], options
  # rescue => error
  #   puts error.inspect
  #   status 400
  # end
end

get '/' do
  %Q{
    <body style='line-height: 1.8em; font-family: Archer, Museo, Helvetica, Georgia; font-size 25px; text-align: center; padding-top: 20%;'>
      Get a barcode image by crafting a url at this domain.
      <pre style='font-family: Iconsolata, monospace;background-color:#EEE'>&lt;img src="http://#{request.host}/12345632323.png" /&gt;</pre>
      <br />
      <img src="http://#{request.host}/12345632323.png" />
    </body
}
end

## HELPERS

def default_options
  {
    'type'     => 'any',
    'output'   => 'png',
    'width'    => 100,
    'height'   => 50,
    'x'        => 0,
    'y'        => 0,
    'margin'   => 0,
    'scale'    => 0
  }
end

TYPES = {
  'any'     => 'BARCODE_ANY',
  'ean'     => 'BARCODE_EAN',
	'upc'     => 'BARCODE_UPC',
	'isbn'    => 'BARCODE_ISBN',
	'128b'    => 'BARCODE_128B',
	'128C'    => 'BARCODE_128C',
	'128'     => 'BARCODE_128',
	'128raw'  => 'BARCODE_128RAW',
	'39'      => 'BARCODE_39',
	'I25'     => 'BARCODE_I25',
	'cbr'     => 'BARCODE_CBR',
	'msi'     => 'BARCODE_MSI',
	'pls'     => 'BARCODE_PLS',
	'93'      => 'BARCODE_93'
}

module Converter
  include Gbarcode
  extend Gbarcode
  def self.encode(code, format, options)
    require 'stringio'

    barcode = barcode_create(code)
    barcode.width   = options['width'].to_i
    barcode.height  = options['height'].to_i
    barcode.xoff    = options['x'].to_i
    barcode.yoff    = options['y'].to_i
    barcode.scalef  = options['scale'].to_i
    barcode_encode barcode, BARCODE_NO_CHECKSUM | const_get(TYPES[options['type']])

    file = Tempfile.new('barcode')
    File.open(file.path, 'w') do |f|
      barcode_print(barcode, f, BARCODE_OUT_EPS)
    end

    output = case format
    when 'eps'
      file.read
    when "png"
      %x{convert eps:#{file.path} png:-}
    when "jpg", "jpeg"
      %x{convert eps:#{file.path} jpg:-}
    when "gif"
      %x{convert eps:#{file.path} gif:-}
    end

    file.unlink

    output
  end
end


