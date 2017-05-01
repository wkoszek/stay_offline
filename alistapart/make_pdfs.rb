#!/usr/bin/env ruby

require 'json'

j = JSON.load(File.read("list.json"))
i = 0
j.each do |l|
  fn = l.gsub("https://alistapart.com/article", "")
  filename = i.to_s.rjust(4, '0') + "-" + fn.gsub!("/", "") + ".pdf"
  i += 1
  puts filename
  `phantomjs ../_render.js "#{l}" #{filename}`
end
