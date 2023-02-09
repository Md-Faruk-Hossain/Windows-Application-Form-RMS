using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using RMS.Models;

namespace RMS.DAL
{
    public class foodMenuGetWay
    {
        SqlConnection connection = new SqlConnection(Connection.GetConnectinSting());

        public IQueryable<foodMenu> Get()
        {
            DataTable dataTable = new DataTable();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter("SELECT * FROM foodMenu", connection);
            sqlDataAdapter.Fill(dataTable);
            return dataTable.AsEnumerable()
                .Select(R => new foodMenu
                {
                    CatagoryId = R.Field<int>("CatagoryId"),
                    Name = R.Field<string>("Name")
                }).AsQueryable();

        }

        public void Insert(foodMenu f)
        {

            SqlCommand sqlCommand = new SqlCommand(@"INSERT INTO foodMenu VALUES(@n)", connection);
            sqlCommand.Parameters.AddWithValue("@n", f.Name);
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }

        public void Update(foodMenu f)
        {
            SqlCommand sqlCommand = new SqlCommand(@"UPDATE foodMenu SET Name=@n WHERE CatagoryId=@i", connection);
            sqlCommand.Parameters.AddWithValue("@i", f.CatagoryId);
            sqlCommand.Parameters.AddWithValue("@n", f.Name);
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }
        public void Delete(foodMenu f)
        {

            SqlCommand sqlCommand = new SqlCommand(@"DELETE FROM foodMenu WHERE CatagoryId=@i", connection);
            sqlCommand.Parameters.AddWithValue("@i", f.CatagoryId);

            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();
        }
    }
}
