#!/usr/bin/env ruby

require 'mechanize'
require 'pp'
require 'json'
require 'byebug'

def main
  base_url = "https://alistapart.com"

  mechanize = Mechanize.new
  mechanize.user_agent = 'Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16'

  links = []
  10.step(1000, 10) do |i|
    #byebug
    page_url = "#{base_url}/articles/P#{i}"

    STDERR.puts page_url

    begin  
      page = mechanize.get(page_url)
      page.links_with(:href => %r{/article/[a-zA-Z]} ).each do |link|
        url = base_url + link.href
        next if url =~ /#comments/
        if not links.include? url
	  #STDERR.puts "# adding #{url}"
          links << url
        end
      end
    rescue  
      STDERR.puts "ops #{page_url}"
    end  

  end
  puts links.to_json
end

main
