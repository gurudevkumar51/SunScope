using SunScopeBLL.AccountBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunScopeRFQ.CustomerContent
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SunScopeBOL.Entities.Login lgn = new SunScopeBOL.Entities.Login()
            {
                LoginID = TbLoginEmail.Value.Trim(),
                Password = TbPassword.Value.Trim(),
                RememberMe = ChkBxRemember.Checked
            };
            AccountBusiness Db = new AccountBusiness();

            var usr = Db.CustomerLogin(lgn);

            if (usr != null)
            {
                // initialize FormsAuthentication
                FormsAuthentication.Initialize();

                // create a new ticket used for authentication
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(1, usr.Name, DateTime.Now, DateTime.Now.AddMinutes(15), false, "Customer");

                // encrypt the cookie using the machine key for secure transport
                string encTicket = FormsAuthentication.Encrypt(authTicket);

                // create and add the cookies to the list for outgoing response
                HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);

                Response.Cookies.Add(faCookie);
                Response.Redirect("~/CustomerContent/Home.aspx");
            }
        }
    }
}