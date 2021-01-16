FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 55419
EXPOSE 44398
FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY Host_In_Docker/mvc.csproj Host_In_Docker/
RUN dotnet restore Host_In_Docker/mvc.csproj
COPY . .
WORKDIR /src/Host_In_Docker
RUN dotnet build mvc.csproj -c Release -o /app
FROM build AS publish
RUN dotnet publish mvc.csproj -c Release -o /app
FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "mvc.dll"]