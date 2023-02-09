using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RMS.DAL
{
    public class Connection
    {
        public static string GetConnectinSting()
        {
            string constring = @"Data Source=.;Initial Catalog=rmDB;Integrated Security=True";
            return constring;
        }
    }
}