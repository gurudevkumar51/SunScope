using SunScopeBOL.Entities;
using SunScopeDAL.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBLL.AccountBLL
{
    public class AccountBusiness
    {
        private AccountRepository Repo = new AccountRepository();
        public Customer CustomerLogin(Login lgn)
        {
            var data = Repo.CheckCustomerLogin(lgn);
            if (data.Count > 0)
            {
                return data.FirstOrDefault();
            }
            return null;
        }
    }
}
