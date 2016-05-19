#!/usr/bin/env ruby
# Original note from Mert Dümenci (mertdumenci) from
# https://gist.github.com/mertdumenci/b74b440421247f1e5fe0
# ---
# Using this script downloads ALL the videos in NSScreencast.
# Use it wisely, it's extra load/bandwidth for the NSScreencast website.
# Usage: `EMAIL=your email PASSWORD=your password COUNT=how many videos should be downloaded? ruby download-nsscreencast.rb`
# ---
#
# From Wojciech Koszek (wkoszek):
# I've improved Mert's original version, since it didn't work out of box.
# What is below I've used 2016/April, to get NSScreencasts downloaded without
# a problem.
#

require "mechanize"
require "parallel"

puts "mechanize start"
mechanize = Mechanize.new
mechanize.get('https://www.nsscreencast.com/login') do |page|
	my_page = page.form_with(:action => '/user_sessions') do |f|
		f.email = ARGV[0]
		f.password = ARGV[1]
	end.click_button
end

mechanize.pluggable_parser.default = Mechanize::Download

puts "mechanize fetch start"
count = ARGV[2].to_i

(1..count).each do |idx|
    puts "# #{idx}"
    begin
        page_url = "http://www.nsscreencast.com/episodes/#{idx}"
	video_page = mechanize.get(page_url)
	video_url = video_page.uri.to_s + ".mp4"
	pp(video_url)

        puts "Downloading #{video_url}"
        video = mechanize.get(video_url)

        file_name = video_url.split("/")[-1]
	file_path = "videos/#{file_name}"
	pp(file_name)
	pp(file_path)

        video.save(file_path)
        puts "Saved #{file_path}"
    rescue
        puts "Couldn't save #{video_url}"
    end
end
