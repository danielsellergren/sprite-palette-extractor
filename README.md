# sprite-palette-extractor
Extracts palette information from sets of spritesheets

## Setup

Install ImageMagick if necessary.

    brew install imagemagick

Install dependencies.

    bundle install

## Usage

Put all of your files in the src directory, or alternative a `src` directory anywhere else on your machine. If using a different directory make sure there is also an `output` directory in the same directory as your `src` directory.

Run the script and pass in the src directory you'd like to use. The current directory will be used by default.

    ruby palette.rb .

Open the output file to see the different palettes.

    open output/index.html

## References

* https://blog.kellishaver.com/image-color-analysis-with-rmagick/