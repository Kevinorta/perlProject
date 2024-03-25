while (<>) { # Loop through each line
    @tmpArray = split;
    foreach (@tmpArray){
        push(@electric,  m/\w+ '? [st]?/gx);
    }
}

print "1. Sorted alphabetically with upper case words just in front of lower-case words with the
same initial characters.\n";
foreach $word(@electric)  #traverse the array of words
{ 
    $count{$word}++;   # add one to the hash entry for that word
} 

my @sorted = sort { lc($a) cmp lc($b) or $a cmp $b} keys %count; 
print join(" ",@sorted);


print "\n\n2. Frequency from high to low (alphabetical order for words with the same frequency)\n\n";
printf "%-20s %s\n", "word", "frequency";
printf "%-20s %s\n", "-----", "---------";
foreach (sort { $count{$b} <=> $count{$a} or $a cmp $b } keys %count) {
    printf "%-20s %s\n", $_, $count{$_};
}



