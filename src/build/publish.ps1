param([string]$betaver)

if ([string]::IsNullOrEmpty($betaver)) {
	$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\main\SegCtlr.Netstandard\bin\Release\netstandard2.0\Plugin.Segmented.dll')).Version.ToString(3)
	}
else {
		$version = [Reflection.AssemblyName]::GetAssemblyName((resolve-path '..\main\SegCtlr.Netstandard\bin\Release\netstandard2.0\Plugin.Segmented.dll')).Version.ToString(3) + "-" + $betaver
}

.\build.ps1 $version

Nuget.exe push ".\NuGet\Plugin.SegmentedControl.Netstandard.$version.symbols.nupkg" -Source https://api.nuget.org/v3/index.json