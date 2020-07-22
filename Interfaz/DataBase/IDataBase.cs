using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaz
{
    public interface IDataBase
    {
          void GetConnection();
      
          void Ejecutar(string query);
       
          string[] GetUpFiles();
       
          string[] GetDownFiles();

          string[] OpenFile(string path);
       
    }
}
