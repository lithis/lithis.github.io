#!/usr/bin/perl -w

print "Content-type: text/html\n\n";

if ($ENV{QUERY_STRING})
{
	$_ = $ENV{QUERY_STRING};
}
else
{
	$_ = "ssn=7&number1=7&citizen=Yes&taxes=No&thoughts=dark&entry=8";
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

open(ENTRY, ">>data/$query{entry}_2");

print ENTRY "<TR>\n";
print ENTRY "<TD>Social Security Number:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
if ($query{ssn} eq "")
{
	print ENTRY "<TD>Was entered</TD>\n";
}
else
{
	print ENTRY "<TD>Was not entered</TD>\n";
}
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>Pick a Number:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
print ENTRY "<TD>$query{number1}</TD>\n";
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>Are you a citizen of the United States, a lawful Permanent Resident of the United States, a citizen of Canada, or a lawful Permanent Resident of Canada:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
print ENTRY "<TD>$query{citizen}</TD>\n";
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>Have you ever cheated on your taxes:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
print ENTRY "<TD>$query{taxes}</TD>\n";
print ENTRY "</TR>\n";
print ENTRY "<TR>\n";
print ENTRY "<TD>What are your thoughts on the number seven:</TD>\n";
print ENTRY "<TD WIDTH=7></TD>\n";
print ENTRY "<TD>$query{thoughts}</TD>\n";
print ENTRY "</TR>\n";

close(ENTRY);

open(HTML, "html/sign3.html");
while (<HTML>)
{
	s/%s/$query{entry}/gi;
	print;
}