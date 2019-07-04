<%@ Page Title="" Language="C#" MasterPageFile="~/CSMaster.Master" AutoEventWireup="true" CodeBehind="CourseEdit.aspx.cs" Inherits="CourseSchedule.CourseEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Kalam|Lato&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ContentPlaceHolderID="H1ContentPlaceHolder" ID="Content4" runat="server">
    Course Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\CourseSchedule.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [courses] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [courses] WHERE [Id] = @Id" InsertCommand="INSERT INTO [courses] ([course_code], [course_title], [description], [credits], [clock_hours], [instructor_id]) VALUES (@course_code, @course_title, @description, @credits, @clock_hours, @instructor_id)" UpdateCommand="UPDATE [courses] SET [course_code] = @course_code, [course_title] = @course_title, [description] = @description, [credits] = @credits, [clock_hours] = @clock_hours, [instructor_id] = @instructor_id WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="course_code" Type="String" />
            <asp:Parameter Name="course_title" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="credits" Type="Decimal" />
            <asp:Parameter Name="clock_hours" Type="Int32" />
            <asp:Parameter Name="instructor_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-1" Name="Id" SessionField="SelectedCourse" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="course_code" Type="String" />
            <asp:Parameter Name="course_title" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="credits" Type="Decimal" />
            <asp:Parameter Name="clock_hours" Type="Int32" />
            <asp:Parameter Name="instructor_id" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="chalk">
        <asp:FormView CssClass="courseEditForm detailform" ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" RowStyle-CssClass="courseEditForm"
            OnItemInserted="FormView1_ItemInserted" OnItemUpdating="FormView1_ItemUpdating" OnItemInserting="FormView1_ItemInserting" OnItemDeleted="FormView1_ItemDeleted">
            <EditItemTemplate>
                <span class="ecdata">Course Code:</span>
                <asp:TextBox CssClass="form-tb" ID="ecourse_codeTextBox" TabIndex="1" runat="server" Text='<%# Bind("course_code") %>' />
                <asp:RequiredFieldValidator ID="rfvCodeEdit" ValidationGroup="rfvCourseData" Display="Dynamic" ControlToValidate="ecourse_codeTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter a Course Code" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Course Name:</span>
                <asp:TextBox CssClass="form-tb" ID="ecourse_titleTextBox" TabIndex="2" runat="server" Text='<%# Bind("course_title") %>' />
                <asp:RequiredFieldValidator ID="rfvCourseEdit" ValidationGroup="rfvCourseData" Display="Dynamic" ControlToValidate="ecourse_titleTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter a Course Title" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Description:</span>
                <asp:TextBox CssClass="form-desc" ID="edescriptionTextBox" TabIndex="3" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Rows="4" />
                <asp:RequiredFieldValidator ID="rfvDescriptionEdit" ValidationGroup="rfvCourseData" ControlToValidate="edescriptionTextBox" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Please Enter a Course Description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Credits:</span>
                <asp:TextBox CssClass="form-tb" ID="ecreditsTextBox" TabIndex="4" runat="server" Text='<%# Bind("credits", "{0:n1}") %>' />
                <asp:RequiredFieldValidator ID="rfvCreditsEdit" ValidationGroup="rfvCourseData" ControlToValidate="ecreditsTextBox" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Please Enter the Number of Credits" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvCreditInsert" ValidationGroup="rfvCourseData" Type="Double" SetFocusOnError="true" Display="Dynamic" ControlToValidate="ecreditsTextBox" MinimumValue="0" MaximumValue="15"  runat="server" ErrorMessage="Enter a Value between 0 and 15.0" ForeColor="Red" ></asp:RangeValidator><br />
                <span class="ecdata">Clock Hours:</span>
                <asp:TextBox CssClass="form-tb" ID="eclock_hoursTextBox" TabIndex="5" runat="server" Text='<%# Bind("clock_hours", "{0:n0}") %>' />
                <asp:RequiredFieldValidator ID="rfvClockHoursEdit" ValidationGroup="rfvCourseData" ControlToValidate="eclock_hoursTextBox" Display="Dynamic" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter the Number of Clock Hours" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvClockHoursEdit" SetFocusOnError="true" Type="Double" Display="Dynamic" ValidationGroup="rfvCourseData" ControlToValidate="eclock_hoursTextBox" MinimumValue="0" MaximumValue="500"  runat="server" ErrorMessage="Enter a Value between 0 and 500" ForeColor="Red" ></asp:RangeValidator><br />
                <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <span class="ecdata">Course Code:</span>
                <asp:TextBox CssClass="form-tb" ID="course_codeTextBox" TabIndex="1" runat="server" Text='<%# Bind("course_code") %>' />
                <asp:RequiredFieldValidator ID="rfvCodeInsert" ValidationGroup="rfvCourseData" Display="Dynamic" ControlToValidate="course_codeTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter a Course Code" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Course Title:</span>
                <asp:TextBox CssClass="form-tb" ID="course_titleTextBox" TabIndex="2" runat="server" Text='<%# Bind("course_title") %>' />
                <asp:RequiredFieldValidator ID="rfvCourseInsert" ValidationGroup="rfvCourseData" Display="Dynamic" ControlToValidate="course_titleTextBox" SetFocusOnError="true" runat="server" ErrorMessage="Please Enter a Course Title" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Description:</span>
                <asp:TextBox CssClass="form-desc" ID="descriptionTextBox" TabIndex="3" runat="server" Text='<%# Bind("description") %>' TextMode="MultiLine" Rows="4" />
                <asp:RequiredFieldValidator ID="rfvDescriptionInsert" ValidationGroup="rfvCourseData" ControlToValidate="descriptionTextBox" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Please Enter a Course Description" ForeColor="Red"></asp:RequiredFieldValidator><br />
                <span class="ecdata">Credits:</span>
                <asp:TextBox CssClass="form-tb" ID="creditsTextBox" TabIndex="4" runat="server" Text='<%# Bind("credits") %>' />
                <asp:RequiredFieldValidator ID="rfvCreditsInsert" ValidationGroup="rfvCourseData" ControlToValidate="creditsTextBox" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Please Enter the Number of Credits" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvCreditInsert" Type="Double" ControlToValidate="creditsTextBox" ValidationGroup="rfvCourseData" SetFocusOnError="true" Display="Dynamic" MinimumValue="0" MaximumValue="15.0"  runat="server" ErrorMessage="Enter a Value between 0 and 15.0" ForeColor="Red" ></asp:RangeValidator><br />
                <span class="ecdata">Clock Hours:</span>
                <asp:TextBox CssClass="form-tb" ID="clock_hoursTextBox" TabIndex="5" runat="server" Text='<%# Bind("clock_hours") %>' />
                <asp:RequiredFieldValidator ID="rfvClockHoursInsert" ValidationGroup="rfvCourseData" ControlToValidate="clock_hoursTextBox" SetFocusOnError="true" Display="Dynamic" runat="server" ErrorMessage="Please Enter the Number of Clock Hours" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="rvClockHoursInsert" Type="Double" ControlToValidate="clock_hoursTextBox" ValidationGroup="rfvCourseData" SetFocusOnError="true" Display="Dynamic" MinimumValue="0" MaximumValue="500"  runat="server" ErrorMessage="Enter a Value between 0 and 500" ForeColor="Red" ></asp:RangeValidator><br />
                <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="InsertCancelButton" OnClick="InsertCancelButton_Click" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Label CssClass="ccode" ID="course_codeLabel" runat="server" Text='<%# Bind("course_code") %>' /><br />
                <asp:Label CssClass="cname" ID="course_titleLabel" runat="server" Text='<%# Bind("course_title") %>' /><br />
                <asp:Label CssClass="cdata" ID="descriptionLabel" runat="server" Text='<%# Bind("description") %>' /><br />
                <span class="cdata">Credits:</span>
                <asp:Label CssClass="cdata" ID="creditsLabel" runat="server" Text='<%# Bind("credits", "{0:n1}") %>' /><br />
                <span class="cdata">Clock Hours:</span>
                <asp:Label CssClass="cdata" ID="clock_hoursLabel" runat="server" Text='<%# Bind("clock_hours", "{0:n0}") %>' /><br />
                <asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="DeleteButton" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete?'); " CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="InsertButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                &nbsp;<asp:LinkButton CssClass="btn btn-outline-secondary btn-sm" ID="BackButton" OnClick="LinkButton_Click" runat="server" CausesValidation="False" CommandName="Link" Text="Back to Courses" />
            </ItemTemplate>

            <RowStyle CssClass="courseEditForm"></RowStyle>
        </asp:FormView>
    </div>
</asp:Content>
