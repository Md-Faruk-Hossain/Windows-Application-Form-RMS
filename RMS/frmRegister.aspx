<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegister.aspx.cs" Inherits="RMS.frmRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">       
        <div class= "col">
            <h4>Please register here.................</h4>
            <asp:Panel ID="Panel1" runat="server" Visible="false" CssClass="alert alert-warning">
                <h5>Registration Failed!!!</h5>
                <p>Failed to register user!!</p>
            </asp:Panel>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Username</label>
                <asp:TextBox ID="userName" runat="server"  CssClass="form-control col-6 " ></asp:TextBox>
            </div>
             <div class="form-group row">
                <label class="col-form-label col-2 text-right">Password</label>
                <asp:TextBox ID="password" runat="server"  CssClass="form-control col-6 " ></asp:TextBox>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Confirm-Password</label>
                <asp:TextBox ID="confirmPassword" runat="server"  CssClass="form-control col-6 " ></asp:TextBox>
            </div>
              <div class="form-group row">
               <div class="offset-2"> 
                   <asp:Button ID="register" runat="server" Text="Register"  CssClass="btn btn-primary" OnClick="register_Click" Width="572px" />
               </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
