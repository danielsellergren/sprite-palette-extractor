require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'rmagick'

# Accept a directory as an argument or use '.' as default
directory = ARGV[0] || '.'

# Create results array
all_hex = []

Dir.foreach("#{directory}/src") do |filename|
  # Skip irrelevant files and directories
  next if filename == '.' or filename == '..' or filename == '.gitkeep'

  # Make sure it's an image, just .png for now
  if filename.chars.last(4).join === '.png'

    # Open image and quantize down, removing similar colors and reducing palette
    image = Magick::ImageList.new("#{directory}/src/#{filename}")
    image = image.quantize(64, Magick::RGBColorspace)

    # Create palette and sort
    palette = image.color_histogram.sort {|a, b| b[1] <=> a[1]}

    # Iterate through palette and calculate hex values
    hex_values = []
    palette.count.times do |i|
      p = palette[i]
  
      r1 = p[0].red / 256
      g1 = p[0].green / 256
      b1 = p[0].blue / 256
  
      r2 = r1.to_s(16)
      g2 = g1.to_s(16)
      b2 = b1.to_s(16)
  
      r2 += r2 unless r2.length == 2 
      g2 += g2 unless g2.length == 2
      b2 += b2 unless b2.length == 2
  
      rgb = "#{r1},#{g1},#{b1}"
      hex = "#{r2}#{g2}#{b2}"
      depth = p[1]

      hex_values << hex
    end

    # Add to results array
    all_hex.concat(hex_values.uniq.sort)
  end
end

# Create output file
output_file = File.new("#{directory}/output/index.html", "w+")
output_file.puts '<!doctype html><html><head></head><body style="font-family: Georgia; width: 80%; margin: 0 auto;">'
output_file.puts '<h1>Palette for ' + directory + '/</h1>'

# Add all unique hex values to the output file in their own divs
all_hex.uniq.sort.each do |hex|
  output_file.puts '<div style="float: left; margin: 10px"><div>#' + hex.upcase + '</div><div style="width: 100px; height: 100px; float: left; background-color: #' + hex.upcase + ';"></div></div>'
end

# Close HTML tags and close file
output_file.puts '</html></body>'
output_file.close

# Output results to stdin
puts all_hex