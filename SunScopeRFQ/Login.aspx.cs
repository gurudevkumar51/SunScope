using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SunScopeRFQ
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            char[] character = { '/' };
            var returnUrl = Request["ReturnUrl"];

            if (returnUrl != null)
            {
                string[] strs = returnUrl.Split(character);
                
                // if the second part is Admin go to admin login
                if (strs.Contains("AdminContent"))
                {
                    Response.Redirect(@"~/AdminContent/Login.aspx");
                }
                // if the second part is Customer go to customer login
                else if (strs.Contains("CustomerContent"))
                {
                    Response.Redirect(@"~/CustomerContent/Login.aspx");
                }
            }
        }
    }
}