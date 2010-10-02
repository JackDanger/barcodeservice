# Barcode Service

This is a simple Sinatra server that turns simple web requests into formatted barcode images.


## Instant installation and deploy

* Clone this: `git clone git://github.com/JackDanger/barcodeservice.git`
* Signup for an account at Heroku ([better details here](http://github.com/sinatra/heroku-sinatra-app))
* push it to Heroku.com: `git push heroku master`


## HowTo

You can embed barcodes into your web pages simply by using an <img> tag

    <img src="http://my-barcode-server.heroku.com/999999999999999.png?type=ISBN" />
    <img src="http://my-barcode-server.heroku.com/ABCDEF1232333.png?type=code93" />
    <img src="http://my-barcode-server.heroku.com/ABC123.png?width=50&height=30&x=4&y=200&scale=1" />


Patches welcome, forks celebrated.

Copyright (c) 2010 [Jack Danger Canty](http://jåck.com). Released under the MIT License.