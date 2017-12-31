using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunScopeBOL.Entities;
using System.Data.SqlClient;
using SunScopeDAL.Mapper;
using System.Data;

namespace SunScopeDAL.DataAccess
{
    public class CustomerRepository : BaseRepository
    {
        public Boolean AddCustomer(Customer cust, out string msg)
        {
            msg = "";
            try
            {
                SqlParameter[] parameters =
                {
                        new SqlParameter("@custName",cust.Name),
                        new SqlParameter("@custEmail",cust.Email),
                        new SqlParameter("@custLocation",cust.Location),
                        new SqlParameter("@custMobile",cust.Mobile),
                        new SqlParameter("@custPwd",cust.Password),
                        new SqlParameter("@Type","B")
                    };
                var flag = base.ExecuteNonQuery("Usp_Manage_Customer", parameters);
                msg = flag > 0 ? "Customer added successfully" : "Server Problem try again later";
                return flag > 0 ? true : false;
            }
            catch (Exception ex)
            {
                msg = "Unable to add your account" + ex.Message;
                return false;
            }
        }

        public List<Customer> GetCustomerByEmail(string Email)
        {
            CustomerMapper CustMap = new CustomerMapper();
            SqlParameter[] parameters = {
                new SqlParameter("@custEmail",Email),
                new SqlParameter("@Type","C")
                                       };
            IDataReader reader = base.GetReader("Usp_Manage_Customer", parameters);
            using (reader)
            {
                return CustMap.Map(reader);
            }
        }

        public List<Customer> GetAllCustomer()
        {
            CustomerMapper CustMap = new CustomerMapper();
            SqlParameter[] parameters = {
                                           new SqlParameter("@Type","A")
                                       };
            IDataReader reader = base.GetReader("Usp_Manage_Customer", parameters);
            using (reader)
            {
                return CustMap.Map(reader);
            }
        }
    }
}
