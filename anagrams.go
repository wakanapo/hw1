package main

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"sort"
	"strings"
)

var ans string;

func SortString(str string) []string {
	str_sort := strings.Split(strings.ToLower(str), "")
	sort.Strings(str_sort)
	return str_sort
}

func Solve(dic string, str string) string{
	ofset := 0
	pos := 0
	dic_sort := SortString(dic)
	for _, v := range dic_sort[1:] {
		pos = strings.Index(str[ofset:], v)
		if pos < 0 {
			return "";
		}
		ofset = pos + ofset + 1
	}
	if len(dic) > len(ans){
		ans = dic
	}
	return ans;
}

func main() {
	var fp *os.File
	var err error
	var str string

	fmt.Scan(&str)
	str = strings.Join(SortString(str), "")

	fp, err = os.Open("/usr/share/dict/words")
	if err != nil {
		panic(err)
	}
	defer fp.Close()

	reader := bufio.NewReader(fp)
	for {
		line, err := reader.ReadString('\n')
		if err == io.EOF {
			break
		} else if err != nil {
			panic(err)
		}
		Solve(line, str)
	}
	if len(ans) <= 0 {
		ans = "not found\n"
	}
	fmt.Print(ans)
}
