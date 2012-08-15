#!/usr/bin/env ruby
# -*- coding : utf-8 -*-
$:.unshift File.dirname(__FILE__)
require 'rubygems'
require 'mushikago'
require 'fileutils'
require 'yaml'

load 'mushikago-credentials.rb'

if ARGV.size == 0
  puts "よくわかるつかいかた"
  puts "#{__FILE__} <project_name> [prefix]"
  exit
end

project_name = ARGV.shift
prefix = ARGV.shift

m = Mushikago::Mitsubachi::Client.new

limit = 20
offset = 0

begin
  # ファイルサイズが0じゃないファイルをローカルに保存する
  files = m.resource_list(project_name, :filter => prefix.to_s, :limit => limit, :offset => offset)
  files['files'].reject{|file| file['size'] == 0}.each do |file|
    next if File.exists?(file['name'])
    # ディレクトリ作成
    dir_name = file['name'][/^.+\//]
    FileUtils.mkdir_p(dir_name)

    # ダウンロード
    print "Download #{file['name']} .... "
    resource = m.resource_get(project_name, file['name'])
    uri = URI.parse(resource['url'])
    body = Net::HTTP.get(uri.host, uri.request_uri)

    # 保存
    File.open(file['name'], 'w') do |f|
      f << body
    end

    puts "DONE"
  end

  offset += limit
end until files['has_more_files'] == 0

