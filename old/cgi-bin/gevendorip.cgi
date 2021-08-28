#!/usr/local/bin/perl -w

if ($ENV{QUERY_STRING})
{
	$_ = $ENV{QUERY_STRING};
}
else
{
	$_ = "";
}

if (/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/)
{
	open(GEVIP, ">.gevendorip");
	print GEVIP $_;
	close GEVIP;
}

open(GEVIP, "<.gevendorip");
$gevip = <GEVIP>;
close GEVIP;

print "Content-Type: text/html\n\n";

if ($gevip ne "0.0.0.0")
{
	print "<a href=\"http://$gevip\">$gevip</a>\n";
}
else
{
	print "offline\n";
}

