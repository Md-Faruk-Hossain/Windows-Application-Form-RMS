<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmItemView.aspx.cs" Inherits="RMS.frmItemView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row d-flex justify-content-center">
        <div class="col-md-9">
             <h2>Food Item List</h2>
                      
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="ItemId" DataSourceID="SqlDataSourceList" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="ItemId" HeaderText="ItemId" InsertVisible="False" ReadOnly="True" SortExpression="ItemId" />
                    <asp:TemplateField HeaderText="CatagoryId" SortExpression="CatagoryId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceVew" DataTextField="Name" DataValueField="CatagoryId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceVew" runat="server" ConnectionString="<%$ ConnectionStrings:rmDBConnectionStringItem %>" DeleteCommand="DELETE FROM [foodMenu] WHERE [CatagoryId] = @CatagoryId" InsertCommand="INSERT INTO [foodMenu] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [foodMenu]" UpdateCommand="UPDATE [foodMenu] SET [Name] = @Name WHERE [CatagoryId] = @CatagoryId">
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
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CatagoryId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ItemDate" SortExpression="ItemDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ItemDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("UnitPrice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="strock" SortExpression="strock">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("strock") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("strock") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSourceList" runat="server" ConnectionString="<%$ ConnectionStrings:rmDBConnectionStringItem %>" DeleteCommand="DELETE FROM [fooditem] WHERE [ItemId] = @ItemId" InsertCommand="INSERT INTO [fooditem] ([CatagoryId], [ItemName], [ItemDate], [UnitPrice], [strock]) VALUES (@CatagoryId, @ItemName, @ItemDate, @UnitPrice, @strock)" SelectCommand="SELECT * FROM [fooditem]" UpdateCommand="UPDATE [fooditem] SET [CatagoryId] = @CatagoryId, [ItemName] = @ItemName, [ItemDate] = @ItemDate, [UnitPrice] = @UnitPrice, [strock] = @strock WHERE [ItemId] = @ItemId">
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
