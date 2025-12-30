<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="EdunaraProject.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Access - Edunara</title>
    <style>
        body, html { height: 100%; margin: 0; font-family: 'Times New Roman', Times, serif; background-color: #1a1a1a; display: flex; justify-content: center; align-items: center; }
        .admin-login-card { background: #ffffff; width: 100%; max-width: 400px; padding: 40px; border-radius: 12px; box-shadow: 0 15px 35px rgba(0,0,0,0.5); border-top: 6px solid #cc0000; text-align: center; }
        .admin-login-card h2 { margin-bottom: 10px; color: #333; text-transform: uppercase; }
        .admin-login-card p { color: #cc0000; font-weight: bold; font-size: 13px; margin-bottom: 30px; }
        .error-box { background: #fee2e2; color: #b91c1c; padding: 10px; border-radius: 6px; margin-bottom: 20px; font-size: 14px; border: 1px solid #f87171; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
        .form-control { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; font-size: 16px; }
        .btn-admin { width: 100%; padding: 14px; background-color: #cc0000; color: white; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.3s; }
        .btn-admin:hover { background-color: #a30000; }
        .back-link { display: block; margin-top: 20px; color: #666; text-decoration: none; font-size: 14px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-login-card">
            <h2>Admin Portal</h2>
            <p>Restricted Access - Authorized Personnel Only</p>

            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="error-box">
                    <asp:Literal ID="litError" runat="server"></asp:Literal>
                </div>
            </asp:Panel>

            <div class="form-group">
                <label>Admin ID</label>
                <asp:TextBox ID="txtAdminId" runat="server" CssClass="form-control" placeholder="Enter Admin Username" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Security Key</label>
                <asp:TextBox ID="txtAdminPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password" required></asp:TextBox>
            </div>

            <asp:Button ID="btnAuthenticate" runat="server" Text="Authenticate" CssClass="btn-admin" OnClick="btnAuthenticate_Click" />

            <a href="Default.aspx" class="back-link">← Return to Main Site</a>
        </div>
    </form>
</body>
</html>