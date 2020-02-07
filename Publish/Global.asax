<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
      RegisterRoutes(RouteTable.Routes)
    End Sub

    Private Shared Sub RegisterRoutes(ByVal routes As RouteCollection)
      routes.MapPageRoute("myHome", "Home", "~/Default.aspx")
      routes.MapPageRoute("myPenjualan", "kasir/input/Penjualan", "~/kasir/input/Penjualan.aspx")
      routes.MapPageRoute("myContact", "Contact-Page", "~/Contact.aspx")
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
      ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
      ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
      ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
      ' Code that runs when a session ends. 
      ' Note: The Session_End event is raised only when the sessionstate mode
      ' is set to InProc in the Web.config file. If session mode is set to StateServer 
      ' or SQLServer, the event is not raised.
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
      ' Fires at the beginning of each request '
      Dim culture As CultureInfo
      'Dim uri As Uri = Request.Url
      'If uri.ToString().Contains("nederlands") Then
      culture = New CultureInfo("id-ID")
      'ElseIf Uri.ToString().Contains("polski") Then
      'culture = New CultureInfo("pl-PL")
      'Else
      'culture = New CultureInfo("en-US")
      'End If

      Thread.CurrentThread.CurrentCulture = culture
      Thread.CurrentThread.CurrentUICulture = culture
    End Sub

</script>
