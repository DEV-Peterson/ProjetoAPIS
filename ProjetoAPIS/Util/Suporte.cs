using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace ProjetoAPIS.Util
{
    public class Suporte
    {
        public void sendEmail(string Assunto, string emailDestiny, string bodyMail)
        {
            MailMessage objMail = new MailMessage();
            objMail.To.Add(emailDestiny);
            objMail.From = new MailAddress("peter14347550@gmail.com");
            objMail.Body = bodyMail;
            objMail.Subject = Assunto;

            SmtpClient objSMTP = new SmtpClient();
            objSMTP.Host = "smtp.gmail.com";
            objSMTP.Port = 587;
            objSMTP.UseDefaultCredentials = false;
            objSMTP.Credentials = new NetworkCredential("teste@gmail.com", "Teste11");
            objSMTP.EnableSsl = true;
            objSMTP.Send(objMail);

        }
    }
}