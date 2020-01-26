# Sprite Palette Extractor

Extracts palette information from sets of spritesheets. This is just a script I wrote for a personal project so lots of settings are hardcoded. Alter as needed if you are actually using this.

## Setup

Install ImageMagick if necessary.

    brew install imagemagick

Clone the repository.

    git clone git@github.com:danielsellergren/sprite-palette-extractor.git
    cd sprite-palette-extractor/

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