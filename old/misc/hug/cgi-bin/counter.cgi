#!/usr/bin/perl -w

print "Content-Type: image/gif\n";
print "Location: http://www.cpinternet.com/~lithis/misc/hug/images/star.gif\n\n";

open(COUNTER, "<.counter");
$counter = <COUNTER>;
close(COUNTER);

open(COUNTER, ">.counter");
print COUNTER ++$counter, "\n";
