#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

# Get file to open
my $numberOfArguments = @ARGV - 0;

if ($numberOfArguments < 3) {
    print "Missing arguments, expected 1 but got $numberOfArguments\n";
    exit;
}

my $fileName = $ARGV[0];

# Open file
# https://stackoverflow.com/questions/4505381/perl-read-line-by-line
open my $file, $fileName or die "Could not open $fileName: $!";

my %nameMap;

while( my $line = <$file>)  {
    # TODO Look at line
    # (?=:)(?=Mr|Mrs|Ms|Dr|Coach)*([A-Za-z ])+(?=:\/)
    last if $. == 2;
}

close $file;


# Search for duplicate first names
# baber:x:502:500:Dr Steve Baber:/home/baber:/bin/bash

# Count number
# Skip titles

# Output
# Aaron occurs 3 times.
