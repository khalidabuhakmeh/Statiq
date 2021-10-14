@echo off

ren Directory.Build.props Directory.Build.temp

cd "Statiq.Framework\build\Statiq.Framework.Build"
dotnet run -- %*
cd %~dp0

echo Timeout for 5 minutes to wait for NuGet indexing
timeout /t 300

cd "Statiq.Web\build\Statiq.Web.Build"
dotnet run -- %*
cd %~dp0

echo Timeout for 5 minutes to wait for NuGet indexing
timeout /t 300

cd "Statiq.Docs\build\Statiq.Docs.Build"
dotnet run -- %*
cd %~dp0

ren Directory.Build.temp Directory.Build.props