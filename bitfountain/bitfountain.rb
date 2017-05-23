#!/usr/bin/env ruby

require "mechanize"
require "parallel"

puts "mechanize start"
mechanize = Mechanize.new
mechanize.get('https://www.bitfountain.io/sign_in') do |page|
	my_page = page.form_with(:action => '/users/auth') do |f|
		f.email = ARGV[0]
		f.password = ARGV[1]
	end.click_button
end

mechanize.pluggable_parser.default = Mechanize::Download

puts "mechanize fetch start"
count = ARGV[2].to_i

page_url = "https://www.bitfountain.io/courses/auto-layout/auto-layout-intro-part-1-ab9/c/22/l/1018"
video_page = mechanize.get(page_url)
#video_url = video_page.uri.to_s + ".mp4"
pp(video_page)
pp(video_page.frames)
pp(video_page.iframes)
