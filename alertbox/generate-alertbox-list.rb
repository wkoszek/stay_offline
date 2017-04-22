#!/usr/bin/env ruby

require 'mechanize'
require 'pp'
require 'json'

def main
  base_url = "https://www.nngroup.com"

  mechanize = Mechanize.new
  mechanize.user_agent = 'Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16'

  links = []
  1.upto(150) do |i|
    page_url = "#{base_url}/articles/?page=#{i}"

    STDERR.puts page_url

    begin  
      page = mechanize.get(page_url)
    rescue  
      break
    end  

    page.links_with(:href => %r{/articles/[a-zA-Z]} ).each do |link|
      next if link.href =~ %r{/articles/author/}
      next if link.href =~ %r{/articles/subscribe/}
      url = base_url + link.href
      if not links.include? url
        links << url
      end
    end
  end
  puts links.to_json
end

main
