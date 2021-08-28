#!/usr/local/bin/perl -w

print "Content-Type: text/html\n\n";

print "<html>\n";
print "<head>\n";
print "<title>Counter7</title>\n";
print "</head>\n";
print "<body>\n";

$time = localtime;

open(TIMES, "<.counter7");
while (<TIMES>)
{
	push(@times, $_);
}
close(TIMES);

push(@times, $time . "\n");

open(TIMES, ">.counter7");
print TIMES @times[-7..-1];

print "<p>You are the 7th person to visit this page since ";
print $times[-7];
print "</p>\n";

print "</body>\n";
print "</html>\n";
