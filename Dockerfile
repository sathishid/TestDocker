FROM microsoft/dotnet-framework:4.6.2
SHELL ["powershell"]
WORKDIR /msbuild
COPY . .

# Note: Get MSBuild 12.
RUN Invoke-WebRequest "https://download.microsoft.com/download/9/B/B/9BB1309E-1A8F-4A47-A6C5-ECF76672A3B3/BuildTools_Full.exe" -OutFile "$env:TEMP\BuildTools_Full.exe" -UseBasicParsing  
RUN &  "$env:TEMP\BuildTools_Full.exe" /Silent /Full  
# Todo: delete the BuildTools_Full.exe file in this layer


RUN SET "PATH=%PATH%;C:/'Program Files (x86)'/MSBuild/12.0/Bin/
RUN C:/'Program Files (x86)'/MSBuild/12.0/Bin/msbuild.exe Demo.sln /t:Rebuild /p:Configuration=Release







