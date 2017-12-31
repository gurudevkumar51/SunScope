using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SunScopeDAL.DataAccess;
using SunScopeBOL.Entities;
using SunScopeCommon.MailUtility;

namespace SunScopeBLL.CustomerBLL
{
    public class CustomerBusiness
    {
        private CustomerRepository Repo = new CustomerRepository();
        public Boolean AddCustomer(Customer custom, out string outMSG)
        {
            if (Repo.GetCustomerByEmail(custom.Email).Count > 0)
            {
                outMSG = "This email is already registered";
                return false;
            }
            else
            {
                custom.Name = string.IsNullOrEmpty(custom.Name) ? "Guest" : custom.Name;
                var flag= Repo.AddCustomer(custom, out outMSG);
                if (flag)
                {
                    EmailTemplate mailTemp = new EmailTemplate();
                    mailTemp.Mail_Content = "Successfully registered with us";
                    mailTemp.Mail_To.Add(custom.Email);
                    mailTemp.Mail_Subject = "Welocme to Sun scope";
                    SMTPEmail.sendMail(mailTemp);
                }
                return flag;
            }
        }
    }
}
