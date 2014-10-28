using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Application.Data;
using Application.Models.Enumerations;
using Application.Site.Utilities;
using System.IO;
using ErrorHandlerControl;

namespace Application.Site.Account
{
    public partial class Manage : System.Web.UI.Page
    {
        private DataProvider data;

        protected string SuccessMessage
        {
            get;
            private set;
        }

        protected bool CanRemoveExternalLogins
        {
            get;
            private set;
        }

        private bool HasPassword(ApplicationUserManager manager)
        {
            return manager.HasPassword(User.Identity.GetUserId());
        }

        protected void Page_Load()
        {
            this.data = new DataProvider();

            if (!IsPostBack)
            {
                this.Country.DataSource = data.Countries.All().ToList();
                this.Country.SelectedIndex = 0;
                this.Town.DataSource = data.Countries.All().ToList()[0].Towns.ToList();
                BindUtil.EnumToList<RelationshipStatus>(this.Status);
                this.DataBind();

                // Determine the sections to render
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                if (HasPassword(manager))
                {
                    changePasswordHolder.Visible = true;
                }
                else
                {
                    setPassword.Visible = true;
                    changePasswordHolder.Visible = false;
                }

                CanRemoveExternalLogins = manager.GetLogins(User.Identity.GetUserId()).Count() > 1;

                // Render success message
                var message = Request.QueryString["m"];

                if (message != null)
                {
                    // Strip the query string from action
                    Form.Action = ResolveUrl("~/Account/Manage");

                    SuccessMessage =
                        message == "ChangePwdSuccess" ? "Your password has been changed."
                        : message == "SetPwdSuccess" ? "Your password has been set."
                        : message == "RemoveLoginSuccess" ? "The account was removed."
                        : String.Empty;
                    successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
                }

                // User Info Form Populate
                var currentUser = manager.FindById(User.Identity.GetUserId());

                this.FirstName.Text = currentUser.FirstName;
                this.LastName.Text = currentUser.LastName;

                if(currentUser.Town != null){
                    this.Country.SelectedValue = currentUser.Town != null ? currentUser.Town.Country.Id.ToString() : "";

                    this.Town.DataSource = data.Countries.Find(currentUser.Town.Country.Id).Towns.ToList();
                    this.Town.DataBind();
                    this.Town.SelectedValue = currentUser.Town.Id.ToString();
                }

                this.Address.Text = currentUser.Address;
                this.Phone.Text = currentUser.Phone;
                this.Status.SelectedValue = ((int)currentUser.RelationshipStatus).ToString();
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                IdentityResult result = manager.ChangePassword(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text);
                if (result.Succeeded)
                {
                    var user = manager.FindById(User.Identity.GetUserId());
                    IdentityHelper.SignIn(manager, user, isPersistent: false);
                    Response.Redirect("~/Account/Manage?m=ChangePwdSuccess");
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        protected void ChangeInfo_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var user = data.Users.Find(User.Identity.GetUserId());
                user.FirstName = this.FirstName.Text;
                user.LastName = this.LastName.Text;
                user.Town = data.Towns.Find(int.Parse(this.Town.SelectedValue));
                user.Phone = this.Phone.Text;
                user.Address = this.Address.Text;
                user.RelationshipStatus = (RelationshipStatus)int.Parse(this.Status.SelectedValue);

                if (this.Photo.HasFile)
                {
                    string filename = Path.GetFileName(this.Photo.FileName);
                    this.Photo.SaveAs(Server.MapPath("~/Content/userImages/") + filename);
                    user.Photo = filename;
                }

                try
                {
                    this.data.SaveChanges();
                    ErrorSuccessNotifier.AddSuccessMessage("Profile Edited Successfully");
                    ErrorSuccessNotifier.ShowAfterRedirect = true;
                    Response.Redirect("Profile.aspx", false);
                }
                catch (Exception ex)
                {
                    ErrorSuccessNotifier.AddErrorMessage(ex);
                }
            }
        }

        protected void SetPassword_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Create the local login info and link the local account to the user
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                IdentityResult result = manager.AddPassword(User.Identity.GetUserId(), password.Text);
                if (result.Succeeded)
                {
                    Response.Redirect("~/Account/Manage?m=SetPwdSuccess");
                }
                else
                {
                    AddErrors(result);
                }
            }
        }

        public IEnumerable<UserLoginInfo> GetLogins()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var accounts = manager.GetLogins(User.Identity.GetUserId());
            CanRemoveExternalLogins = accounts.Count() > 1 || HasPassword(manager);
            return accounts;
        }

        public void RemoveLogin(string loginProvider, string providerKey)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var result = manager.RemoveLogin(User.Identity.GetUserId(), new UserLoginInfo(loginProvider, providerKey));
            string msg = String.Empty;
            if (result.Succeeded)
            {
                var user = manager.FindById(User.Identity.GetUserId());
                IdentityHelper.SignIn(manager, user, isPersistent: false);
                msg = "?m=RemoveLoginSuccess";
            }
            Response.Redirect("~/Account/Manage" + msg);
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        protected void Country_Change(object sender, EventArgs e)
        {
            var selectedIdem = int.Parse(this.Country.SelectedValue);
            this.Town.DataSource = data.Towns.All().Where(x => x.Country.Id == selectedIdem).ToList();
            this.Town.DataBind();
        }
    }
}