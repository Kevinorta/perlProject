open(SOLAR,"<solar.txt");
while (<SOLAR>) { # Loop through each line of solar.txt
    push(@solar, $_);
}

print("\n1. All records without a discoverer.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_); #Each line split into an array of fields.
    if ($tmpArray[7] eq "-"){ #using index 7 corresponding to the discoverer field to check if its empty "-"
        print $_; #if no discoverer the entire entry is printed
    }
}
print("\n2. All records ommitting the object it orbits.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_); #Each line split into an array of fields.
    splice(@tmpArray,2,1); #splicing the array at index 2 which is the orbiting object, 1 item is spliced
    print join(" ",@tmpArray); #printing the spliced array joined back together
}

print("\n3. All satellites that have negative orbital periods.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_); #Each line split into an array of fields.
    if ($tmpArray[4] < 0){ #using index 4 corresponding to the oribital period and checking if its negative
        print $_; 
    }
}

print("\n4. All objects discovered by Cassini.\n\n");
foreach (@solar){
    @tmpArray = split(/ /, $_); #Each line split into an array of fields.
    if ($tmpArray[7] eq "Cassini"){ #using index 7 corresponding to the discoverer field to check if its equal to "Cassini"
        print $_;
    }
}
