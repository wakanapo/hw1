/* 
 * anagrams.cpp
 * 
 * Author:   Wakana Nogami <wakana.tn16@gmail.com>
 * URL:      http://wknp16.tumblr.com               
 * License:  2-Clause BSD License                    
 * Created:  2016-05-28                              
 *
 *
 * Copyright (c) 2016, Wakana Nogami
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */


#include <algorithm>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <string>

using namespace std;
string ans;

string solve(string dic, string str) {
  string dic_sort = dic;
  transform (dic_sort.begin(), dic_sort.end(), dic_sort.begin(), ::tolower);
  sort(dic_sort.begin(), dic_sort.end());
  string::size_type pos = -1;
  for(string::size_type i = 0; i < dic_sort.length(); i++){
    pos = str.find(dic_sort[i], ++pos);
    if(pos == string::npos) return "";
  }
  ans = (ans.length() > dic.length())? ans : dic;
  return ans;
}

int main() {
  ifstream ifs("/usr/share/dict/words");
  string dic, str;
  cin >> str;
  sort(str.begin(), str.end());
  if (ifs.fail()) {
    cerr << "error" << endl;
    return -1;
  }
  while (getline(ifs, dic)) {
    solve(dic, str);
  }
  cout << ans << endl;
  return 0;
}
