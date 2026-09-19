# Windows

Run `craftmax.bat` from this directory. The script starts `luanti.exe` and
selects Craftmax automatically.

Set the `CRAFTMAX_ENGINE` environment variable to use a custom Luanti path.

## GitHub Actions package

The workflow at `.github/workflows/build-windows.yml` downloads the official
Luanti Windows runtime, places Craftmax in `games/Craftmax`, and uploads
`Craftmax-Windows-x64.zip` as a workflow artifact. Run it manually from the
Actions tab or push a tag beginning with `v`.

The source-build workflow at
`.github/workflows/build-windows-source.yml` compiles the pinned Luanti source
from `engine/` with MSYS2/Clang, bundles its DLLs, and uploads
`Craftmax-Windows-source-x64.zip`. Run it manually or push a tag beginning with
`engine-v`.

Build the same package locally with PowerShell:

```powershell
./platforms/windows/build.ps1
```