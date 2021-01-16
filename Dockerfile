FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-evn
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ../
RUN dotnet publish -c Release -o out

FROM mrc.microsoft.com/dotnet/asp.net:3.1
WORKDIR /app
EXPOSE 80
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "mvc.dll"]