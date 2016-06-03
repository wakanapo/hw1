import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

import java.util.Arrays;

class anagram {
  public static void main(String args[]) {
    try{
      File file = new File("/usr/share/dict/words");
      BufferedReader dicReader = new BufferedReader(new FileReader(file));
      BufferedReader strReader = new BufferedReader(new InputStreamReader(System.in), 1);

      String str = strReader.readLine();
      String strSort = new String(sort(str));
      strReader.close();

      String dic;
      String ans = "";
      while((dic = dicReader.readLine()) != null) {
        if(isAnagram(strSort, dic) && (dic.length() > ans.length())) ans = dic;
      }
      System.out.println(ans);
      dicReader.close();
    } catch(FileNotFoundException e){
      System.out.println(e);
    } catch (IOException e){
      System.out.println(e);
    }
  }

  public static char[] sort(String str) {
    char[] chars = str.toLowerCase().toCharArray();
    Arrays.sort(chars);
    return chars;
  }

  public static boolean isAnagram(String str, String dic) {
    char[] dicSorts = sort(dic);
    int pos = -1;
    for(int i = 0; i < dicSorts.length; i++){
      pos = str.indexOf(dicSorts[i], pos+1);
      if(pos == -1) return false;
    }
    return true;
  }
}

