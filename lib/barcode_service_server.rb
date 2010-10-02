## Resources
require 'rubygems'
gem 'sinatra', '~> 1.0.0'
require 'sinatra'



## Application

get '/' do
  %Q{
    <body style='line-height: 1.8em; font-family: Archer, Museo, Helvetica, Georgia; font-size 25px; text-align: center; padding-top: 20%;'>
      Post some HTML content to this server and receive a PDF document.
      <pre style='font-family: Iconsolata, monospace;background-color:#EEE'>curl -X POST http://#{request.host}/ < some_file.html > some_file.pdf</pre>
      <br />
      Also, try <a href='http://github.com/JackDanger/barcodeservice'>the official Ruby client</a>
    </body
}
end

get '*' do
  begin
    content_type 'application/pdf'
    barcode request.querystring
  rescue => error
    puts error.inspect
    status 400
  end
end


## HELPERS

DEFAULTS = {
  :type     => '93',
  :output   => 'eps',
  :width    => 100,
  :height   => 50,
  :x        => 0,
  :y        => 0,
  :margin   => 0,
  :scale    => 0
}

TYPES = {
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

def barcode(options)
  options = DEFAULTS.merge(options)
  
end