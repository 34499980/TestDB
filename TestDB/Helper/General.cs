﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestDB.Helper
{
   public class General
    {
       public static string GetDescriptionFromEnumValue(Enum value)
       {
           DescriptionAttribute attribute = value.GetType()
               .GetField(value.ToString())
               .GetCustomAttributes(typeof(DescriptionAttribute), false)
               .SingleOrDefault() as DescriptionAttribute;
           return attribute == null ? value.ToString() : attribute.Description;
       }
    }
}
