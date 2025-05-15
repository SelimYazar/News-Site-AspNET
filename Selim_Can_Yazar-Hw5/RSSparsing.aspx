<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="RSSparsing.aspx.cs" Inherits="Selim_Can_Yazar_Hw5.RSSparsing" %>
<!DOCTYPE html>
<html>
<head runat="server">
  <meta charset="utf-8" />
  <title>RSS Parsing</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="container py-5 text-center">
      <h1>Haberler Çekiliyor…</h1>
      <asp:Literal ID="litStatus" runat="server" />
    </div>
  </form>
</body>
</html>
