<%@ Page Language="VB" AutoEventWireup="false" CodeFile="list-penerimaan.aspx.vb" Inherits="kasir_output_list_penerimaan" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Laporan Penerimaan Barang | Penjualan Butik</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/352fc529e7.js"></script>

    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.core.css" />
    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.default.css" id="toggleCSS" />

    <style>
        #loadingImg {
            display: none;
            position: absolute;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
    </style>

    <style>
        .alertify-log-custom {
            background: #023da4;
        }
    </style>

    <style>
        .spinners {
            display: inline-block;
            opacity: 0;
            width: 0;
            -webkit-transition: opacity 0.25s, width 0.25s;
            -moz-transition: opacity 0.25s, width 0.25s;
            -o-transition: opacity 0.25s, width 0.25s;
            transition: opacity 0.25s, width 0.25s;
        }

        .has-spinners.active {
            cursor: progress;
        }

            .has-spinners.active .spinners {
                opacity: 1;
                width: auto;
            }

        .has-spinners.btn.active .spinners {
            min-width: 20px;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light border-bottom">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="../../Default.aspx" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <asp:DropDownList ID="TXTJENISLAPORAN" CssClass="form-control select2"
                            Style="width: 100%;" runat="server">
                            <asp:ListItem>--Pilih Jenis Laporan--</asp:ListItem>
                            <asp:ListItem>Laporan Harian</asp:ListItem>
                            <asp:ListItem>Laporan Bulanan</asp:ListItem>
                            <asp:ListItem>Laporan Tahunan</asp:ListItem>
                            <%--                            <asp:ListItem Value="supplier">Berdasarkan Nama Supplier</asp:ListItem>
                            <asp:ListItem>Berdasarkan Nama Barang</asp:ListItem>
                            <asp:ListItem>Berdasarkan Kategori Barang</asp:ListItem>--%>
                        </asp:DropDownList>
                    </li>
                </ul>
            </nav>
            <!-- /.navbar -->

            <!-- Main Sidebar Container -->
            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../../Default.aspx" class="brand-link">
                    <img src="../../dist/img/credit/boutique-logo.jpg"
                        alt="Logo Butik"
                        class="brand-image">
                    <span class="brand-text font-weight-light">Penjualan Butik</span>
                </a>

                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user (optional) -->
                    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                        <div class="image">
                            <asp:Image ID="imgUser" runat="server" CssClass="img-circle elevation-2" AlternateText="User Image" />
                        </div>
                        <div class="info">
                            <asp:LinkButton ID="BTPROFILE" runat="server" CssClass="d-block" PostBackUrl="~/account/User-Profile.aspx"></asp:LinkButton>
                        </div>
                    </div>

                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                            <li class="nav-item">
                                <a href="../../Default.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-tachometer-alt"></i>
                                    <p>Dashboard</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-book-open"></i>
                                    <p>
                                        Master
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../input/Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Pengguna.aspx" class="nav-link">
                                            <i class="fas fa-user-plus nav-icon"></i>
                                            <p>Pengguna</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-columns"></i>
                                    <p>
                                        Detail
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="../input/Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../input/Penjualan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-upload-alt nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">PELAPORAN</li>
                            <li class="nav-item has-treeview">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon far fa-clone"></i>
                                    <p>
                                        Laporan
                                    <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="list-pengguna.aspx" class="nav-link">
                                            <i class="fas fa-address-card nav-icon"></i>
                                            <p>Daftar Pengguna</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">AKUN</li>
                            <li class="nav-item">
                                <a href="../../account/User-Profile.aspx" class="nav-link">
                                    <i class="nav-icon fas fa-user-alt"></i>
                                    <p>Pengguna</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="BTLOGOUT" runat="server" OnClick="BTLOGOUT_Click" CssClass="nav-link"><i class="nav-icon fas fa-sign-out-alt"></i>&nbsp;Logout</asp:LinkButton>
                            </li>
                        </ul>
                    </nav>
                    
                </div>
            </aside>

            <div class="content-wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Penerimaan Barang</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../Default.aspx">Laporan</a></li>
                                    <li class="breadcrumb-item active">Penerimaan Barang</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Laporan Penerimaan Barang</h3>
                            <div class="card-tools">
                                <asp:LinkButton ID="BTREFRESH" runat="server" ToolTip="Muat Ulang" CssClass="btn btn-tool" OnClick="BTREFRESH_Click"><i class="fas fa-sync"></i></asp:LinkButton>
                                <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="validate table-responsive">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="table-responsive" id="ContentToPrint">
                                                    <div class="col-lg-12 text-center" id="DIVKOP" runat="server">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 10%; text-align: left">
                                                                    <img src="../../dist/img/credit/boutique-logo.jpg" style="width: 60px"></td>
                                                                <td style="width: 90%; text-align: center">
                                                                    <asp:Label ID="LBJUDULKOP" runat="server" Font-Size="X-Large" Font-Bold="true" Text="Laksanha Boutique"></asp:Label><br />
                                                                    <asp:Label ID="LBJUDULLAPKOP" runat="server" Font-Size="Medium" Text="Laporan Penerimaan Barang"></asp:Label><br />
                                                                    <asp:Label ID="LBALAMATKOP" runat="server" Font-Size="Small" Text="Alamat: Jalan"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <hr style="border: 3px solid black; border-radius: 5px;" />
                                                    </div>
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="GVBARANG" runat="server" CssClass="table table-bordered table-striped table-hover js-basic-example dataTable"
                                                                AutoGenerateColumns="false" EnableSortingAndPagingCallbacks="false" RowStyle-Wrap="false" role="grid" RowStyle-CssClass="myRow"
                                                                DataKeyNames="KODE_BARANG" OnRowDataBound="GVBARANG_RowDataBound" Font-Size="X-Small" GridLines="Both">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="NO.">
                                                                        <ItemTemplate>
                                                                            <%# Container.DataItemIndex + 1 %>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                                        <HeaderTemplate>
                                                                            <asp:CheckBox ID="chkAllSelect" runat="server" />
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                                                            <asp:HiddenField ID="hfKODE_BARANG" runat="server" Value='<%# Eval("KODE_BARANG")%>' />
                                                                            <asp:HiddenField ID="HFIDBARANG" runat="server" Value='<%# Eval("KODE_BARANG")%>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ShowHeader="true" HeaderText="OPSI" ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                                        <ItemTemplate>
                                                                            <asp:HiddenField ID="HF_ID_BARANG" runat="server" Value='<%# Eval("KODE_PENERIMAAN")%>' />
                                                                            <asp:HiddenField ID="HF_KODE_KATEGORI" runat="server" Value='<%# Eval("KODE_KATEGORI")%>' />
                                                                            <asp:HiddenField ID="HF_FILEPATH" runat="server" Value='<%# Eval("GAMBAR_FILEPATH") & Eval("GAMBAR_FILENAME")%>' />
                                                                            <asp:LinkButton ID="EditButton" runat="server" CssClass="btn btn-sm btn-info" CommandName="Edit" data-toggle="tooltip" data-placement="left" title="Detail Invoice" PostBackUrl='<%# Eval("INVOICE_PENERIMAAN", "~/kasir/reports/invoice-penerimaan.aspx?inv={0}")%>'><i class="fas fa-info-circle"></i></asp:LinkButton>
                                                                            <asp:LinkButton ID="DeleteButton" runat="server" CssClass="btn btn-sm btn-danger has-spinners" CommandName="Delete" data-toggle="tooltip" data-placement="right" title="Hapus" CommandArgument='<%# Container.DataItemIndex %>'><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>GAMBAR</HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="LbFilePath" runat="server" ImageUrl='<%# Eval("GAMBAR_FILEPATH") & Eval("GAMBAR_FILENAME")%>' Height="50px" Width="40px"></asp:Image>
                                                                            <asp:Image ID="LbFilePath2" runat="server" Visible="false" ImageUrl="~/dist/img/No_Image-128.png" Height="50px" Width="40px"></asp:Image>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="INVOICE_PENERIMAAN" HeaderText="INVOICE" ReadOnly="True" />
                                                                    <asp:BoundField DataField="NAMA_BARANG" HeaderText="NAMA_BARANG" ReadOnly="True" />
                                                                    <asp:BoundField DataField="JUMLAH_MASUK" HeaderText="MASUK" ReadOnly="true" />
                                                                    <asp:BoundField DataField="HARGA_BELI" HeaderText="HARGA_BELI" ReadOnly="true" DataFormatString="{0:C2}" />
                                                                    <asp:BoundField DataField="HARGA_JUAL" HeaderText="HARGA_JUAL" ReadOnly="true" DataFormatString="{0:C2}" />
                                                                    <asp:BoundField DataField="TOTAL_HARGA" HeaderText="TOTAL_HARGA" ReadOnly="true" DataFormatString="{0:C2}" />
                                                                    <asp:BoundField DataField="STOK" HeaderText="STOK" ReadOnly="true" />
                                                                    <asp:BoundField DataField="NAMA_USER" HeaderText="KASIR" ReadOnly="true" />
                                                                    <asp:BoundField DataField="NAMA_SUPPLIER" HeaderText="SUPPLIER" ReadOnly="true" />
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:Image ID="loadingImg" runat="server" ImageUrl="~/dist/img/loading.gif" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="BTREFRESH" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="BTCARITGL" EventName="Click" />
                                                            <asp:AsyncPostBackTrigger ControlID="TXTPERIODE" EventName="SelectedIndexChanged" />
                                                            <asp:AsyncPostBackTrigger ControlID="TXTTAHUN" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="GVBARANG" EventName="PageIndexChanging" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="TXTNAMAKONSUMEN" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <div class="card-footer">
                            <asp:LinkButton ID="BTPRINTALL" runat="server" CssClass="btn btn-success" OnClientClick="return PrintDiv('ContentToPrint');"><i class="fas fa-print"></i>&nbsp;Print Semua</asp:LinkButton>
                            <asp:LinkButton ID="BTPRINTSELECTED" runat="server" CssClass="btn btn-primary"><i class="fa fa-check-circle"></i>&nbsp;Print dipilih</asp:LinkButton>
                        </div>
                    </div>
                </section>
            </div>

            <div class="modal fade" id="modal-lap-harian">
                <div class="modal-dialog">
                    <div class="modal-content bg-primary">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Harian</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="input-group input-group-sm mb-0">
                                                <asp:TextBox ID="TXTTGLDARI" runat="server" CssClass="form-control" placeholder="Dari Tanggal"></asp:TextBox>
                                                <asp:TextBox ID="TXTTGLSAMPAI" runat="server" CssClass="form-control" placeholder="Sampai Tanggal"></asp:TextBox>
                                                <div class="input-group-append">
                                                    <asp:LinkButton ID="BTCARITGL" runat="server" OnClick="BTCARITGL_Click" CssClass="btn btn-primary has-spinners">Cari</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="modal fade" id="modal-lap-bulanan">
                <div class="modal-dialog">
                    <div class="modal-content bg-success">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-success">
                                <div class="card-header">
                                    <h3 class="card-title">Bulanan</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:DB_Penjualan_Butik_ConnectionString %>"
                                                SelectCommand="SELECT DISTINCT PERIODE FROM T_PENERIMAAN"></asp:SqlDataSource>
                                            <asp:DropDownList ID="TXTPERIODE" AppendDataBoundItems="true" CssClass="form-control select2"
                                                Style="width: 100%;" runat="server" DataSourceID="SqlDataSource1" DataTextField="PERIODE"
                                                OnSelectedIndexChanged="TXTPERIODE_SelectedIndexChanged" AutoPostBack="true" EnableViewState="false">
                                                <asp:ListItem>--Pilih--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="TXTIDSUPPLIER" runat="server" />
                                            <asp:Label ID="LBINFOSUPPLIER" runat="server" Style="color: #dc3545"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="modal fade" id="modal-lap-tahunan">
                <div class="modal-dialog">
                    <div class="modal-content bg-danger">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-danger">
                                <div class="card-header">
                                    <h3 class="card-title">Tahunan</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:DB_Penjualan_Butik_ConnectionString %>"
                                                SelectCommand="SELECT DISTINCT YEAR(TANGGAL_MASUK) AS TAHUN FROM T_PENERIMAAN"></asp:SqlDataSource>
                                            <asp:DropDownList ID="TXTTAHUN" AppendDataBoundItems="true" CssClass="form-control select2"
                                                Style="width: 100%;" runat="server" DataSourceID="SqlDataSource2" DataTextField="TAHUN"
                                                OnSelectedIndexChanged="TXTTAHUN_SelectedIndexChanged" AutoPostBack="true" EnableViewState="false">
                                                <asp:ListItem>--Pilih--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Label ID="Label1" runat="server" Style="color: #dc3545"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

            <div class="modal fade" id="modal-lap-supplier">
                <div class="modal-dialog">
                    <div class="modal-content bg-warning">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Nama Supplier</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:TextBox ID="TXTNAMAKONSUMEN" runat="server" placeholder="Masukkan Nama Supplier" CssClass="form-control" onkeyup="RefreshUpdatePanel();" AutoPostBack="true" OnTextChanged="TXTNAMAKONSUMEN_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal-lap-namabarang">
                <div class="modal-dialog">
                    <div class="modal-content bg-warning">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Nama Barang</h3>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <asp:TextBox ID="TXTNAMABARANG" runat="server" placeholder="Masukkan Nama Barang" CssClass="form-control" onkeyup="RefreshUpdatePanel();" AutoPostBack="true" OnTextChanged="TXTNAMAKONSUMEN_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="modal-detail-invoice">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-warning">
                                <div class="card-header">
                                    <h3 class="card-title">Nama Barang</h3>
                                </div>
                                <div class="card-body">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="main-footer">
                <div class="float-right d-none d-sm-block">
                    <b>Version</b> 1.0.0
   
                </div>
                <strong>Copyright &copy; 2019 <a href="https://web.facebook.com/fanny.kaunang.7">FannyKaunang</a>.</strong> All rights
    reserved.
 
            </footer>

            <!-- Control Sidebar -->
            <aside class="control-sidebar control-sidebar-dark">
                <!-- Control sidebar content goes here -->
            </aside>
            <!-- /.control-sidebar -->
        </div>
        <!-- ./wrapper -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- FastClick -->
        <script src="../../plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="../../dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="../../dist/js/demo.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="../../plugins/alertify/js/alertify.js"></script>
        <script src="../../plugins/alertify/js/alertify.min.js"></script>

        <script type="text/javascript">
            function RefreshUpdatePanel() {
                __doPostBack('<%= Me.TXTNAMAKONSUMEN.ClientID %>', '');
            };
        </script>

        <script type="text/javascript">
            function PrintDiv(printpage) {
                var popupWin = window.open('', '_blank', 'status=0,toolbar=0,scrollbars=1,width=700,height=400,location=no,left=200px');
                popupWin.document.write('<html><head><link href="../../dist/css/adminlte.min.css" rel="stylesheet"><link href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet"/><link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" /><link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet" /></head > <body onload="window.print()">' + document.all.item(printpage).innerHTML + '</body></html > ');
                popupWin.document.close();
                popupWin.focus();
                return false;
            }
        </script>

        <script type="text/javascript">
            function PrintGridViewSelectedRows() {
                $("[id*=GVBARANG] input[type=checkbox]:checked").each(function () {
                    if ($(this).is(":checked")) {
                        $(this).closest('tr').removeClass('myRow');
                        $(this).closest('tr').addClass('printRow');
                        return false;
                    } else {
                        $(".myRow").remove();
                        return false;
                    }
                });
                $('#GVBARANG').find('.myRow').hide();
                PrintDiv('ContentToPrint');
            }
        </script>

        <script type="text/javascript">
            function animatePrint() {
                $('html, body').animate({
                    scrollTop: parseInt($("#BTPRINTALL").offset().top)
                }, 2000);
                $("[id*=BTCARITGL]").buttonLoader('stop');
            }
        </script>

        <script type="text/javascript">
            $(function () {
                //$("#TXTTGLPENERIMAAN").datepicker();
                $("#TXTTGLDARI").datepicker({
                    beforeShow: function () {
                        setTimeout(function () {
                            $('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    },
                    onSelect: function () {
                        $("[id*=LbTGLPENERIMAAN]").text(null);
                        $("#TXTTGLDARI").datepicker("option", "dateFormat", "dd/mm/yy");
                        return false;
                    }
                });
                $("#TXTTGLDARI").on("change", function () {
                    $("#TXTTGLDARI").datepicker("option", "dateFormat", "dd/mm/yy");
                });

                $("#TXTTGLSAMPAI").datepicker({
                    beforeShow: function () {
                        setTimeout(function () {
                            $('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    },
                    onSelect: function () {
                        $("[id*=LbTGLPENERIMAAN]").text(null);
                        $("#TXTTGLSAMPAI").datepicker("option", "dateFormat", "dd/mm/yy");
                        return false;
                    }
                });
                $("#TXTTGLSAMPAI").on("change", function () {
                    $("#TXTTGLSAMPAI").datepicker("option", "dateFormat", "dd/mm/yy");
                });

                function Loading() {
                    $("#loadingImg").fadeIn().delay(3000);
                }

                $("#BTREFRESH").on("click", function () {
                    $("#loadingImg").css("display", "block");
                    Loading();
                    //$("#loadingImg").fadeIn("slow");
                    //setTimeout(function () {
                    //    Complete();
                    //}, 6000);
                });

                $("#TXTPERIODE").on("change", function () {
                    $("#loadingImg").css("display", "block");
                    Loading();
                });

                $("#TXTTAHUN").on("change", function () {
                    $("#loadingImg").css("display", "block");
                    Loading();
                });

                $("#<%=UpdatePanel1.ClientID %>").on("click", "[id*=GVBARANG] [id*=DeleteButton]", function (e) {
                    if (confirm("Yakin ingin menghapus data yang terpilih?? Anda tidak dapat memulihkannya kembali!!!")) {
                        var row = $(this).closest("tr");
                        var btn = $(this);
                        var hfKODE_BARANG = row.find("[id*=HF_ID_BARANG]").val();

                        $.ajax({
                            type: "POST",
                            url: '<%=ResolveUrl("~/kasir/output/list-penerimaan.aspx/GET_DELETE_PENERIMAAN")%>',
                            data: JSON.stringify({ "KODE_PENERIMAAN": hfKODE_BARANG }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            error: OnErrorOrFailure,
                            failure: OnErrorOrFailure,
                            beforeSend: function (r) {
                                setTimeout(function () {
                                    $.ajax($.extend(options, { beforeSend: $.noop }));
                                }, 5000);
                                $(btn).buttonLoader('start');
                            },
                            success: function (r) {
                                if (r.d) {
                                    $(btn).buttonLoader('stop');
                                    $(row).fadeOut(1600);
                                    alertify.custom = alertify.extend("custom");
                                    alertify.custom('<strong> Informasi!</strong> </br>Data berhasil di-Hapus!');
                                    if ($("[id*=GVBARANG] td").length == 0) {
                                        $("[id*=GVBARANG] tbody").append("<tr><td colspan = '4' align = 'center'>No records found.</td></tr>")
                                    }
                                }
                            },
                        });
                        function OnErrorOrFailure(response) {
                            alert(response.responseText);
                            $(btn).buttonLoader('stop');
                        }
                    }
                    return false;
                });

                $("#TXTNAMAKONSUMEN").change(function () {
                    var value = $(this);
                    if (value.val() == 'Laporan Harian') {
                        $('#modal-lap-harian').modal('show');
                    } else if (value.val() == 'Laporan Tahunan') {
                        $('#modal-lap-tahunan').modal('show');
                    } else if (value.val() == 'Laporan Bulanan') {
                        $('#modal-lap-bulanan').modal('show');
                    } else if (value.val() == 'konsumen') {
                        $('#modal-lap-konsumen').modal('show');
                    }
                });

                $("#TXTJENISLAPORAN").change(function () {
                    var value = $(this);

                    if (value.val() == 'Laporan Harian') {
                        $('#modal-lap-harian').modal('show');
                    } else if (value.val() == 'Laporan Tahunan') {
                        $('#modal-lap-tahunan').modal('show');
                    } else if (value.val() == 'Laporan Bulanan') {
                        $('#modal-lap-bulanan').modal('show');
                    }
                    //else if (value.val() == 'supplier') {
                    //    $('#modal-lap-supplier').modal('show');
                    //}
                });

                $("input:checkbox").change(function () {
                    if ($(this).is(":checked")) {
                        $(this).closest('tr').addClass('printRow');
                        $(this).closest('tr').removeClass('myRow');
                    } else {
                        $(this).closest('tr').removeClass('printRow');
                        $(this).closest('tr').addClass('myRow');
                    }
                });

                $("[id$=GVBARANG] input[type=checkbox][id*=chkAllSelect]").change(function () {
                    $('input:checkbox').prop('checked', this.checked);
                    var tr = $(this).closest("table").find('tr');

                    if ($(this).is(":checked")) {
                        $(tr).addClass('printRow');
                        $(tr).removeClass('myRow');
                    } else {
                        $(tr).removeClass('printRow');
                        $(tr).addClass('myRow');
                    }
                });

                $("body").on("click", "[id*=BTPRINTSELECTED]", function () {
                    var GridViewContent = "";
                    $(':input:checked').closest('tr').each(function (i, item) {
                        GridViewContent += "<tr>" + $(item)[0].innerHTML + "</tr>";
                    });

                    if (GridViewContent == "") {
                        alert("Anda harus memilih satu atau beberapa item untuk di-Print !");
                        return false;
                    } else {
                        PrintGridViewSelectedRows();
                        return false;
                    }
                    //return false;
                });

                $("body").on("click", "[id*=BTCARITGL]", function () {
                    $(this).buttonLoader('start');
                    $("#loadingImg").css("display", "block");
                    Loading();
                });
            });
        </script>

        <script>
            $(function () {
                (function ($) {
                    $('.has-spinners').attr("disabled", false);
                    $.fn.buttonLoader = function (action) {
                        var self = $(this);
                        if (action == 'start') {
                            if ($(self).attr("disabled") == "disabled") {
                                return false;
                            }
                            $('.has-spinners').attr("disabled", true);
                            $(self).attr('data-btn-text', $(self).html());
                            var text = 'Loading';
                            console.log($(self).attr('data-load-text'));
                            if ($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != "") {
                                var text = $(self).attr('data-load-text');
                            }
                            $(self).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + text);
                            $(self).addClass('active');
                        }
                        if (action == 'stop') {
                            $(self).html($(self).attr('data-btn-text'));
                            $(self).removeClass('active');
                            $('.has-spinners').attr("disabled", false);
                        }
                    }
                })(jQuery);

                !function (t) {
                    t(".has-spinners").attr("disabled", !1), t.fn.buttonLoader = function (a) {
                        var s = t(this);
                        if ("start" == a) {
                            if ("disabled" == t(s).attr("disabled"))
                                return !1; t(".has-spinners").attr("disabled", !0), t(s).attr("data-btn-text", t(s).text());
                            var e = "Loading";
                            if (console.log(t(s).attr("data-load-text")), void 0 != t(s).attr("data-load-text") && "" != t(s).attr("data-load-text"))
                                var e = t(s).attr("data-load-text"); t(s).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + e), t(s).addClass("active")
                        } "stop" == a && (t(s).html(t(s).attr("data-btn-text")), t(s).removeClass("active"), t(".has-spinners").attr("disabled", !1))
                    }
                }(jQuery);

                (function ($) {
                    $('.has-spinners').attr("disabled", false);
                    $.fn.buttonLoader = function (action) {
                        var self = $(this);
                        if (action == 'start') {
                            if ($(self).attr("disabled") == "disabled") {
                                return false;
                            }
                            $('.has-spinners').attr("disabled", true);
                            $(self).attr('data-btn-text', $(self).html());
                            var text = 'Loading';
                            console.log($(self).attr('data-load-text'));
                            if ($(self).attr('data-load-text') != undefined && $(self).attr('data-load-text') != "") {
                                var text = $(self).attr('data-load-text');
                            }
                            $(self).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + text);
                            $(self).addClass('active');
                        }
                        if (action == 'stop') {
                            $(self).html($(self).attr('data-btn-text'));
                            $(self).removeClass('active');
                            $('.has-spinners').attr("disabled", false);
                        }
                    }
                })(jQuery);

                !function (t) {
                    t(".has-spinners").attr("disabled", !1), t.fn.buttonLoader = function (a) {
                        var s = t(this);
                        if ("start" == a) {
                            if ("disabled" == t(s).attr("disabled"))
                                return !1; t(".has-spinners").attr("disabled", !0), t(s).attr("data-btn-text", t(s).text());
                            var e = "Loading";
                            if (console.log(t(s).attr("data-load-text")), void 0 != t(s).attr("data-load-text") && "" != t(s).attr("data-load-text"))
                                var e = t(s).attr("data-load-text"); t(s).html('<span class="spinners"><i class="fa fa-spinner fa-spin" title="button-loader"></i></span> ' + e), t(s).addClass("active")
                        } "stop" == a && (t(s).html(t(s).attr("data-btn-text")), t(s).removeClass("active"), t(".has-spinners").attr("disabled", !1))
                    }
                }(jQuery);
            });
        </script>
    </form>
</body>
</html>
