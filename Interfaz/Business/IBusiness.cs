using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaz
{
    public interface IBusiness
    {

          string[] GetUpFiles();

          string[] GetDownFiles();

          string[] OpenFile(string path);

          string ConvertToQuery(string[] query);

          void Ejecutar(string query);

          void EjecutarFilesUp();

          void EjecutarFilesDown(string tipo, string script);
    }
      
}
