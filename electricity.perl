while (<>) { # Loop through each line
    @tmpArray = split;
    foreach (@tmpArray){
        push(@electric,  m/\w+'?[st]?/g);
    }
}
foreach (@electric){
    print $_;
    print "\n";
}


