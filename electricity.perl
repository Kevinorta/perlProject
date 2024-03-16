while (<>) { # Loop through each line
    @tmpArray = split;
    foreach (@tmpArray){
        push(@electric,  m/\w+'?[st]?/g);
    }
}
@sortedElec = sort @electric;
%freqHash;
while ($i < $#sortedElec){
    $count = 1; 
    $freqHash{$sortedElec[$i]} = $count;
    while ($sortedElec[$i] eq $sortedElec[$i+1]){
        $i++;
        $count++;
    }
    $freqHash{$sortedElec[$i]} = $count;
    $i++;
}
$total = 0;

printf "%-20s %s\n", "word", "frequency";
foreach $word (sort { $freqHash{$b} <=> $freqHash{$a} or $a cmp $b } keys %freqHash) {
    printf "%-20s %s\n", $word, $freqHash{$word};
}


