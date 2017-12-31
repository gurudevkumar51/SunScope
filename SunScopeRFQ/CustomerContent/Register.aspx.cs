using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SunScopeBOL.Entities;
using SunScopeBLL.CustomerBLL;

namespace SunScopeRFQ.CustomerContent
{
    public partial class Register : System.Web.UI.Page
    {
        private CustomerBusiness db = new CustomerBusiness();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string msg = string.Empty;
            SunScopeBOL.Entities.Customer cust = new SunScopeBOL.Entities.Customer();
            cust.Name = TBName.Text.Trim();
            cust.Email = TBemail.Value.Trim();
            cust.Mobile = TBPhone.Value.Trim();
            cust.Location = TBLocation.Value.Trim();
            cust.Password = TBPwd.Value.Trim();
            if (TBCPwd.Value.Trim() == cust.Password)
            {
                var flag = db.AddCustomer(cust, out msg);                
                if (flag)
                {
                    string jsFunc = "formSubmitStatus('" + msg + "','success')";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", jsFunc, true);
                }
                else
                {
                    string jsFunc = "formSubmitStatus('" + msg + "','error')";                    
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", jsFunc, true);                    
                }
            }
            else
            {                
                string jsFunc = "formSubmitStatus('" + msg + "','error')";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", jsFunc, true);
            }
        }
    }
}