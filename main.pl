#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my %nameMap;

foreach my $line (<STDIN>) {
    my $name;
    if ($line =~ /(:[A-Za-z ]+(?=:\/))/) {
        $name = $1;
    }
    else {
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
    }
    else {
        $nameMap{$name} = 1;
    }
}

while (my ($k, $v) = each %nameMap) {
    print($k . " occurs " . $v . " times. \n")
}
