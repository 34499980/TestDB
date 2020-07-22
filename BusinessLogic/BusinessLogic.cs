using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Interfaz;
using Database;
//using TestDB.Log;

namespace BusinessLogic
{
    public class BusinessLogic: IBusiness
    {
        public static string nombreScript;
        public static string[] files;
        IDataBase db = new DataBase();
        //Logger log = new Logger();

        public  string[] GetUpFiles()
        {
            try
            {
                return db.GetUpFiles();
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
                return db.GetDownFiles().Reverse().ToArray();
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
              return db.OpenFile(path);
            }
            catch (Exception ex)
            {
                //log.LogError("OpenFile", ex.Message, ex);
                throw ex;
            }
        }
        public  string ConvertToQuery(string[] query)
        {
            try
            {
                string result = "";
                foreach (var item in query)
                {
                    result += item + " ";
                }
                return result;
            }
            catch (Exception ex)
            {
                //log.LogError("ConvertToQuery", ex.Message, ex);
                throw ex;
            }
        }
        public  void Ejecutar(string query)
        {
            try
            {
                db.Ejecutar(query);
            }
            catch (Exception ex)
            {
                //log.LogError("Ejecutar", ex.Message, ex);
                throw ex;
            }
        }
        public  void  EjecutarFilesUp()
        {
            try
            {

                var files = GetUpFiles();
                foreach (var item in files)
                {
                    nombreScript = item.Substring(item.IndexOf("\\") + 1);
                    string[] queryLines = OpenFile(item);
                    string query = ConvertToQuery(queryLines);
                    Console.WriteLine(nombreScript);
                    //log.LogInformation(nombreScript, "UP");
                    Ejecutar(query);
                    
                    
                }
                
            }
            catch (Exception ex)
            {
                //log.LogError("EjecutarFilesUp", ex.Message, ex);
                throw ex;
            }
        }
        public  void EjecutarFilesDown(string tipo,string script)
        {
            bool bEjecutar = false;
            try
            {
                files = GetDownFiles();
                for (int i = 0; i < files.Length;i++)
                   // foreach (var item in files)
                    {
                        if (script == null)
                        {
                            if (bEjecutar || tipo.Equals("d"))
                            {
                                
                                string[] queryLines = OpenFile(files[i]);
                                int depencia = queryLines[0].IndexOf("Dependencia:");
                                if (depencia > 0)
                                {
                                    string scriptDependiente = queryLines[0].Substring(queryLines[0].IndexOf(":") + 1);
                                    EjecutarFilesDown(tipo, scriptDependiente);
                                }
                                nombreScript = files[i].Substring(files[i].IndexOf("\\") + 1);
                                string query = ConvertToQuery(queryLines);
                                Console.WriteLine(nombreScript);
                                //log.LogInformation(nombreScript, "DOWN");
                                Ejecutar(query);
                                

                            }

                            if (nombreScript.Equals(files[i].Substring(files[i].IndexOf("\\") + 1)))
                            {
                                bEjecutar = true;
                            }
                        }
                        else
                        {
                            int number = int.Parse(files[i].Substring(files[i].IndexOf("\\") + 1,2));
                            int errorScript = int.Parse(script.Substring(0, 2));
                            if (number < errorScript)
                            {
                                nombreScript = files[i].Substring(files[i].IndexOf("\\") + 1);
                                string[] queryLines = OpenFile(files[i]);
                                int depencia = queryLines[0].IndexOf("--Dependencia:");
                                if (depencia > 0)
                                {
                                    string scriptDependiente = queryLines[0].Substring(queryLines[0].IndexOf("--Dependencia:"));
                                    EjecutarFilesDown(tipo, scriptDependiente);
                                }
                                nombreScript = files[i].Substring(files[i].IndexOf("\\") + 1);
                                string query = ConvertToQuery(queryLines);
                                Console.WriteLine(nombreScript);
                                //log.LogInformation(nombreScript, "DOWN");
                                Ejecutar(query);
                               // files = files.Where(x => x != files[i]).ToArray();
                               // break;
                            }
                        }

                    }

            }
            catch (Exception ex)
            {
                //log.LogError("EjecutarFilesDown", ex.Message, ex);
                throw ex;
            }
        }
    }
}
