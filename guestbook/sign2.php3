<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
<head>
	<title>hethrael - guestbook page 2</title>
	<meta name="author" content="lithis (kristofer nelson)">
	<meta name="generator" content="vi">
</head>
<body>
<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$date = getdate();
	$sql = "insert into entry1 (signedat, name, emailaddress, webpageaddress, webpagename, howfoundsite, comments) values ('$date[year]-$date[month]-$date[mday] $date[hours]:$date[minutes]', '$name', '$emailaddress', '$webpageaddress', '$webpagename', '$howfoundsite', '$comments');";
	$result = pg_exec($db, $sql);
	$oid = pg_getlastoid($result);
	$sql = "select * from entry1 where oid = $oid";
	$result = pg_exec($db, $sql);
	$row = pg_fetch_array($result, 0);
	$entryid = $row["entryid"];
	pg_close($db);
?>

<center><table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td width=64></td>
<td>
<p><form action="sign3.php3">
<?php print("<input type=hidden name=entryid value=$entryid>\n"); ?>
<table border=0 cellspacing=0 cellpadding=0 width="100%">
<tr>
<td>social security number:<br>
<font size=-2>by law, you are not required to enter your social security
number. in fact, it would be incredibly stupid on your
part to do so. have a nice day!</font></td>
<td width=7></td>
<td><input name="ssn" size=42></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>pick a number:</td>
<td width=7></td>
<td><select name="number" size=1>
<option>
<option>1
<option>2
<option>3
<option>4
<option>5
<option>6
<option>7
<option>8
<option>9
<option>10
<option>11
<option>12
<option>13
<option>14
<option>15
<option>16
<option>17
<option>18
<option>19
<option>20
<option>21
<option>22
<option>23
<option>24
<option>25
<option>26
<option>27
<option>28
<option>29
<option>30
<option>31
<option>32
<option>33
<option>34
<option>35
<option>36
<option>37
<option>38
<option>39
<option>40
<option>41
<option>42
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>are you a citizen of the united states,
a lawful permanent resident of the united states,
a citizen of canada, or a lawful permanent resident of canada:</td>
<td width=7></td>
<td><select name="citizen" size=1>
<option>yes
<option>no
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td>have you ever cheated on your taxes:</td>
<td width=7></td>
<td><select name="cheatedontaxes" size=1>
<option>no
<option selected>yes
</select></td>
</tr>
<tr><td height=7></td></tr>
<tr>
<td valign="top">what are your thoughts on the number seven:</td>
<td width=7></td>
<td><textarea name="thoughtsonseven" cols=42 rows=70></textarea></td>
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
