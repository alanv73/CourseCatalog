<%@ Page Title="" Language="C#" MasterPageFile="~/CSMaster.Master" AutoEventWireup="true" CodeBehind="ProgramEdit.aspx.cs" Inherits="CourseSchedule.ProgramEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
    Add or Edit Programs
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-6 col-md-12 col-sm-12">
            <asp:SqlDataSource ID="sqlPrograms" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT * FROM [programs] ORDER BY [program]" 
                DeleteCommand="DELETE FROM [programs] WHERE [Id] = @Id" 
                InsertCommand="INSERT INTO [programs] ([code], [program]) VALUES (@code, @program)" 
                UpdateCommand="UPDATE [programs] SET [code] = @code, [program] = @program WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView CssClass="Grid chalk-grid" ID="gridPrograms" OnRowCommand="gridPrograms_RowCommand" runat="server" AllowPaging="True" PageSize="8" DataSourceID="sqlPrograms" AutoGenerateColumns="False" ShowHeader="False" DataKeyNames="Id" Width="341px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <div class="grid-button-div">
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?'); " CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                        <ControlStyle CssClass="selectbutton btn btn-outline-secondary btn-sm" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                    <asp:TemplateField HeaderText="program" SortExpression="program">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("program") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProgramEdit" ControlToValidate="TextBox1" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter a Program" ForeColor="Red"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemStyle CssClass="prog-lg" />
                        <ItemTemplate>
                            <div class="prog-div">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("program") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                        <ItemStyle CssClass="prog-lg" />
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pgr"></PagerStyle>
            </asp:GridView>
            <div class="div-button">
                <br />
                <asp:Button CssClass="btn btn-basic btn-new-program" ID="addNew" OnClick="addNew_Click" runat="server" Text="Add New Program" />
            </div>
        </div>
        <div class="col-lg-5 col-md-12 col-sm-12">
            <asp:SqlDataSource ID="sqlDVProgram" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True" DeleteCommand="DELETE FROM [programs] WHERE [Id] = @Id" InsertCommand="INSERT INTO [programs] ([code], [program]) VALUES (@code, @program)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [programs] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [programs] SET [code] = @code, [program] = @program WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gridPrograms" DefaultValue="-1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="program" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="dv-program clearfix">
                <asp:DetailsView CssClass="Grid courseindex courseEditForm detailform chalk-dv" OnItemInserting="dvProgram_ItemInserting" OnItemUpdating="dvProgram_ItemUpdating" OnItemInserted="dvProgram_ItemInserted" ID="dvProgram" runat="server" Height="50px" Width="397px" DataSourceID="sqlDVProgram" AutoGenerateRows="False" DataKeyNames="Id">
                    <Fields>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:TemplateField HeaderText="Code" SortExpression="code">
                            <EditItemTemplate>
                                <asp:TextBox CssClass="form-tb prog-tb tb1" ID="TextBox1" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCodeEdit" ControlToValidate="TextBox1" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter the Program Code" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox CssClass="form-tb prog-tb tb1" ID="TextBox1" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCodeEdit" ControlToValidate="TextBox1" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter the Program Code" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label CssClass="prog-tb tb1" ID="Label1" runat="server" Text='<%# Bind("code") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="tb1" HeaderText="Program" SortExpression="program">
                            <EditItemTemplate>
                                <asp:TextBox CssClass="form-tb prog-tb tb2" ID="TextBox2" runat="server" Text='<%# Bind("program") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProgramEdit" ControlToValidate="TextBox2" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter the Program" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox CssClass="form-tb prog-tb tb1" ID="TextBox2" runat="server" Text='<%# Bind("program") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProgramEdit" ControlToValidate="TextBox2" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter the Program" ForeColor="Red"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label CssClass="prog-tb tb1" ID="Label2" runat="server" Text='<%# Bind("program") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowCancelButton="true" ShowDeleteButton="true" ShowInsertButton="true" ButtonType="Link" />
                    </Fields>
                </asp:DetailsView>
            </div>
        </div>
    </div>
</asp:Content>
