#!/usr/bin/perl -w
print "Content-Type: text/html\n\n";

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
print "<P><FORM ACTION=\"signinf.cgi\">\n";
print "<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=\"100%\">\n";

open(PAGEINF, "html/signinf.html");
while (<PAGEINF>)
{
	push(@pageinf, $_);
}

srand;

for ($index = 1; $index <= 7; $index++)
{
	print $pageinf[rand($#pageinf)];
}

print "<TR>\n";
print "<TD COLSPAN=3 ALIGN=\"CENTER\"><INPUT TYPE=\"SUBMIT\" VALUE=\"Sign Guestbook\"></TD>\n";
print "</TR>\n";
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
