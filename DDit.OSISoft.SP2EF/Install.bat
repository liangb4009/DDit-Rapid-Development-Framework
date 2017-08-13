%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe %CD%\bin\Debug\DDit.OSISoft.SP2EF.exe
Net Start SP2EFService
sc config SP2EFService start= auto