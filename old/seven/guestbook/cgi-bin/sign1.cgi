#!/usr/bin/perl -w

print "Content-type: text/html\n\n";

open(HTML, "html/sign1.html");
while (<HTML>)
{
	print;
}