<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
<head>
	<title>guestbook page 3</title>
	<meta name="author" content="kristofer nelson">
	<meta name="generator" content="vi">
</head>
<body>
<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$sql = "insert into entry2 (entryid, ssn, number, citizen, cheatedontaxes, thoughtsonseven) values ($entryid, " . ($ssn <> "" ? "'yes'" : "'no'") . ", $number, '$citizen', '$cheatedontaxes', '$thoughtsonseven');";
	pg_exec($db, $sql);
	pg_close($db);
?>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td width=64></td>
<td>
<p><form action="sign4.php3">
<?php print("<input type=hidden name=entryid value=$entryid>\n"); ?>
<table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td>mother's maiden name:</td>
<td width=7></td>
<td><input name="mothersmaidenname" size=42></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>pick a number:</td>
<td width=7></td>
<td><select name="number2" size=1>
<option>
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
<option>7
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>do you love your mother, or if your mother is dead, did you love your mother:</td>
<td width=7></td>
<td><select name="mother" size=1>
<option>yes
<option>no
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>do you think you may go postal:</td>
<td width=7></td>
<td><select name="postal" size=1>
<option>no
<option>yes
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td colspan=3 align="center"><input type="submit" value="sign guestbook"></td>
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
