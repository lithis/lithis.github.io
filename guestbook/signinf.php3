<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
<head>
<?php
	$page++;
	print("	<title>guestbook page $page</title>\n");
?>
	<meta name="author" content="kristofer nelson">
	<meta name="generator" content="vi">
</head>
<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$sql = "";
	#pg_exec($db, $sql);
	pg_close($db);
?>
<body>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td width=64></td>
<td>
<p><form action="signinf.php3">
<?php
	print("<input type=hidden name=entryid value=$entryid>\n");
	print("<input type=hidden name=page value=$page>\n");
?>
<input type="submit" value="sign guestbook">
</form></p>

</td>
<td width=64></td>
</tr>
</table>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%" height="10%">
<tr>
<td></td>
</tr>
</table></center>

<center><p><font size=-1>www: <a href="http://www.cpinternet.com/~lithis/">http://www.cpinternet.com/~lithis/<br>
</a>e-mail: <a href="mailto:lithis@cpinternet.com">lithis@cpinternet.com</a></font></p></center>

<center><p><font size=-1>copyright kristofer nelson, 1998.<br>
all rights reserved.</font></p></center>

</body>
</html>
