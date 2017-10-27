# mr-kureos

Mr. I. M. Kureos manages a Linux server.  He likes to keep track of the names of the users of his system.  Your assignment is to write a Perl program that will help him.  Your Perl program should expect a list of records via the standard input device (STDIN) that match the format of the lines in the file: /etc/passwd.  For instance, here are a few sample lines from the /etc/passwd file on TAZ:

    tcpdump:x:72:72::/:/sbin/nologin
    baber:x:502:500:Dr Steve Baber:/home/baber:/bin/bash
    gfoust:x:501:500:Mr Gabriel Foust:/home/gfoust:/bin/bash
    tbaird:x:503:500:Dr Tim Baird:/home/tbaird:/bin/bash
    fmccown:x:504:500:Dr Frank McCown:/home/fmccown:/bin/bash
    ragsdale:x:505:500:Coach Scott Ragsdale:/home/ragsdale:/bin/bash
    dsteil:x:506:500:Dr Dana Steil:/home/dsteil:/bin/bash
    mwallers:x:682:501:Monica Wallers:/home/mwallers:/bin/bash

Rather than type such lines in by hand, Mr. Kureos plans to use redirection to enter all of the lines from the /etc/passwd file.   That is, if the name of your Perl program is GetNames, Mr. Kureos will enter the command:

    $ ./GetNames  </etc/passwd

so that all of the lines are delivered to your program via the STDIN device.


Your program should parse all of the lines and search for users that have the same first name.  The list of duplicate first names (those that occur more than once) along with how many times they occur should be displayed in alphabetical order.  Be sure to skip over the titles: “Mr”, “Mrs”, “Ms”, “Dr” or “Coach”.  You may assume that if the GID field (the 4th field) is < 500, that it corresponds to a system account and not an individual.  System accounts should be ignored.  You may assume that the input will contain no blank lines.
 
The output should be similar to the following sample run:

    $ GetNames </etc/passwd
    Aaron occurs 3 times.
    Adam occurs 3 times.
    Andrew occurs 8 times.
    Anna occurs 3 times.
    Austin occurs 4 times.
    Barrett occurs 2 times.
    Benjamin occurs 2 times.
    ...
    
Hints:
    1. The split() function may help parse the incoming lines.
    2. A hash will prove helpful for keeping track of duplicate names.
    3. Be sure that a hash entry already exists before you try to increment its value.
