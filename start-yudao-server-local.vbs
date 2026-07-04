Option Explicit

Dim shell
Dim command

Set shell = CreateObject("WScript.Shell")

command = "cmd /c " & _
    """" & "C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot\bin\java.exe" & """" & _
    " -jar " & _
    """" & "D:\gongju\six6\ruoyi-vue-pro\yudao-server\target\yudao-server.jar" & """" & _
    " --spring.profiles.active=local" & _
    " 1>" & """" & "D:\gongju\six6\ruoyi-vue-pro\yudao-server-out.log" & """" & _
    " 2>" & """" & "D:\gongju\six6\ruoyi-vue-pro\yudao-server-err.log" & """"

shell.Run command, 0, False
