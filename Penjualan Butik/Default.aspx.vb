Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Net
Imports System.Web.Script.Serialization
Imports System.Web.Services
Imports QRCoder

Partial Class _Default
  Inherits Page

  Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not (Me.Page.IsPostBack) Then
      If Session("KODE_USER") IsNot Nothing Then
        Me.GET_USERS(Session("KODE_USER").ToString)
        Me.GET_TOTAL_PENJUALAN()
        Me.GET_TOTAL_PENERIMAAN()
        Me.GET_TOTAL_KONSUMEN()
        Me.GET_TOTAL_PENDAPATAN_TODAY()
      Else
        Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
      End If
    End If
  End Sub

  Private Sub GET_TOTAL_PENJUALAN()
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT COUNT(*) TOTAL FROM VW_PENJUALAN"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTPENJUALAN.Text = Convert.ToInt32(dr("TOTAL"))
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Private Sub GET_TOTAL_PENERIMAAN()
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT COUNT(*) TOTAL FROM VW_PENERIMAAN"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTPENERIMAAN.Text = Convert.ToInt32(dr("TOTAL"))
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Private Sub GET_TOTAL_KONSUMEN()
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT COUNT(*) TOTAL FROM T_KONSUMEN"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTKONSUMEN.Text = Convert.ToInt32(dr("TOTAL"))
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Private Sub GET_TOTAL_PENDAPATAN_TODAY()
    Try
      Using connect As New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT ISNULL(SUM(TOTAL_BAYAR), 0) TOTALBAYAR FROM VW_PENJUALAN WHERE (CONVERT(VARCHAR(10), TANGGAL_PENJUALAN, 102) = CONVERT(VARCHAR(10), GETDATE(), 102))"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.TXTPENDAPATANHARIINI.Text = String.Format("{0:C2}", Convert.ToInt32(dr("TOTALBAYAR")))
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Private Sub GET_USERS(KODE_USER As String)
    Try
      Using connect As New SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
        Dim str As String = "SELECT * FROM T_USER WHERE KODE_USER=@KODE_USER"
        Using cmd As New SqlCommand(str, connect)

          With cmd
            .Parameters.Add("@KODE_USER", SqlDbType.VarChar).Value = KODE_USER
            .CommandType = CommandType.Text
            .CommandText = str
            .Connection = connect
            .Connection.Open()
          End With

          Using dr As SqlDataReader = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then
              Me.BTPROFILE.Text = dr("NAMA_USER").ToString
              Me.imgUser.ImageUrl = dr("FOTO_FILEPATH").ToString & dr("FOTO_FILENAME").ToString
            End If
          End Using
        End Using
      End Using
    Catch ex As Exception
      Response.Write(ex.Message)
    End Try
  End Sub

  Protected Sub BTLOGOUT_Click(sender As Object, e As EventArgs)
    Session.Abandon()
    Session.Clear()
    Response.Redirect("~/account/Login.aspx?next-url=~/Default.aspx", True)
  End Sub

  Private serverKey As String = "AAAAbu4MFa0:APA91bFipM6MRrA3nrE134IoZk_oqb7TzJoPxXPcGdK5oJ_ZtQWkXy_cEfL8Zm6KQWbabgGvxWgLn1hKeHKGta4vvHzNDsprYcKbwCW43f_0rumCsevFGSVNBrHDjTPlJstuxk187jCc"
  Private senderId As String = "476440171949"
  Private webAddr As String = "https://fcm.googleapis.com/fcm/send"
  Public Function SendNotification(ByVal DeviceToken As String, ByVal title As String, ByVal msg As String) As String
    Dim result = "-1"
    Dim httpWebRequest = CType(WebRequest.Create(webAddr), HttpWebRequest)
    httpWebRequest.ContentType = "application/json"
    httpWebRequest.Headers.Add(String.Format("Authorization: key={0}", serverKey))
    httpWebRequest.Headers.Add(String.Format("Sender: id={0}", senderId))
    httpWebRequest.Method = "POST"
    Dim data = New With {Key .[to] = DeviceToken,
        Key .priority = "high",
        Key .content_available = True,
        Key .notification = New With {
        Key .body = msg,
        Key .title = title,
        Key .icon = "ic_shop_logo",
        Key .click_action = "OPEN_ACTIVITY_1"
        }
    } 'key disini berkaitan dengan getBody, getTitle dll di Java
    Dim serializer = New JavaScriptSerializer()

    Using streamWriter = New StreamWriter(httpWebRequest.GetRequestStream())
      Dim json As String = serializer.Serialize(data)
      streamWriter.Write(json)
      streamWriter.Flush()
    End Using

    Dim httpResponse = CType(httpWebRequest.GetResponse(), HttpWebResponse)

    Using streamReader = New StreamReader(httpResponse.GetResponseStream())
      result = streamReader.ReadToEnd()
    End Using

    Return result
  End Function
  Protected Sub Button1_Click(sender As Object, e As EventArgs)
    SendNotification("eu52podTnZo:APA91bEGXiYoyrlIZH5Qe67I_RG8e4CoS3cU-AV2XFFofc-RUvHB8n9UUp64tuVYFssXKwJIA737yo5vD7a2vj27mAlu57uVsGGhSyR6hKe4sbtl1ujOwGMO--P2GJ86splYGBR_4DeD", "Penjualan Butik", "Input Barang : ")
  End Sub

#Region "GET IN OUT GROUPBY PERIODE"
  Public Class GET_IN_OUT_GROUPBY_PERIODE_CLASS
    Public Property PERIODE As String
    Public Property JUMLAHMASUK As Integer
    Public Property JUMLAHKELUAR As Integer
  End Class

  <WebMethod>
  Public Shared Function GET_IN_OUT_GROUPBY_PERIODE() As List(Of GET_IN_OUT_GROUPBY_PERIODE_CLASS)
    Dim revenues As List(Of GET_IN_OUT_GROUPBY_PERIODE_CLASS) = New List(Of GET_IN_OUT_GROUPBY_PERIODE_CLASS)()

    Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
      Using cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT TOP (100) PERCENT MAX(PERIODE) AS PERIODE, SUM(JUMLAHMASUK) AS JUMLAHMASUK, SUM(JUMLAHKELUAR) AS JUMLAHKELUAR FROM dbo.VW_IN_OUT_GROUPBY_PERIODE GROUP BY PERIODE ORDER BY MAX(TANGGAL_MASUK)"
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds, "VW_IN_OUT_GROUPBY_PERIODE")

        If ds IsNot Nothing Then
          If ds.Tables.Count > 0 Then
            If ds.Tables("VW_IN_OUT_GROUPBY_PERIODE").Rows.Count > 0 Then
              For Each dr As DataRow In ds.Tables("VW_IN_OUT_GROUPBY_PERIODE").Rows
                revenues.Add(New GET_IN_OUT_GROUPBY_PERIODE_CLASS With {
                                    .PERIODE = dr("PERIODE").ToString(),
                                    .JUMLAHMASUK = Convert.ToInt32(dr("JUMLAHMASUK").ToString()),
                                    .JUMLAHKELUAR = Convert.ToInt32(dr("JUMLAHKELUAR"))
                                })
              Next
            End If
          End If
        End If
      End Using
    End Using
    Return revenues
  End Function
#End Region

#Region "BARANG TERLARIS"
  Public Class GET_BARANG_TERLARIS_CLASS
    Public Property NAMA_BARANG As String
    Public Property TOTAL As Integer
  End Class

  <WebMethod>
  Public Shared Function GET_BARANG_TERLARIS() As List(Of GET_BARANG_TERLARIS_CLASS)
    Dim revenues As List(Of GET_BARANG_TERLARIS_CLASS) = New List(Of GET_BARANG_TERLARIS_CLASS)()

    Using con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DB_Penjualan_Butik_ConnectionString").ToString)
      Using cmd As SqlCommand = New SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "SELECT DISTINCT(NAMA_BARANG) NAMA_BARANG, SUM(JUMLAH_BELI) TOTAL FROM VW_PENJUALAN GROUP BY NAMA_BARANG ORDER BY TOTAL DESC"
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet()
        da.Fill(ds, "VW_PENJUALAN")

        If ds IsNot Nothing Then
          If ds.Tables.Count > 0 Then
            If ds.Tables("VW_PENJUALAN").Rows.Count > 0 Then
              For Each dr As DataRow In ds.Tables("VW_PENJUALAN").Rows
                revenues.Add(New GET_BARANG_TERLARIS_CLASS With {
                                    .NAMA_BARANG = dr("NAMA_BARANG").ToString(),
                                    .TOTAL = dr("TOTAL").ToString()
                                })
              Next
            End If
          End If
        End If
      End Using
    End Using
    Return revenues
  End Function
#End Region
End Class
