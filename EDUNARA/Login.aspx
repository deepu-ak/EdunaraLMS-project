<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EdunaraProject.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edunara - Access Portal</title>
    <style>
        body, html { height: 100%; margin: 0; font-family: 'Times New Roman', Times, serif; background-color: #f4f4f4; line-height: 1.6; }
        header { background: #ffffff; color: #333; padding: 20px 0; text-align: center; border-bottom: 2px solid #eee; }
        .logo-img { width: 80px; height: 80px; border-radius: 50%; display: block; margin: 0 auto 10px auto; object-fit: cover; border: 2px solid #cc0000; }
        nav { display: flex; justify-content: center; background: #333; }
        nav a { color: white; padding: 14px 20px; text-decoration: none; text-transform: uppercase; font-size: 14px; transition: 0.3s; }
        nav a:hover { background-color: #cc0000; }
        
        .main-wrapper { display: flex; justify-content: center; align-items: center; min-height: 80vh; padding: 20px; }
        .form-card { background: #ffffff; width: 100%; max-width: 400px; padding: 40px; border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); border-top: 6px solid #333; text-align: center; }
        .form-card h2 { margin-bottom: 25px; color: #333; text-transform: uppercase; }
        
        .input-group { margin-bottom: 20px; text-align: left; position: relative; }
        .input-group label { display: block; margin-bottom: 8px; font-weight: bold; }
        .form-control { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; font-size: 15px; }
        
        .error-box { background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-bottom: 15px; font-size: 14px; }
        .btn-action { width: 100%; background: #333; color: white; padding: 14px; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; font-weight: bold; transition: 0.3s; }
        .btn-action:hover { background: #cc0000; }

        .toggle-pass { font-size: 12px; color: #cc0000; cursor: pointer; float: right; margin-top: -30px; margin-right: 10px; position: relative; z-index: 2; }

        footer { background: #222; color: #bbb; padding: 50px 0 20px 0; margin-top: 50px; }
        .footer-content { width: 85%; margin: auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 40px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
    <img src="Image/LOGO-removebg-preview.png" alt="Edunara Logo" class="logo-img">
    <h1>EDUNARA</h1>
</header>

<nav>
    <a href="Default.aspx">Home</a>
    <a href="Course.aspx">Courses</a>
    <a href="Contact.aspx">Contact</a>
    <a href="Login.aspx">Login</a>
    <a href="Register.aspx">Register</a>
</nav>

        <div class="main-wrapper">
            <div class="form-card">
                <h2>Sign In</h2>

                <asp:Panel ID="pnlError" runat="server" Visible="false">
                    <div class="error-box"><asp:Literal ID="litError" runat="server"></asp:Literal></div>
                </asp:Panel>

                <div class="input-group">
                    <label for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="student@apu.edu.my" required></asp:TextBox>
                </div>

                <div class="input-group">
                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" required></asp:TextBox>
                    <span class="toggle-pass" onclick="togglePassword()">SHOW</span>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Access Portal" CssClass="btn-action" OnClick="btnLogin_Click" />

                <p style="margin-top:20px; font-size:14px;">
                    Don't have an account? <a href="Register.aspx" style="color: #cc0000;">Register here</a>
                </p>
            </div>
        </div>

        <footer>
            <div class="footer-content">
                <div class="footer-section"><h4 style="color:white">About Edunara</h4><p>Digital learning platform for modern education.</p></div>
                <div class="footer-section"><h4 style="color:white">Support Center</h4><p>Email: support@edunara.edu</p></div>
            </div>
            <div style="text-align: center; padding-top: 20px; font-size: 13px; border-top: 1px solid #444; margin-top: 30px;">
                <p>&copy; 2025 Edunara Digital Learning System | APU Web Project</p>
            </div>
        </footer>
    </form>
    <script src="scripts/login.js"></script>
</body>
</html>