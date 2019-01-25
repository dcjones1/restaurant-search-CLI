# restaurant-search-CLI
A simple command line program allowing you to search for restaurants in a given location, using a variety of parameters.

## Install

* Clone repository
* Run `bundle install`
* To load external data, obtain a [Zomato API key](https://developers.zomato.com/api).
* Create a file `app/api_key.rb` and add the contents `API_KEY = "YOUR_API_KEY"`
* Run `ruby bin/setup_db_data.rb`

## Usage

* Run `ruby bin/runner.rb`

![DC Restaurant Search CLI](screenshot.gif)

* Note: Restaurant calling feature requires MacOS

## Contributing

Contributing to our Project
First off, thanks for taking the time to contribute!

If you find any bugs, please submit a detailed bug report.

Feel free to change the program to fit your needs. We'd appreciate seeing your finished program if you use any of our code. Thanks for stopping by!

## License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.