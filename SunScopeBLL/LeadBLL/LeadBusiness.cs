using SunScopeBOL.Entities;
using SunScopeCommon.MailUtility;
using SunScopeDAL.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBLL.LeadBLL
{
    public class LeadBusiness
    {
        private LeadRepository Repo = new LeadRepository();
        private CustomerRepository custRepo = new CustomerRepository();
        public Boolean SubmitEnquiry(Enquiry enq, out string outMSG)
        {
            var flag = false;
            if (custRepo.GetCustomerByEmail(enq.Email).Count < 1)
            {
                Customer cust = new Customer() { Email = enq.Email, Password = enq.Mobile };
                flag = custRepo.AddCustomer(cust, out outMSG);
                if (flag)
                {
                    flag = Repo.AddNewEnquiry(enq, out outMSG);
                    if (flag)
                    {
                        EmailTemplate mailTemp = new EmailTemplate();
                        mailTemp.Mail_Content = "We have recorded your enquiry, and you can login to your account with <br> <b> Username: "
                            + cust.Email + " Password: " + cust.Mobile + "</b>";
                        mailTemp.Mail_To.Add(enq.Email);
                        mailTemp.Mail_Subject = "Enquiry Submitted";
                        SMTPEmail.sendMail(mailTemp);
                    }
                }
            }
            else
            {
                flag = Repo.AddNewEnquiry(enq, out outMSG);
                if (flag)
                {
                    EmailTemplate mailTemp = new EmailTemplate();
                    mailTemp.Mail_Content = "We have recorded your enquiry";
                    mailTemp.Mail_To.Add(enq.Email);
                    mailTemp.Mail_Subject = "Enquiry Submitted";
                    SMTPEmail.sendMail(mailTemp);
                }
            }
            return flag;
        }
    }
}
