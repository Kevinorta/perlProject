open(ELECTRIC,"<electricity.txt");
while (<ELECTRIC>) { # Loop through each line
    @tmpArray = split;
    foreach (@tmpArray){
        push(@electric,  m/\w+ '? [st]?/gx); #find and push into an array each word by matching one or more alphanumeric characters optionally followed by a apostrophe s or t.  
    }
}

foreach $word(@electric)  #traverse the array of words
{ 
    $count{$word}++;   # add one to the hash entry for that word
} 
print "1. Sorted alphabetically with upper case words just in front of lower-case words with the
same initial characters.\n";
#uses the hash which eliminates repeated word entries.
@sorted = sort { lc($a) cmp lc($b) or $a cmp $b} keys %count; #using the keys from the count hash, just the words, words are sorted by their lowercase 
                                                                #if they are the same word, they are sorted again with their original case 
                                                                #putting uppercase words first before the same word but lowercase  
print join("\n",@sorted); #joining a new line and each word from the sorted array


print "\n\n2. Frequency from high to low (alphabetical order for words with the same frequency)\n\n";
printf "%-20s %s\n", "word", "frequency"; #formatting Titles in columns 
printf "%-20s %s\n", "-----", "---------"; 
foreach (sort { $count{$b} <=> $count{$a} or $a cmp $b } keys %count) { #compares the count value of each key highest to lowest,
                                                                        #words with same count get compared alphabetically 
    printf "%-20s %s\n", $_, $count{$_}; #printing the key and value in the same column formatting 
}



