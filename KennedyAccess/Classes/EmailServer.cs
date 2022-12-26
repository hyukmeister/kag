using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;

namespace KennedyAccess
{
    public class EmailServer
    {
        static private string _emailServer = Global.sEmailServer;
        static private string _emailUserName = Global.sEmailUserName;
        static private string _emailPassword = Global.sEmailPassword;
        static private int _emailPort = Global.iEmailPort;

        private string _toemail;
        private string _subject;
        private string _body;

        public string Server
        {
            get { return _emailServer; }
            set { _emailServer = value; }
        }
        public string EmailUserName
        {
            get { return _emailUserName; }
            set { _emailUserName = value; }
        }
        public string EmailPassword
        {
            get { return _emailPassword; }
            set { _emailPassword = value; }
        }
        public int EmailPort
        {
            get { return _emailPort; }
            set { _emailPort = value; }
        }

        public string ToEmail
        {
            get { return _toemail; }
            set { _toemail = value; }
        }
        public string Subject
        {
            get { return _subject; }
            set { _subject = value; }
        }
        public string Body
        {
            get { return _body; }
            set { _body = value; }
        }

        public void SendEmail()
        {
            MailMessage email = new MailMessage();
            email.From = new MailAddress(_emailUserName);
            email.To.Add(_toemail);
            email.Subject = _subject;
            email.Body = _body;
            email.IsBodyHtml = true;

            SmtpClient sC = new SmtpClient(_emailServer);
            sC.UseDefaultCredentials = false;

            ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
            { return true; };

            sC.DeliveryMethod = SmtpDeliveryMethod.Network;
            sC.Port = _emailPort;
            sC.Credentials = new NetworkCredential(_emailUserName, _emailPassword);
            sC.EnableSsl = true;
            sC.Send(email);
        }
    }
}