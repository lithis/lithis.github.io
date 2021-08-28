#!/usr/bin/perl -w

if ($ENV{QUERY_STRING})
{
	$_ = $ENV{QUERY_STRING};
}
else
{
	$_ = "blot1desc=Other+%28Describe+Below%29&blot1other=7&blot2desc=Other+%28Describe+Below%29&blot2other=n&blot3desc=Other+%28Describe+Below%29&blot3other=n&blot4desc=Other+%28Describe+Below%29&blot4other=n&blot5desc=Other+%28Describe+Below%29&blot5other=n&blot6desc=Other+%28Describe+Below%29&blot6other=n&blot7desc=Other+%28Describe+Below%29&blot7other=n&entry=3";
}

@query = m/([^=]*)=([^\&]*)&*/g;
for (@query)
{
	s/\+/ /g;
	s/%21/\x21/gi;
	s/%22/\x22/gi;
	s/%23/\x23/gi;
	s/%24/\x24/gi;
	s/%25/\x25/gi;
	s/%26/\x26/gi;
	s/%27/\x27/gi;
	s/%28/\x28/gi;
	s/%29/\x29/gi;
	s/%2a/\x2a/gi;
	s/%2b/\x2b/gi;
	s/%2c/\x2c/gi;
	s/%2d/\x2d/gi;
	s/%2e/\x2e/gi;
	s/%2f/\x2f/gi;
	s/%3a/\x3a/gi;
	s/%3b/\x3b/gi;
	s/%3c/\x3c/gi;
	s/%3d/\x3d/gi;
	s/%3e/\x3e/gi;
	s/%3f/\x3f/gi;
	s/$40/\x40/gi;
	s/%5b/\x5b/gi;
	s/%5c/\x5c/gi;
	s/%5d/\x5d/gi;
	s/%5e/\x5e/gi;
	s/%5f/\x5f/gi;
	s/%60/\x60/gi;
	s/%7b/\x7b/gi;
	s/%7c/\x7c/gi;
	s/%7d/\x7d/gi;
	s/%7e/\x7e/gi;
}

%query = @query;

open(ENTRY, ">>data/$query{entry}_5");

print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 1 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot1other} eq "")
{
	print ENTRY "<TD>$query{blot1desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot1other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 2 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot2other} eq "")
{
	print ENTRY "<TD>$query{blot2desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot2other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 3 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot3other} eq "")
{
	print ENTRY "<TD>$query{blot3desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot3other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 4 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot4other} eq "")
{
	print ENTRY "<TD>$query{blot4desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot4other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 5 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot5other} eq "")
{
	print ENTRY "<TD>$query{blot5desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot5other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 6 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot6other} eq "")
{
	print ENTRY "<TD>$query{blot6desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot6other}</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What does ink blot 7 looks like:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{blot7other} eq "")
{
	print ENTRY "<TD>$query{blot7desc}</TD>\n";
}
else
{
	print ENTRY "<TD>$query{blot7other}</TD>\n";
}
print ENTRY "</TR>\n";

close(ENTRY);

do "signinf.cgi";