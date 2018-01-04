using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SunScopeBOL.Entities;
using SunScopeBLL.AccountBLL;
using System.Web.Security;

namespace SunScopeRFQ.AccountContent
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Login Button click
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SunScopeBOL.Entities.Login lgn = new SunScopeBOL.Entities.Login()
            {
                LoginID = TbLoginEmail.Value.Trim(),
                Password = TbPassword.Value.Trim(),
                RememberMe = ChkBxRemember.Checked
            };
            AccountBusiness Db = new AccountBusiness();
            if (Db.CustomerLogin(lgn) != null)
            {
                FormsAuthentication.RedirectFromLoginPage(lgn.LoginID, lgn.RememberMe);
                Response.Redirect("CustomerContent/Home.aspx");
            }
        }
    }
}