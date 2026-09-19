#define AppVersion GetEnv("CRAFTMAX_VERSION")
#define SourceRoot GetEnv("CRAFTMAX_INSTALLER_SOURCE")
#define OutputRoot GetEnv("CRAFTMAX_INSTALLER_OUTPUT")

[Setup]
AppId={{B7C3D6D2-5D59-4B44-9C2D-202609190001}
AppName=Craftmax
AppVersion={#AppVersion}
AppPublisher=NotHIGH
DefaultDirName={autopf}\Craftmax
DefaultGroupName=Craftmax
OutputDir={#OutputRoot}
OutputBaseFilename=Craftmax-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode=x64
UninstallDisplayIcon={app}\bin\luanti.exe

[Files]
Source: "{#SourceRoot}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Craftmax"; Filename: "{app}\bin\luanti.exe"; WorkingDir: "{app}"
Name: "{autodesktop}\Craftmax"; Filename: "{app}\bin\luanti.exe"; WorkingDir: "{app}"

[Run]
Filename: "{app}\bin\luanti.exe"; WorkingDir: "{app}"; Description: "Start Craftmax"; Flags: postinstall nowait skipifsilent