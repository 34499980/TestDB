using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic;
using Interfaz;

namespace TestDB
{
    class Program
    {
        static string tipo;
        //static  Logger log = new Logger();
        static void Main(string[] args)
        {
           
         
            IBusiness business = new BusinessLogic.BusinessLogic();
            try
            {
                Console.ForegroundColor = ConsoleColor.Green;        
                Console.WriteLine("*****************************************");
                Console.WriteLine("*         Ejecucion de scripts          *");
                Console.WriteLine("*****************************************");
                Console.WriteLine("");
                Console.WriteLine("Desea ejecutar archivos UP(u) o DOWN (d)?");
                tipo = Console.ReadLine();
                if (tipo.Equals("u"))
                {
                    Console.WriteLine("Inicio de archivos UP");
                    business.EjecutarFilesUp();
                }
                else
                {
                    Console.WriteLine("Inicio de archivos DOWN");
                    business.EjecutarFilesDown("d", null);
                }
                Console.Read();
            }
            catch (Exception ex)
            {
              //  log.LogError("Main Down automatico", ex.Message, ex);
                Console.ForegroundColor = ConsoleColor.Red;
                Console.Write(ex.Message + " En el archivo " + BusinessLogic.BusinessLogic.nombreScript);
                Console.WriteLine("");
                if (tipo.Equals("u"))
                {
                    Console.WriteLine("¿Desea ejecutar un restore? Ingrese Si(s),No(n)");
                    string respuesta = Console.ReadLine();
                    while (!respuesta.Equals("n") && !respuesta.Equals("s"))
                    {
                        respuesta = Console.ReadLine();
                    }
                    Console.ForegroundColor = ConsoleColor.Green;
                    if (respuesta.Equals("s"))
                    {
                        try
                        {
                            Console.WriteLine("Inicio de proceso DOWN");
                            business.EjecutarFilesDown("d", BusinessLogic.BusinessLogic.nombreScript);
                        }
                        catch (Exception ex2)
                        {
                            //log.LogError("Main Down", ex.Message, ex);
                            Console.WriteLine(ex2.Message);
                        }

                    }
                   
                }
            }
            Console.Read();

        }

      
       
    }
}
