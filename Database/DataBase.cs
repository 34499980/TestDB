using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Interfaz;
//using TestDB.Log;

namespace Database
{
    public class DataBase: IDataBase
    {
        private static DataBase db = null;
        private static SqlConnection con = null;
        //Logger log = new Logger();

        public  void GetConnection()
        {
            if (con == null)
            {
                try
                {
                    con = new SqlConnection();
                    con.ConnectionString = Properties.Settings.Default.ConexionDB;

                }
                catch (Exception ex)
                {
                    //log.LogError("GetConnection", ex.Message, ex);
                    throw ex;
                }

            }

        }
        public  void Ejecutar(string query)
        {
            if (con == null)
            {
                GetConnection();
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            con.Open();
            SqlTransaction transaction = con.BeginTransaction();
            cmd.Transaction = transaction;
            try
            {



                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;

                cmd.ExecuteNonQuery();
                transaction.Commit();

                con.Close();
            }
            catch (Exception ex)
            {
                //log.LogError("Ejecutar", ex.Message, ex);
                transaction.Rollback();
                
                con.Close();
                throw ex;

            }
        }
        public  string[] GetUpFiles()
        {
            try
            {
                var file = Directory.GetFiles(Properties.Settings.Default.ScriptsUp);
                return file;
            }
            catch (Exception ex)
            {
                //log.LogError("GetUpFiles", ex.Message, ex);
                throw ex;
            }
        }
        public  string[] GetDownFiles()
        {
            try
            {

                var file = Directory.GetFiles(Properties.Settings.Default.ScriptsDown);
                return file;
            }
            catch (Exception ex)
            {
                //log.LogError("GetDownFiles", ex.Message, ex);
                throw ex;
            }
        }
        public  string[] OpenFile(string path)
        {
            try
            {
                var file = System.IO.File.ReadAllLines(path);
                return file;
            }
            catch (Exception ex)
            {
                //log.LogError("OpenFile", ex.Message, ex);
                throw ex;
            }
        }
    }
}
