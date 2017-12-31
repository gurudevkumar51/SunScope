using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunScopeBOL.Entities;
using System.Data;

namespace SunScopeDAL.Mapper
{
   public class CustomerMapper
    {
        public List<Customer> Map(IDataReader reader)
        {
            List<Customer> custs = new List<Customer>();
            while (reader.Read())
            {
                Customer cust = new Customer();
                cust.CustomerID = reader["CustomerID"] == DBNull.Value ? 0 : Convert.ToInt32(reader["CustomerID"].ToString());
                cust.Name = reader["CustomerName"] == DBNull.Value ? "" : reader["CustomerName"].ToString();
                cust.Email = reader["CustomerEmail"] == DBNull.Value ? "" : reader["CustomerEmail"].ToString();
                cust.Mobile = reader["CustomerPhone"] == DBNull.Value ? "" : reader["CustomerPhone"].ToString();
                cust.Location = reader["CustomerLocation"] == DBNull.Value ? "" : reader["CustomerLocation"].ToString();
                cust.Password = reader["CustomerPassword"] == DBNull.Value ? "" : reader["CustomerPassword"].ToString();
                custs.Add(cust);
            }
            return custs;
        }
    }
}
