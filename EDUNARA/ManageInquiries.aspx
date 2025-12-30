<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageInquiries.aspx.cs" Inherits="EdunaraProject.ManageInquiries" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Manage Inquiries - Edunara Admin</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background: #f4f7f6; }
        .wrapper { display: flex; min-height: 100vh; }
        
        /* Sidebar - Exact match to Admin.aspx */
        .sidebar { width: 260px; background: #2c3e50; color: white; padding: 20px; flex-shrink: 0; }
        .sidebar h2 { color: #e74c3c; font-size: 22px; margin-bottom: 30px; text-align: center; border-bottom: 1px solid #34495e; padding-bottom: 10px; }
        .sidebar a { display: block; color: #bdc3c7; padding: 12px; text-decoration: none; margin-bottom: 5px; border-radius: 4px; transition: 0.3s; }
        .sidebar a:hover { background: #34495e; color: white; }
        
        /* Main Content */
        .main-content { flex-grow: 1; padding: 40px; background: #f4f7f6; }
        .header-box { margin-bottom: 30px; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
        
        /* Table Styling */
        .grid-style { width: 100%; border-collapse: collapse; background: white; margin-top: 10px; }
        .grid-style th { background: #2c3e50; color: white; padding: 12px; text-align: left; }
        .grid-style td { padding: 12px; border-bottom: 1px solid #eee; vertical-align: top; font-size: 14px; }
        .msg-text { color: #555; font-style: italic; line-height: 1.4; }
        .date-label { font-size: 12px; color: #999; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <h2>EDUNARA ADMIN</h2>
                <a href="Admin.aspx">Manage Courses</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="ManageInquiries.aspx" style="background:#34495e; color:white;">Manage Inquiries</a>
                <a href="Course.aspx" target="_blank">View Live Site</a>
                <hr style="border: 0.5px solid #34495e; margin: 20px 0;" />
                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="#e74c3c" Font-Bold="true">Logout</asp:LinkButton>
            </div>

            <div class="main-content">
                <div class="header-box">
                    <h1>Student Inquiries</h1>
                    <p>Read and manage messages sent from the contact form.</p>
                </div>

                <div class="card">
                    <h3>Inquiry Inbox</h3>
                    <asp:GridView ID="gvInquiries" runat="server" CssClass="grid-style" AutoGenerateColumns="False" 
                        DataKeyNames="id" OnRowDeleting="gvInquiries_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="sender_name" HeaderText="Student Name" />
                            <asp:BoundField DataField="sender_email" HeaderText="Email" />
                            <asp:TemplateField HeaderText="Message">
                                <ItemTemplate>
                                    <div class="msg-text"><%# Eval("message") %></div>
                                    <div class="date-label"><%# Eval("submitted_at", "{0:MMM dd, yyyy HH:mm}") %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                        OnClientClick="return confirm('Archive/Delete this message?');" 
                                        ForeColor="#e74c3c">Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                    <asp:Label ID="lblNoData" runat="server" Text="Your inbox is empty." Visible="false" 
                        Style="display:block; padding:20px; text-align:center; color:#999;"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>