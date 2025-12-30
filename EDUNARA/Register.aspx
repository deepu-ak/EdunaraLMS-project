<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EdunaraProject.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Digital Learning System</title>
    <style>
        html, body { height: 100%; margin: 0; padding: 0; font-family: 'Times New Roman', serif; line-height: 1.5; background-color: #f4f4f4; color: #333; }
        .main-wrapper { display: flex; justify-content: center; align-items: center; min-height: 100vh; padding: 20px; box-sizing: border-box; }
        .form-card { background: #ffffff; width: 100%; max-width: 450px; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.15); border-top: 6px solid #cc0000; }
        .form-card h2 { text-align: center; margin-top: 0; text-transform: uppercase; letter-spacing: 1px; }
        .alert { padding: 10px; border-radius: 5px; margin-bottom: 20px; text-align: center; font-size: 14px; }
        .error { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-weight: bold; margin-bottom: 8px; font-size: 14px; }
        .form-control { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 16px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 14px; background-color: #333; color: white; border: none; border-radius: 6px; font-size: 16px; font-weight: bold; cursor: pointer; transition: 0.3s; }
        .btn-submit:hover { background-color: #cc0000; }
        .form-link { text-align: center; margin-top: 20px; font-size: 14px; }
        .form-link a { color: #cc0000; text-decoration: none; font-weight: bold; }
        #matchError { color: red; font-size: 12px; display: none; margin-top: 5px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="form-card">
                <h2>Register</h2>
                <p style="text-align:center; color:#666; font-size:14px;">Create your account to access digital resources.</p>

                <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>

                <div class="form-group">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="email@apu.edu.my"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="At least 8 characters"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Confirm Password</label>
                    <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <span id="matchError">Passwords do not match!</span>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn-submit" 
                    OnClientClick="return validateRegisterForm();" OnClick="btnRegister_Click" />

                <div class="form-link">
                    Already have an account? <a href="Login.aspx">Login here</a>
                </div>
            </div>
        </div>
    </form>
    <script src="scripts/register.js"></script>
</body>
</html>