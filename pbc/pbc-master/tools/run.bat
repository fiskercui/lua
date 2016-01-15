protoc.exe -I=./ addressbook.proto --descriptor_set_out addressbook.pb
protoc.exe -I=./ ClientSvrMsg.proto --descriptor_set_out ClientSvrMsg.pb

xcopy /Y /Q ".\*.proto" "..\..\..\src\net\protoc\"

xcopy /Y /Q ".\*.pb" "..\..\..\src\net\protoc\"


pause