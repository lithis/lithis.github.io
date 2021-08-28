<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
<head>
	<title>guestbook page 5</title>
	<meta name="author" content="kristofer nelson">
	<meta name="generator" content="vi">
</head>
<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$sql = "insert into entry4 (entryid, lovemother, number3, password) values ($entryid, " . ($lovemother == $lovemother2 ? "'yes'" : "'no'") . ", $number3, " . ($password == $password2 ? "'yes'" : "'no'") . ");";
	pg_exec($db, $sql);
	pg_close($db);
?>
<body>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td width=64></td>
<td>
<p><form action="sign6.php3">
<?php print("<input type=hidden name=entryid value=$entryid>\n"); ?>
<table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td align="center" colspan=3><img src="../images/blot1.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot1" size=1>
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot1other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot2.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot2" size=1>
<option>a snake
<option>a hat
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot2other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot3.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot3" size=1>
<option>a happy face
<option>a colon and a parenthesis
<option>you
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot3other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot4.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot4" size=1>
<option>mr. potato head
<option>mr. hankey
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot4other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot5.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot5" size=1>
<option>the letter g
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot5other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot6.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot6" size=1>
<option>someone you know
<option>an ink blot
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot6other" size=42></td>
</tr>
<tr><td height=28></td></tr>
<tr>
<td align="center" colspan=3><img src="../images/blot7.gif" width=192 height=128></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>what does this look like:</td>
<td width=7></td>
<td><select name="blot7" size=1>
<option>your tv
<option>the night sky
<option>the number seven
<option>other (describe below)
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>other (description):</td>
<td width=7></td>
<td><input name="blot7other" size=42></td>
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
