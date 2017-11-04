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

while (my $line = <$file>) {
    my $matches = $line =~ /(:[A-Za-z ]+(?=:\/))/;
    print $matches;

    $matches =~ s/Mr//;
    $matches =~ s/Mrs//;
    $matches =~ s/Ms//;
    $matches =~ s/Dr//;
    $matches =~ s/Coach//;

    if (exists $nameMap{$matches}) {
        $nameMap{$matches}++;
    } else {
        $nameMap{$matches} = 1;
    }

    last if $. == 2;
}

close $file;

while(my($k, $v) = each %nameMap) {
    print($k . " occurs " . $v . " times.")
}
