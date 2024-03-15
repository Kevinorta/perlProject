open(SOLAR, "solar.txt");

while ($line = <SOLAR>) { # Loop through each line
    push(@solar, $line);
}