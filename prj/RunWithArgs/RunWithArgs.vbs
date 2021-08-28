' Run With Arguments
' version 0.1
' http://hethrael.com/prj/RunWithArgs/

cmd = WScript.Arguments.Item(0)
args = InputBox("Enter the command line arguments for" & vbCrLf & cmd, "Run with Arguments")
If args <> "" Then
	WScript.CreateObject("WScript.Shell").Run ("""" & cmd & """ " & args)
End If

