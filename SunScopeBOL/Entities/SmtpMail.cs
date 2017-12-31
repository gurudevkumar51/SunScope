using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeBOL.Entities
{
    public class SmtpMail
    {
        public SmtpMail()
        {
            this.Smtp_Host = ConfigurationManager.AppSettings["SmtpHost"].ToString();
            this.Smtp_username = ConfigurationManager.AppSettings["SmtpUsername"].ToString();
            this.Smtp_password = ConfigurationManager.AppSettings["SmtpPassword"].ToString();
            this.Smtp_Port = Convert.ToInt32(ConfigurationManager.AppSettings["SmtpPort"].ToString());
            this.Smtp_mailfrom = ConfigurationManager.AppSettings["SmtpMailfrom"].ToString();
        }
        public string Smtp_mailfrom { get; set; }
        public string Smtp_Host { get; set; }
        public string Smtp_username { get; set; }
        public string Smtp_password { get; set; }
        public int Smtp_Port { get; set; }
    }
}
