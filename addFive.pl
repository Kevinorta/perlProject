print("Original Text:\n");

open(RESULT, ">>result.txt"); #open/create result.txt to append to it.
open(INPUT, "<input.txt"); #opens input.txt to read from

while (<INPUT>) { # Loop through the input line by line
    chomp($_); #remove new line from each line
    print "$_\n"; #prints the words
    $_ =~ s/(-? \d+ \.? \d*)/$1+5/xge; # -? negative or not followed by \d+ one or more digits, followed by 0 or 1 . decimal point, followed by 0 or more digits. 
                                       #This integer or float stored in a group () and is substituted with the group $1+5. e option added to evaluate the expression
                                       #g global flag and 
    print RESULT "$_\n"; #appends the resulting scalar to the result.txt file
}

print("\nResult Text after adding 5 to every number:\n");
open(RESULT, "<result.txt"); #opens result.txt to read from
while(<RESULT>){ #prints each line
    print "$_"; 
}

close(RESULT);
