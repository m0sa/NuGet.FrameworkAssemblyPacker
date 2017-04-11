# NuGet.FrameworkAssemblyPacker

[![Build status](https://ci.appveyor.com/api/projects/status/5jtbw2xo1l4i2vse/branch/master?svg=true)](https://ci.appveyor.com/project/m0sa/nuget-frameworkassemblypacker/branch/master)

[A pollyfill for nuget Issue #](https://github.com/NuGet/Home/issues/4853) that allows adding `<frameworkAssemblies>` to nuget packages built with the `<Project Sdk="Microsoft.NET.Sdk">`.

### Usage

```
Install-Package NuGet.FrameworkAssemblyPacker
```

In your `.csproj` add the `PackAsFrameworkAssembly` metadata to the `<Reference>` items that you want to end up in the package, e.g.

```xml
  <ItemGroup Condition=" '$(TargetFramework)' == 'net40' OR '$(TargetFramework)' == 'net45' ">
    <Reference Include="System" />
    <Reference Include="System.Data">
      <PackAsFrameworkAssembly>true</PackAsFrameworkAssembly>
    </Reference>
    <Reference Include="System.Xml" PackAsFrameworkAssembly="true" />
  </ItemGroup>
```

This would add the following fragment to the `.nuspec` file:

```xml
  <metadata>
    <!-- ... -->
    <frameworkAssemblies>
      <frameworkAssembly assemblyName="System.Data" targetFramework="net40" />
      <frameworkAssembly assemblyName="System.Xml" targetFramework="net40" />
      <frameworkAssembly assemblyName="System.Data" targetFramework="net45" />
      <frameworkAssembly assemblyName="System.Xml" targetFramework="net45" />
    </frameworkAssemblies>
  </metadata>
```
