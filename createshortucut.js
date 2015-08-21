// createshortcut.js
// Description: Creates a shortcut in the same directory/folder with the name of the folder as the name of the link.
// The link runs mshta.exe with main.html as its argument.

var WshShell = WScript.CreateObject("WScript.Shell");

var oShellLink = WshShell.CreateShortcut("ctemp.lnk");
var scriptFullName = WScript.ScriptFullName;
var scriptFullPath = scriptFullName.substring(0, scriptFullName.lastIndexOf("\\"));
var scriptName = scriptFullPath.substr(scriptFullPath.lastIndexOf("\\") + 1);
oShellLink = null;
var oShellLink = WshShell.CreateShortcut(scriptName + ".lnk");
oShellLink.TargetPath = "mshta.exe";
oShellLink.Arguments = scriptFullPath + "\\main.hta";
oShellLink.WindowStyle = 1;
oShellLink.IconLocation = "mshta.exe, 0";
oShellLink.Description = "Generated shortcut for " + scriptName;
oShellLink.WorkingDirectory = scriptFullPath;
oShellLink.Save();
oShellLink = null;

