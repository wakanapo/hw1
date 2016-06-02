#!/usr/bin/env ruby
# coding: utf-8
# vim: set fileencoding=utf-8 :
#
# anagrams.rb
# 
# Author:   Wakana Nogami <Wakana.tn16@gmail.com>
# URL:      https://wknp16.tumblr.com               
# License:  2-Clause BSD License                    
# Created:  2016-06-02                              
#
#
# Copyright (c) 2016, Wakana Nogami
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
str = STDIN.gets.chomp.downcase.chars.sort.join

begin
  File.open('/usr/share/dict/words') do |file|
    ans = ''
    file.each_line do |dic|
      dic_sort = dic.chomp.downcase.chars.sort
      offset = -1
      dic_sort.each do |char|
        offset = str.index(char, offset+1)
        if offset == nil then
          break
        end
      end
      if offset != nil then
        ans = dic.length > ans.length ? dic : ans
      end
    end
    puts ans
  end
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e/message}])
end
