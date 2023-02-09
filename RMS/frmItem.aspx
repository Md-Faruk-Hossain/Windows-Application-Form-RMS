<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmItem.aspx.cs" Inherits="RMS.frmItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row d-flex justify-content-center">
        <div class="col-md-12">
             <h2 class="text-center">Food Item</h2>
             <div class="d-flex justify-content-end">
                <a href="frmItemView.aspx" class="btn btn-outline-success">Food Item List</a>
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" ForeColor="Red" runat="server" />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ItemId" DataSourceID="SqlDataSourceItem" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                    <asp:TemplateField HeaderText="CatagoryId" SortExpression="CatagoryId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CatagoryId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceIt" DataTextField="Name" DataValueField="CatagoryId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceIt" runat="server" ConnectionString="<%$ ConnectionStrings:rmDBConnectionStringItem %>" DeleteCommand="DELETE FROM [foodMenu] WHERE [CatagoryId] = @CatagoryId" InsertCommand="INSERT INTO [foodMenu] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [foodMenu]" UpdateCommand="UPDATE [foodMenu] SET [Name] = @Name WHERE [CatagoryId] = @CatagoryId">
                                <DeleteParameters>
                                    <asp:Parameter Name="CatagoryId" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Name" Type="String" />
                                    <asp:Parameter Name="CatagoryId" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CatagoryId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ControlToValidate="TextBox2" ValidationExpression="^[a-zA-Z]{3,8}$"  ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox2" ForeColor="Red" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemDate" SortExpression="ItemDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ItemDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ItemDate") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ForeColor="Red" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ForeColor="Red" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="strock" SortExpression="strock">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("strock") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("strock") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("strock") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
             </asp:DetailsView>    
             <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" ConnectionString="<%$ ConnectionStrings:rmDBConnectionStringItem %>" DeleteCommand="DELETE FROM [fooditem] WHERE [ItemId] = @ItemId" InsertCommand="INSERT INTO [fooditem] ([CatagoryId], [ItemName], [ItemDate], [UnitPrice], [strock]) VALUES (@CatagoryId, @ItemName, @ItemDate, @UnitPrice, @strock)" SelectCommand="SELECT * FROM [fooditem]" UpdateCommand="UPDATE [fooditem] SET [CatagoryId] = @CatagoryId, [ItemName] = @ItemName, [ItemDate] = @ItemDate, [UnitPrice] = @UnitPrice, [strock] = @strock WHERE [ItemId] = @ItemId">
                 <DeleteParameters>
                     <asp:Parameter Name="ItemId" Type="Int32" />
                 </DeleteParameters>
                 <InsertParameters>
                     <asp:Parameter Name="CatagoryId" Type="Int32" />
                     <asp:Parameter Name="ItemName" Type="String" />
                     <asp:Parameter DbType="Date" Name="ItemDate" />
                     <asp:Parameter Name="UnitPrice" Type="Decimal" />
                     <asp:Parameter Name="strock" Type="Boolean" />
                 </InsertParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="CatagoryId" Type="Int32" />
                     <asp:Parameter Name="ItemName" Type="String" />
                     <asp:Parameter DbType="Date" Name="ItemDate" />
                     <asp:Parameter Name="UnitPrice" Type="Decimal" />
                     <asp:Parameter Name="strock" Type="Boolean" />
                     <asp:Parameter Name="ItemId" Type="Int32" />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
    </div>
     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
