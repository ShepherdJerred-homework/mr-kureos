#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

my %nameMap;

foreach my $line (<STDIN>) {
    my $name;

    if ($line =~ /\s\S+:[a-zA-Z]:\d+:(\d+)/) {
        my $gid = $1;
        if ($gid > 500) {
            next;
        }
    }

    # Has a title before name
    if ($line =~ /:[Dr|Mr|Coach|Mrs|Ms]* ([A-Za-z]+)/) {
        $name = $1;
    } else {
        # No title before name
        if ($line =~ /:([A-Za-z]+) /) {
            $name = $1;
        } else {
            $name = "Error";
        }
    }

    if (exists $nameMap{$name}) {
        $nameMap{$name}++;
    }
    else {
        $nameMap{$name} = 1;
    }
}

foreach my $key (sort keys %nameMap) {
    print $key . " occurs " . $nameMap{$key} . " times. \n";
}
