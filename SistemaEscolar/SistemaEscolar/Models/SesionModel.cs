// SesionModel.cs
using SistemaEscolar.Model;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SistemaEscolar.Model
{
    public class SesionModel : Conexion
    {
        private int nivel;
        private String nombre;

        public int Nivel { get => nivel; set => nivel = value; }
        public string Nombre { get => nombre; set => nombre = value; }

        public SesionModel()
        {

        }

        public SesionModel(int nivel, String nombre)
        {
            this.nivel = nivel;
            this.nombre = nombre;
        }

        ~SesionModel()
        {
            Console.WriteLine("Out..");
        }

        public class ModelPrueba
        {
            public int idProfesor { get; set; }
            public string nombreProfesor { get; set; }    
            public Byte[] fotoPerfilProfesor { get; set;}

            public int sesionNivel {  get; set; }
        }

        public int IniciarSesion(String user, String password)
        {
            int idProfesor = 0;

            try
            {
                SqlDataReader dr1 = null;
                SqlCommand comando = new SqlCommand();
                comando.Connection = this.Conectar();
                comando.CommandText = "ps_mostrar_nivel_usuario";
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@usuario", user);
                comando.Parameters.AddWithValue("@contra", password);
                dr1 = comando.ExecuteReader();

                while (dr1.Read())
                {
                    idProfesor = int.Parse(dr1["id_Nivel"].ToString());
                }

                if (dr1 != null)
                {
                    Console.WriteLine("Usuario encontrado");
                }

                this.Desconectar();
                dr1.Close();
                return idProfesor;
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error al iniciar sesión " + e.Message);
            }

            return idProfesor;
        }

        public String ExtraerNombre(String user, String password)
        {
            String nombreProfesor = String.Empty;
            try
            {

                SqlDataReader dr1 = null;
                SqlCommand comando = new SqlCommand();
                comando.Connection = this.Conectar();
                comando.CommandText = "ps_mostrar_nombre_profesor";
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@usuario", user);
                comando.Parameters.AddWithValue("@contra", password);
                dr1 = comando.ExecuteReader();

                while (dr1.Read())
                {
                    nombreProfesor = dr1["nombreProfesor"].ToString().Trim() + " " + dr1["apellidoProfesor"].ToString().Trim();
                }
                if (dr1 != null)
                {
                    Console.WriteLine("Datos encontrados");
                }
                this.Desconectar();
                dr1.Close();
                return nombreProfesor;
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error al inicar sesión " + e.Message);
            }
            return nombreProfesor;
        }

        public int ExtraerID(String user, String password)
        {
            int id_Profesor = 0;

            try
            {
                SqlDataReader dr1 = null;
                SqlCommand comando = new SqlCommand();
                comando.Connection = this.Conectar();
                comando.CommandText = "ps_mostrar_id_profesor";
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@usuario", user);
                comando.Parameters.AddWithValue("@contra", password);
                dr1 = comando.ExecuteReader();

                while (dr1.Read())
                {
                    id_Profesor = int.Parse(dr1["id_Profesor"].ToString());
                }
                if (dr1 != null)
                {
                    Console.WriteLine("Datos encontrados");
                }
                this.Desconectar();
                dr1.Close();
                return id_Profesor;
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error al inicar sesión " + e.Message);
            }
            return id_Profesor;
        }

        public byte[] ExtraerFoto(String user, String password)
        {
            Byte[] data = new Byte[0];
            try
            {
                SqlDataReader dr1 = null;
                SqlCommand comando = new SqlCommand();
                comando.Connection = this.Conectar();
                comando.CommandText = "ps_mostrar_foto_profesor";
                comando.CommandType = CommandType.StoredProcedure;
                comando.Parameters.AddWithValue("@usuario", user);
                comando.Parameters.AddWithValue("@contra", password);
                dr1 = comando.ExecuteReader();

                if (dr1 != null)
                {
                    while (dr1.Read())
                    {
                        data = (Byte[])(dr1["fotoPerfilProfesor"]);
                    }
                    if (dr1 != null)
                    {
                        Console.WriteLine("Datos encontrados");
                    }
                }

                this.Desconectar();
                dr1.Close();
                return data;
            }
            catch (SqlException e)
            {
                Console.WriteLine("Error al extraer foto " + e.Message);
            }
            return data;
        }
    }
}
