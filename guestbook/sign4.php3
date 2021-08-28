<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
<head>
	<title>guestbook page 4</title>
	<meta name="author" content="kristofer nelson">
	<meta name="generator" content="vi">
</head>
<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$sql = "insert into entry3 (entryid, mothersmaidenname, number2, postal) values ($entryid, '$mothersmaidenname', $number2, '$postal');";
	pg_exec($db, $sql);
	pg_close($db);
?>
<body>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td width=64></td>
<td>
<p><form action="sign5.php3">
<?php
	print("<input type=hidden name=entryid value=$entryid>\n");
	print("<input type=hidden name=lovemother value=$mother>\n");
?>
<table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td>do you love your mother, or if your mother is dead, did you love your mother:</td>
<td width=7></td>
<td><select name="lovemother2" size=1>
<option>yes
<option>no
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>pick a number:</td>
<td width=7></td>
<td><select name="number3" size=1>
<option>7
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>choose a password:</td>
<td width=7></td>
<td><input name="password" type="password" size=42></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>re-enter your password:</td>
<td width=7></td>
<td><input name="password2" type="password" size=42></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td colspan=3 align="center"><input type="hidden" name="entry" value=%s><input type="submit" value="sign guestbook"></td>
</tr>
</table>
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
