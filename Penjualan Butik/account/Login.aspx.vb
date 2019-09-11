
Imports System.Data
Imports System.Data.SqlClient

Partial Class account_Login
  Inherits System.Web.UI.Page

  Private Sub account_Login_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (IsPostBack) Then
      Me.TXTUSERNAME.Focus()
      If ((Not (Request.Cookies("UserName")) Is Nothing) _
                    AndAlso (Not (Request.Cookies("Password")) Is Nothing)) Then
        TXTUSERNAME.Text = Request.Cookies("UserName").Value
        TXTPASSWORD.Attributes("value") = Request.Cookies("Password").Value
        chkRememberMe.Checked = True
      End If
    End If
  End Sub

  Private Function GET_USERS() As Integer
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT ACCESS_NUMBER FROM T_USER WHERE EMAIL=@EMAIL AND SANDI=@SANDI"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = Me.TXTUSERNAME.Text
            .Parameters.Add("@SANDI", SqlDbType.VarChar).Value = Me.TXTPASSWORD.Text
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Return Integer.Parse(dr.GetValue(0))
            Else
              Return 0
            End If
            Return 0
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
      Return 0
    End Try
  End Function

  Private Function GET_ID_USER(EMAIL As String, SANDI As String) As String
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT KODE_USER FROM T_USER WHERE EMAIL=@EMAIL AND SANDI=@SANDI"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = EMAIL
            .Parameters.Add("@SANDI", SqlDbType.VarChar).Value = SANDI
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Return dr.GetValue(0)
            Else
              Return String.Empty
            End If
            Return String.Empty
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
      Return String.Empty
    End Try
  End Function

  Protected Sub BTSUBMIT_Click(sender As Object, e As EventArgs)
    Dim url As String = Request.QueryString("next-url")
    System.Threading.Thread.Sleep(3000)
    If Me.TXTUSERNAME.Text = String.Empty Then
      Me.LBINFO.Visible = True
      Me.LBINFO.Text = "Nama User masih kosong"
    ElseIf Me.TXTPASSWORD.Text = String.Empty Then
      Me.LBINFO.Visible = True
      Me.LBINFO.Text = "Sandi masih kosong"
    ElseIf Me.GET_USERS = False Then
      Me.LBINFO.Visible = True
      Me.LBINFO.Text = "UserID/Email dan kombinasi Sandi Anda salah!! Silahkan coba lagi."
    Else
      Me.GET_USERS()
      Try
        Select Case GET_USERS()
          Case 1

            If chkRememberMe.Checked Then
              Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
              Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
            Else
              Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
              Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
            End If
            Response.Cookies("UserName").Value = TXTUSERNAME.Text.Trim
            Response.Cookies("Password").Value = TXTPASSWORD.Text.Trim

            Session("KODE_USER") = Me.GET_ID_USER(Me.TXTUSERNAME.Text, Me.TXTPASSWORD.Text)
            Response.Redirect(Server.UrlDecode(url))
          Case 2

            If chkRememberMe.Checked Then
              Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
              Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
            Else
              Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
              Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
            End If
            Response.Cookies("UserName").Value = TXTUSERNAME.Text.Trim
            Response.Cookies("Password").Value = TXTPASSWORD.Text.Trim

            Session("KODE_USER") = Me.GET_ID_USER(Me.TXTUSERNAME.Text, Me.TXTPASSWORD.Text)
            Response.Redirect(Server.UrlDecode(url))
          Case 0
            Me.LBINFO.Text = "Username dan Password tidak cocok. Silahkan coba lagi!"
        End Select
      Catch ex As Exception
        'Response.Redirect("~/exception/error_500.aspx")
        Response.Write(ex.Message)
      End Try

    End If
  End Sub
End Class
