using SunScopeBOL.Entities;
using SunScopeDAL.Mapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeDAL.DataAccess
{
    public class AccountRepository : BaseRepository
    {
        public List<Customer> CheckCustomerLogin(Login lgn)
        {
            CustomerMapper CustMap = new CustomerMapper();
            SqlParameter[] parameters = {
                new SqlParameter("@LoginID",lgn.LoginID),
                new SqlParameter("@Password",lgn.Password),
                new SqlParameter("@Type","A")
                                       };
            IDataReader reader = base.GetReader("Usp_Manage_Accounts", parameters);
            using (reader)
            {
                return CustMap.Map(reader);
            }
        }
    }
}
