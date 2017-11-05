#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

# Get file to open
my $numberOfArguments = @ARGV - 0;

if ($numberOfArguments < 1) {
    print "Missing arguments, expected 1 but got $numberOfArguments\n";
    exit;
}

my $fileName = $ARGV[0];

# Open file
# https://stackoverflow.com/questions/4505381/perl-read-line-by-line
open my $file, $fileName or die "Could not open $fileName: $!";

my %nameMap;

while (my $line = <$file>) {

    my $name;
    if ($line =~ /(:[A-Za-z ]+(?=:\/))/) {
        $name = $1;
    } else {
        next;
    }

    $name =~ s/://;
    $name =~ s/Mr //;
    $name =~ s/Mrs //;
    $name =~ s/Ms //;
    $name =~ s/Dr //;
    $name =~ s/Coach //;

    if (exists $nameMap{$name}) {
        $nameMap{$name}++;
    } else {
        $nameMap{$name} = 1;
    }

}

close $file;

while(my($k, $v) = each %nameMap) {
    print($k . " occurs " . $v . " times. \n")
}
