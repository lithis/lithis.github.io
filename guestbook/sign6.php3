<?php
	$db = pg_connect("", "", "", "", "guestbook");
	$sql = "insert into entry5 (entryid, blot1, blot1other, blot2, blot2other, blot3, blot3other, blot4, blot4other, blot5, blot5other, blot6, blot6other, blot7, blot7other) values ($entryid, '$blot1', '$blot1other', '$blot2', '$blot2other', '$blot3', '$blot3other', '$blot4', '$blot4other', '$blot5', '$blot5other', '$blot6', '$blot6other', '$blot7', '$blot7other');";
	pg_exec($db, $sql);
	pg_close($db);
	header("Location: signinf.php3?entryid=$entryid&page=6");
?>
