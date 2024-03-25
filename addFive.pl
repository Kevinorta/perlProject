while (<>) { # Loop through each line
    push(@arr, $_);
}
foreach (@arr){
    print $_;
    $_ =~ s/(\d+)/$1+5/ge;
    print $_;
}
#add sample text file and append result to result file