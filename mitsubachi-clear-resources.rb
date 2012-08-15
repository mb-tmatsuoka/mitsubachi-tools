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

begin
  # ファイルサイズが0じゃないファイルをローカルに保存する
  files = m.resource_list(project_name, :filter => prefix.to_s)
  files['files'].each do |file|
    # 削除
    print "Delete #{file['name']} .... "
    resource = m.resource_delete(project_name, file['name'])
    puts "DONE"
  end
end until files['has_more_files'] == 0

