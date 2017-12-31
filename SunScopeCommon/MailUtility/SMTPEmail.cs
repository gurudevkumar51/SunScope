using SunScopeBOL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace SunScopeCommon.MailUtility
{
    public static class SMTPEmail
    {
        public static Boolean sendMail(EmailTemplate mailDetails)
        {
            try
            {
                SmtpMail smtpDetails = new SmtpMail();
                MailMessage mail = new MailMessage();

                foreach (var mailto in mailDetails.Mail_To)
                    mail.To.Add(mailto);

                foreach (var mailBcc in mailDetails.Mail_bcc)
                {
                    if (!String.IsNullOrEmpty(mailBcc))
                        mail.Bcc.Add(mailBcc);
                }
                foreach (var mailCc in mailDetails.Mail_Cc)
                {
                    if (!String.IsNullOrEmpty(mailCc))
                        mail.Bcc.Add(mailCc);
                }                               

                if (!String.IsNullOrEmpty(Convert.ToString(smtpDetails.Smtp_mailfrom)))
                    mail.From = new MailAddress(smtpDetails.Smtp_mailfrom);

                mail.Subject = mailDetails.Mail_Subject;
                string Body = mailDetails.Mail_Content;
                mail.Body = Body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                smtp.Host = smtpDetails.Smtp_Host;
                smtp.Port = smtpDetails.Smtp_Port;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential(smtpDetails.Smtp_username, smtpDetails.Smtp_password);
                smtp.EnableSsl = true;
                smtp.Send(mail);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
