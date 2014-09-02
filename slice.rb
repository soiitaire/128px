# for u.zuo
require 'rubygems'
require 'RMagick'

pic_path     = ARGV[0] ? ARGV[0] : 'psychopass.PNG'
thumb_width  = ARGV[1] ? ARGV[1] : 128
thumb_height = ARGV[2] ? ARGV[2] : 128
img =  Magick::Image.read(pic_path).first

Array.new(img.rows/thumb_width + 1){|k| k * thumb_width}.each_with_index do |x, i|
  Array.new(img.columns/thumb_height + 1){|k| k * thumb_height}.each_with_index do |y, j|
    thumb = img.crop(x, y, thumb_width, thumb_height)
    thumb.write("thumb_#{j}_#{i}.#{img.format.downcase}") {self.quality = 100}
  end
end
