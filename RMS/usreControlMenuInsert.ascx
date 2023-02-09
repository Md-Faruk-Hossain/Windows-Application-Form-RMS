<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="usreControlMenuInsert.ascx.cs" Inherits="RMS.usreControlMenuInsert" %>
<div class="row d-flex justify-content-center">
        <div class="col-md-9">
            <h2>Food Menu Add</h2>
            <div class="d-flex justify-content-end">
                <a href="frmMenuView.aspx" class="btn btn-outline-success">Food Menu List</a>
            </div>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSourceMenu" DefaultMode="Insert" Width="942px" BackColor="White" BorderColor="#336666" BorderWidth="3px" CellPadding="4" Height="71px" BorderStyle="Double" GridLines="Horizontal">
                <EditItemTemplate>
                  <%--  CatagoryId:
                    <asp:TextBox ID="CatagoryIdTextBox" runat="server" Text='<%# Bind("CatagoryId") %>' />
                    <br />--%>
                    Name:
                    <asp:TextBox ID="NameTextBox"  CssClass="form-control col-6 " runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" CssClass="d-lg-flex bg-success" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    <%--CatagoryId:
                    <asp:TextBox ID="CatagoryIdTextBox" runat="server" Text='<%# Bind("CatagoryId") %>' />
                    <br />--%>
                   
                   Name: <asp:TextBox ID="txtName" CssClass="form-control"  BackColor="White" runat="server" Text='<%# Bind("Name") %>' />

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtName" runat="server" ErrorMessage="Name is Required!!!" ></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only Text Formate!!!" ControlToValidate="txtName" ForeColor="OrangeRed" ValidationExpression="^[a-zA-Z]{3,8}$"  ></asp:RegularExpressionValidator>
                    <br />
                    <asp:LinkButton ID="InsertButton"  BorderStyle="Groove" CssClass="btn btn-outline-success text-white"  runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" BorderStyle="Groove" CssClass="btn btn-outline-success text-white"     runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                  <%--  CatagoryId:
                    <asp:Label ID="CatagoryIdLabel" runat="server" Text='<%# Bind("CatagoryId") %>' />
                    <br />--%>
                    Name:
                    <asp:Label ID="NameLabel"    runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSourceMenu" runat="server" DataObjectTypeName="RMS.Models.foodMenu" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Get" TypeName="RMS.DAL.foodMenuGetWay" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
    </div>