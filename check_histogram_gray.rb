file = ARGV[0]
histogram = `convert #{file} -format %c histogram:info:- `

all_gray = true

for line in histogram.each_line do
  r = line.sub(/.*\((\d+),.*/, '\1').strip
  g = line.sub(/.*\(\d+,(\d+),.*/, '\1').strip
  b = line.sub(/.*\(\d+,\d+,(\d+).*/, '\1').strip

  all_gray = false unless r == g and r == b
end


puts "all_gray: #{all_gray}"

colorspace = `identify -format "%[colorspace]" #{file}`
puts "colorspace: #{colorspace}"

