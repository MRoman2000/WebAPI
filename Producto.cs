﻿namespace WebAPI
{
    public class Producto
    {
        public int Id { get; set; }
        public string? Nombre { get; set; }
        public string? Descripcion { get; set; }
        public int? Stock { get; set; }
        public byte[]? Imagen { get; set; }
    }
}
