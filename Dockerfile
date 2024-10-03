# Usar la imagen base de ASP.NET
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

# Usar la imagen base del SDK de .NET
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["WebAPI.csproj", "./"]  # Cambia "TuProyecto.csproj" por el nombre de tu proyecto
RUN dotnet restore "./WebAPI.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "WebAPI.csproj" -c Release -o /app/build

# Publicar la aplicación
FROM build AS publish
RUN dotnet publish "WebAPI.csproj" -c Release -o /app/publish

# Definir la imagen final
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebAPI.dll"]  # Cambia "TuProyecto.dll" por el nombre de tu proyecto
