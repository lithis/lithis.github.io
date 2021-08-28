#!/usr/bin/perl -w

print "Content-type: text/html\n\n";

print "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n";
print "<HTML>\n";
print "<HEAD>\n";
print "   <TITLE>Guestbook</TITLE>\n";
print "   <META NAME=\"Author\" CONTENT=\"lithis\">\n";
print "   <META NAME=\"GENERATOR\" CONTENT=\"Notepad\">\n";
print "   <META NAME=\"KeyWords\" CONTENT=\"Seven, 7\">\n";
print "</HEAD>\n";
print "<BODY TEXT=\"#CCCCCC\" BGCOLOR=\"#000000\" LINK=\"#3366FF\" VLINK=\"#6633FF\" ALINK=\"#FF6633\">\n";
print "\n";
print "<CENTER><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=\"100%\">\n";
print "<TR>\n";
print "<TD WIDTH=64></TD>\n";
print "<TD>\n";
print "<TABLE BORDER=1 CELLSPACING=4 CELLPADDING=4 WIDTH=\"100%\">\n";

open(ENTRIES, "data/entries");
$entry = <ENTRIES>;
close(ENTRIES);

for (; $entry >= 1; $entry--)
{
	open(ENTRY, "data/$entry" . "_1");
	
	while (<ENTRY>)
	{
		print;
	}
	
	close(ENTRY);
	
	for ($subentry = 2; $subentry <= 5; $subentry++)
	{
		if(-e ("data/$entry" . "_$subentry"))
		{
			open(ENTRY, "data/$entry" . "_$subentry");
			
			while (<ENTRY>)
			{
				print;
			}
			
			close(<ENTRY>);
		}
	}
	
	print "</TR>\n";
	print "<TD WIDTH=\"20%\"></TD>\n";
	print "<TD WIDTH=7></TD>\n";
	print "<TD></TD>\n";
	print "<TR>\n";
}

print "</TABLE>\n";
print "</FORM></P>\n";
print "\n";
print "</TD>\n";
print "<TD WIDTH=64></TD>\n";
print "</TR>\n";
print "</TABLE>\n";
print "\n";
print "<CENTER><TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=\"100%\" HEIGHT=\"10%\">\n";
print "<TR>\n";
print "<TD></TD>\n";
print "</TR>\n";
print "</TABLE></CENTER>\n";
print "\n";
print "<CENTER><P><FONT SIZE=-1>WWW: <A HREF=\"http://www.cpinternet.com/~lithis/\">http://www.cpinternet.com/~lithis/<BR>\n";
print "</A>E-Mail: <A HREF=\"mailto:lithis\@cpinternet.com\">lithis\@cpinternet.com</A></FONT></P></CENTER>\n";
print "\n";
print "<CENTER><P><FONT SIZE=-1>Copyright lithis, 1998.<BR>\n";
print "All Rights Reserved.</FONT></P></CENTER>\n";
print "\n";
print "</BODY>\n";
print "</HTML>\n";
