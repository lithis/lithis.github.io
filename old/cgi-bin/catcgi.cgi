#!/usr/local/bin/perl -w

if ($ENV{QUERY_STRING})
{
	$_ = $ENV{QUERY_STRING};
}
else
{
	$_ = "catcgi.cgi";
}

if (/.+\.cgi$/)
{
	open(CGI, "<$_");
	
	print "Content-Type: text/html\n\n";
	
	print "<html>\n";
	print "<head>\n";
	print "    <title>catcgi: $_</title>\n";
	print "</head>\n";
	print "<body>\n";
	print "<pre>\n";
	
	while (<CGI>)
	{
		s/&/&amp;/g;
		s/</&lt;/g;
		s/>/&gt;/g;
		print;
	}
	
	print "\n";
	print "</pre>\n";
	print "</body>\n";
	print "</html>\n";
	
	close CGI;
}
else
{
	print "Content-Type: text/html\n\n";
	
	print "only works with cgi (*.cgi) files.\n";
}

