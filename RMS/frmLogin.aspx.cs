using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RMS
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var store = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(store);
            var user = manager.Find(this.userName.Text, this.password.Text);
            if (user != null)
            {
                var authManager = HttpContext.Current.GetOwinContext().Authentication; //install package microsoft.Owin.host
                authManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties(), manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie));
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                this.Panel1.Visible = true;
            }
        }
        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    var store = new UserStore<IdentityUser>();
        //    var manager = new UserManager<IdentityUser>(store);
        //    var user = manager.Find(this.userName.Text, this.password.Text);
        //    if (user != null)
        //    {
        //        var authManager = HttpContext.Current.GetOwinContext().Authentication; //install package microsoft.Owin.host
        //        authManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties(), manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie));
        //        Response.Redirect("~/Default.aspx");
        //    }
        //    else
        //    {
        //        this.Panel1.Visible = true;
        //    }
        //}
    }
}