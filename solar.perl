open(SOLAR, "solar.txt");

while ($line = <SOLAR>) { # Loop through each line
    push(@solar, $line);
}
close(SOLAR);
print("\n1. All records without a discoverer.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_);
    if ($tmpArray[7] eq "-"){
        print $_;
    }
}
print("\n2. All records ommitting the object it orbits.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_);
    splice(@tmpArray,2,1);
    print join(" ",@tmpArray);
}

print("\n3. All satellites that have negative orbital periods.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_);
    if ($tmpArray[4] < 0){
        print $_;
    }
}

print("\n4. All objects discovered by Cassini.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_);
    if ($tmpArray[7] eq "Cassini"){
        print $_;
    }
}
