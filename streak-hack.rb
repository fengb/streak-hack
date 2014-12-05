#!/usr/bin/env ruby

require 'time'

first = DateTime.parse(ARGV[0] || `git show master --format=%cd`).to_date
last = ARGV[1] || Date.today

`git checkout master`
(first..last).each do |date|
  date_str = date.strftime('%Y-%m-%d 00:00:00 +0000')
  ENV['GIT_COMMITTER_DATE'] = date_str
  `git commit --allow-empty --date='#{date_str}' --message='#{date_str}'`
end
