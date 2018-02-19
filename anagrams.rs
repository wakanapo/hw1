use std::error::Error;
use std::fs::File;
use std::io;
use std::io::BufReader;
use std::io::prelude::*;
use std::path::Path;

fn sort(s: &str) -> String {
    let mut chars: Vec<_> = s.chars().collect();
    chars.sort();
    chars.into_iter().collect()
}

fn check_anagram(target: &str, word: &str) -> bool {
    let sorted = sort(word);
    let mut pos = 0;
    for c in sorted.chars() {
        pos = match target[pos..].find(c) {
            None => return false,
            Some(p) => p + pos + 1,
        };
    }
    true
}

fn main() {
    let mut ans = String::new();
    let mut target = String::new();
    io::stdin().read_line(&mut target)
        .expect("failed to read line");

    let target: String = match target.trim().parse() {
        Ok(s) => s,
        Err(_) => panic!("couldn't read stdin."),
    };
    
    let sorted_target = sort(&target);

    let path = Path::new("/usr/share/dict/words");
    let display = path.display();

    let file = match File::open(&path) {
        Err(why) => panic!("couldn't open {}: {}", display,
                           Error::description(&why)),
        Ok(file) => file,
    };

    let reader = BufReader::new(file);
    let lines = reader.lines().map(|l| l.unwrap());

    for word in lines {
        let is_anagram = check_anagram(&sorted_target, &word);
        if is_anagram && (word.len() > ans.len()) {
            ans = word;
        }
    }
    println!("{} is the longest anagram of {}.", ans, target);
}
