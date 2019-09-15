<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Penjualan.aspx.vb" Inherits="kasir_input_Penjualan" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Input Penjualan | Penjualan Butik</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/352fc529e7.js"></script>

    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.core.css" />
    <link rel="stylesheet" href="../../plugins/alertify/css/alertify.default.css" id="toggleCSS" />

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
                        <asp:LinkButton ID="BTLIST" runat="server" CssClass="btn btn-primary" PostBackUrl="~/kasir/output/list-penjualan.aspx"><i class="fas fa-list"></i>&nbsp;List Penjualan</asp:LinkButton>
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
                            <asp:LinkButton ID="BTPROFILE" runat="server" CssClass="d-block"></asp:LinkButton>
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
                                        <a href="Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Pengguna.aspx" class="nav-link">
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
                                        <a href="Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="Penjualan.aspx" class="nav-link">
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
                                        <a href="../output/list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="../output/list-pengguna.aspx" class="nav-link">
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
                                <h1>Penjualan Barang</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="../../Default.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Penjualan Barang</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- Default box -->
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Input Penjualan</h3>

                            <div class="card-tools">
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
                                <asp:GridView ID="Gridview1" runat="server" AutoGenerateColumns="false"
                                    CssClass="myData table table-bordered table-striped table-hover js-basic-example dataTable" Font-Size="Small" OnRowDeleting="Gridview1_RowDeleting"
                                    HeaderStyle-ForeColor="White" FooterStyle-ForeColor="White" FooterStyle-BackColor="#39A38E" HeaderStyle-BackColor="#343a40">
                                    <RowStyle CssClass="firstRow" />
                                    <Columns>
                                        <asp:BoundField DataField="RowNumber" HeaderText="No" ItemStyle-CssClass="count" />
                                        <asp:TemplateField HeaderStyle-Width="80">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="BTSHOWSPAREPART" runat="server" Font-Size="X-Large" data-toggle="modal" data-target="#divBarang"><i class="fa fa-plus-circle"></i></asp:LinkButton>
                                                <%--<a href="#" id="BTSHOWSPAREPART" style="font-size: x-large" data-toggle="modal" data-target="#divBarang">
                                                    <i class="fa fa-plus-circle"></i></a>--%>
                                                <asp:LinkButton ID="BTDELETESPAREPART" runat="server" Font-Size="X-Large"><i class="fa fa-times-circle"></i></asp:LinkButton>
                                                <%--<a href="#" id="BTDELETESPAREPART" style="font-size: x-large">
                                                    <i class="fa fa-times-circle"></i></a>--%>
                                                <%--<asp:ImageButton ID="BTSHOWSPAREPART" runat="server" CssClass="icon icons8-Search" Width="28" Height="28" data-toggle="modal" data-target="#divBarang" OnClientClick="return false;" ToolTip="Browse Sparepart" ImageUrl="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACdklEQVRogd1Zy5HDIAx1CS4hR0gulOASUoJLSAnqICWkhBwJXCjBJbgEl7B7WGVsE2EbEE6ymuEq9IT09KGqIkSBqwXoRoAGCdZJMJ0EM+DpJJi7BHOVYM4xeovLCaw6gr2hoT8R5y5AH95muAJXo0djDffPdXcgAnTDYPj0DAJ0s4vxEh6XBeN79GhzAqsUuFqBq09glQRz/ssP04eBPC57GE9cbF1McuILkkAE6LaI8ehF3/ODhMdFgatTdIYcwh5OAvSBNj6fEgP5NLAmNrKN7yk2PkcQLzTLpZzwPn+yCdCtD+IEVmUrxgo6VdylxvyGuzrWV8BiNfN+Sb5Gopi9QpazJJiz731Ge0N39p7D2hxlfvJe+UzdducR7C1HmR//xTvJ11e3LkfZLKlYWGFFMO9mNSFZGRGPBz5TaeEGMGOgUvRJ3DtjohxFu4cQFs5Zh5usDLvMXWrAU4hakE7d76BRnBnYaNQvZOkJtfnO+atnUTfBCEXDiOpKs5kPNw48SbUihPfzW2qCFYq009R0xvbaxCuwhlJgXOUZaKqKzgXJtApB43tfN3vNCYx9WeG0sKIp07aH1yqmi/EYOsOfvryT0YWuXA5Ll0pcbD3pD5e+h3Hxu2b4PiAC4ZR8hjCwEQRrMznZSmcab90z/Ig6MHlZ6yZA+QYrZBF/ctvg8dHwqYRBvNB4ywZivNycJZgrGtGPxpoePXcXoNu1UHgrCC75ehAxYfmRIGTkB8rHgZCLHyFfAIJa9n4diIXW5f+DYC12uZIIovj8HiUJID4LQFVFg+Cb6DhlK4jdPs5TZAOI4gu4bAmAGIr/9nMKFrteBtrzX7F94LF7v0MpAAAAAElFTkSuQmCC" />--%>
                                                <%--<asp:ImageButton ID="BTDELETESPAREPART" runat="server" CssClass="icon icons8-Trash-Can" Width="28" Height="28" ImageUrl="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAABOUlEQVRIic2Wy7GFIAyGTwmW4FINC5aEFSVYgiVYgh1YgiVQQmIFlmAJluBdyHgfRxHQOXOZ+RcyJh8hAfJ6XQwyMmMEYoT1SCNCf+UjaJAqcud0Yg3DL7n5R0FHK2eE6XEQaxhIg9y1zaeDyMiMlDCkqs45Ws7y80Mzo7AjQk9Y1kEgX+Ij5I/SVdhdyMoIK6kivwJND4AWMjK7zhNCyyjstvfhzhmFJYQ2CHIIVkW+FYgwhGVNWNb7twZ5w3HVeff4zM7IjFTVBRv8KenZ5Y1ONLl/dpsYUExu3nIVA7pTeXMM6M6hDb+SPggS9gaIwkHfb02ChA0GjQh9MkjD8P9A7i1KAkX1ENulmgaKuoJIQZMMQmgjIirr9IigCQdd9HK+M5T0ZBCWtatA4uMmZWGEiVFYUtD4IF+DOu6rvwbudgAAAABJRU5ErkJggg==" OnClientClick="return false;" ToolTip="Hapus baris yang dipilih" />--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Kode Barang">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valKdBarang" runat="server">
                                                    <div class="col-sm-10">
                                                        <asp:Label ID="TXTKDBARANG" runat="server" Font-Size="Small" CssClass="InputKdBarang"></asp:Label>
                                                        <asp:HiddenField ID="HF_ID_BARANG" runat="server" />
                                                        <span id="LBINFOKDBARANG" style="font-size: x-small" class="help-block spanDefault"></span>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Barang">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valNamaBarang" runat="server">
                                                    <div class="col-sm-10">
                                                        <asp:LinkButton ID="LNKNAMABARANG" runat="server" Font-Size="Small" CssClass="InputBarang"></asp:LinkButton>
                                                        <asp:Label ID="TXTNAMABARANG" runat="server" Font-Size="Small"></asp:Label>
                                                        <span id="LBINFONAMABARANG" style="font-size: x-small" class="help-block spanDefault"></span>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Stok Akhir">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valQty" runat="server">
                                                    <div class="col-sm-10">
                                                        <%--<asp:TextBox ID="TXTQTY" runat="server" CssClass="form-control InputQty" Font-Size="Small"></asp:TextBox>--%>
                                                        <asp:Label ID="TXTSTOKAKHIR" runat="server" Font-Size="Small" CssClass="StokAkhir"></asp:Label>
                                                        <span id="LBINFOQty" style="font-size: x-small" class="help-block spanDefault"></span>
                                                        <asp:LinkButton ID="LBDETAILQTY" runat="server" Style="visibility: hidden" CssClass="link-detail btn btn-info btn-xs"><i class="fa fa-search"></i> Detail</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Jumlah Beli">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valJumBeli" runat="server">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox ID="TXTJUMBELI" runat="server" CssClass="form-control InputJUMBELI" Font-Size="Small"></asp:TextBox>
                                                        <span id="LBINFOJUMBELI" style="font-size: x-small" class="help-block spanDefault"></span>
                                                        <asp:LinkButton ID="LBDETAILJUMBELI" runat="server" Style="visibility: hidden" CssClass="link-detail btn btn-info btn-xs"><i class="fa fa-search"></i> Detail</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Harga Beli (Rp)">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valHargaBeli" runat="server">
                                                    <div class="col-sm-10">
                                                        <asp:TextBox ID="TXTHARGABELI" runat="server" CssClass="form-control InputHARGABELI" Font-Size="Small"></asp:TextBox>
                                                        <span id="LBINFOHARGABELI" style="font-size: x-small" class="help-block spanDefault"></span>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sub Total (Rp)">
                                            <ItemTemplate>
                                                <div class="form-group default has-error" id="valSubTotal" runat="server">
                                                    <div class="col-sm-10">
                                                        <asp:Label ID="TXTSUBTOTAL" runat="server" CssClass="InputSubTotal" Font-Size="Small"></asp:Label>
                                                        <span id="LBINFOSUBTOTAL" style="font-size: x-small" class="help-block spanDefault"></span>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="ButtonAdd" runat="server" CssClass="addButton btn btn-primary" OnClientClick="return false;" Font-Size="X-Small"><i class="fa fa-plus"></i> Tambah</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>
                            </div>

                            <span class="help-block">
                                <asp:Label ID="Label5" runat="server" Text=""></asp:Label></span>
                            <asp:HiddenField ID="HFIDXSPAREPART" runat="server" />
                            <asp:HiddenField ID="HFID" runat="server" />
                            <asp:LinkButton ID="BTREFRESH" runat="server" CssClass="btn btn-success" Font-Size="Medium" Visible="False" OnClick="BTREFRESH_Click">Tambah Sparepart</asp:LinkButton>
                            <asp:LinkButton ID="BTINSERTDATATABLE" runat="server" CssClass="btn btn-success" Visible="true"><i class="fa fa-check-circle"></i> Selesai</asp:LinkButton>
                            <asp:LinkButton ID="ButtonCancel" runat="server" CssClass="btn btn-danger" Style="visibility: hidden" OnClick="LinkButton1_Click"><i class="fa fa-minus-circle"></i> Reset</asp:LinkButton>
                            <asp:Button ID="Button1" runat="server" OnClientClick="return false;" Text="Button" Style="display: none" />

                        </div>

                        <%--                        
                        <div class="card-footer">
                            Footer
                        </div>--%>
                    </div>
                </section>

                <asp:Panel ID="Panel1" runat="server" Style="display: none">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title">Detail Penjualan</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No. Invoice/Faktur</label>
                                                <asp:TextBox ID="TXTFAKTUR" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:Image ID="imgLoadingFaktur" runat="server" ImageUrl="~/images/loader.gif" Height="20" Width="20" Style="display: none" />
                                                <span id="LBINFOFAKTUR" class="help-block" style="color: #dc3545"></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Konsumen</label>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" EnableViewState="false">
                                                    <ContentTemplate>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                            ConnectionString="<%$ ConnectionStrings:DB_Penjualan_Butik_ConnectionString %>"
                                                            SelectCommand="SELECT DISTINCT NAMA_KONSUMEN FROM T_KONSUMEN"></asp:SqlDataSource>
                                                        <asp:DropDownList ID="TXTKONSUMEN" AppendDataBoundItems="true" CssClass="form-control select2"
                                                            Style="width: 100%;" runat="server" DataSourceID="SqlDataSource1" DataTextField="NAMA_KONSUMEN"
                                                            OnSelectedIndexChanged="TXTKONSUMEN_SelectedIndexChanged" AutoPostBack="true" EnableViewState="false">
                                                            <asp:ListItem>--Pilih--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:HiddenField ID="TXTIDKONSUMEN" runat="server" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="TXTKONSUMEN" EventName="SelectedIndexChanged" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                                <asp:Label ID="LBINFOKONSUMEN" runat="server" Style="color: #dc3545"></asp:Label>
                                            </div>

                                            <!-- /.form-group -->

                                            <!-- /.form-group -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tanggal</label>
                                                <asp:TextBox ID="TXTTGLPENERIMAAN" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span id="LbTGLPENERIMAAN" class="help-block" style="color: #dc3545"></span>
                                            </div>
                                            <div class="form-group">
                                                <label>Total Harga</label>
                                                <asp:Label ID="TXTTOTALHARGABELI" runat="server" Text="0" CssClass="form-control"></asp:Label>
                                                <asp:TextBox ID="TXTTOTALBAYAR" runat="server" Visible="false" CssClass="form-control"></asp:TextBox>
                                                <span id="LBTOTALBAYAR" class="help"></span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Keterangan</label>
                                                <asp:TextBox ID="TXTKETERANGAN" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.card-body -->
                                <div class="card-footer">
                                    <asp:Label ID="lblText" runat="server"></asp:Label>
                                    <asp:LinkButton ID="BTSIMPAN" runat="server" CssClass="btn btn-primary has-spinners" OnClientClick="return getCalculationGrid(this); {return false;};"><i class="fa fa-download"></i> Simpan</asp:LinkButton>
                                    <asp:LinkButton ID="BTBATAL" runat="server" CssClass="btn btn-danger"><i class="fa fa-minus-circle"></i> Batal</asp:LinkButton>
                                    <asp:HiddenField ID="TXTID" runat="server" />
                                    <asp:HiddenField ID="TXTIDFAKTUR" runat="server" />
                                </div>
                            </div>
                        </div>
                    </section>
                </asp:Panel>
            </div>

            <div class="modal fade" id="divBarang" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="H2">Pilih Barang</h4>
                        </div>
                        <div class="modal-body">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="table-responsive">
                                        <asp:GridView ID="GVBARANG" runat="server" CssClass="table table-bordered table-striped table-hover js-basic-example dataTable" AutoGenerateColumns="False" EnableSortingAndPagingCallbacks="false"
                                            DataKeyNames="KODE_PENERIMAAN" OnRowDataBound="GVBARANG_RowDataBound" Font-Size="X-Small" GridLines="Both" AllowPaging="True" OnPageIndexChanging="GVBARANG_PageIndexChanging" PageSize="5" PagerStyle-CssClass="pagination-ys">
                                            <Columns>
                                                <asp:TemplateField HeaderText="NO.">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="myRow" HeaderStyle-CssClass="myRow">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                                        <asp:HiddenField ID="hfKODE_BARANG" runat="server" Value='<%# Eval("KODE_PENERIMAAN")%>' />
                                                        <asp:HiddenField ID="HFIDBARANG" runat="server" Value='<%# Eval("KODE_PENERIMAAN")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>GAMBAR</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Image ID="LbFilePath" runat="server" ImageUrl='<%# Eval("GAMBAR_FILEPATH") & Eval("GAMBAR_FILENAME")%>' Height="50px" Width="40px"></asp:Image>
                                                        <asp:Image ID="LbFilePath2" runat="server" Visible="false" ImageUrl="~/dist/img/No_Image-128.png" Height="50px" Width="40px"></asp:Image>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="NAMA_BARANG" HeaderText="NAMA_BARANG" ReadOnly="True" />
                                                <asp:BoundField DataField="HARGA_JUAL" HeaderText="HARGA_JUAL" ReadOnly="true" />
                                                <asp:BoundField DataField="UKURAN" HeaderText="UKURAN" ReadOnly="true" />
                                                <asp:BoundField DataField="KATEGORI_BARANG" HeaderText="KATEGORI_BARANG" ReadOnly="true" />
                                                <asp:BoundField DataField="BARCODE_ID" HeaderText="BARCODE_ID" ReadOnly="true" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="GVBARANG" EventName="PageIndexChanging" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="pull-left">
                                <asp:Label ID="TXTTOTALSPAREPART" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="btCheck" class="btn btn-success">Masukkan</button>
                            <button type="button" id="btDismissSparepart" class="btn btn-default" data-dismiss="modal">KELUAR</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modal-info-barang">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <%--    <div class="overlay d-flex justify-content-center align-items-center">
                            <i class="fas fa-2x fa-sync fa-spin"></i>
                        </div>--%>
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi Barang</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card card-widget widget-user">
                                <!-- Add the bg color to the header using any of the bg-* classes -->
                                <div class="widget-user-header bg-info-active">
                                    <h3 class="widget-user-username" id="modal-nama-barang"></h3>
                                    <h5 class="widget-user-desc" id="modal-kategori-barang"></h5>
                                </div>
                                <div class="widget-user-image">
                                    <img class="img-circle elevation-2" style="height: 90px" id="modal-img-barang" src="../../dist/img/credit/boutique-logo.jpg" alt="Logo Barang">
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-sm-4 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header"><a id="modal-stokakhir-barang"></a></h5>
                                                <span class="description-text">Stok Akhir</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4 border-right">
                                            <div class="description-block">
                                                <h5 class="description-header"><a id="modal-hargabeli-barang"></a></h5>
                                                <span class="description-text">Harga Beli</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                        <div class="col-sm-4">
                                            <div class="description-block">
                                                <h5 class="description-header"><a id="modal-hargajual-barang"></a></h5>
                                                <span class="description-text">Harga Jual</span>
                                            </div>
                                            <!-- /.description-block -->
                                        </div>
                                        <!-- /.col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>

                            <div class="card card-primary card-outline">
                                <div class="card-body box-profile text-black-50">
                                    <div class="text-center">
                                    </div>
                                    <ul class="list-group list-group-unbordered mb-3 text-black-50">
                                        <li class="list-group-item">
                                            <b>Supplier</b> <a class="float-right text-black-50" id="modal-supplier-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Kasir</b> <a class="float-right text-black-50" id="modal-kasir-barang"></a>
                                        </li>
                                        <li class="list-group-item">
                                            <b>Tanggal Masuk</b> <a class="float-right text-black-50" id="modal-tgl-barang"></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>

            <div class="modal fade" id="modal-warning">
                <div class="modal-dialog">
                    <div class="modal-content bg-warning">
                        <div class="modal-header">
                            <h4 class="modal-title">Informasi</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p id="modal-text-info">&hellip;</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Keluar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
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

        <script>
            function Comma(Num) {      //function to insert comma for two textboxes
                Num += '';
                Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                Num = Num.replace(',', ''); Num = Num.replace(',', ''); Num = Num.replace(',', '');
                x = Num.split('.');
                x1 = x[0];
                x2 = x.length > 1 ? '.' + x[1] : '';
                var rgx = /(\d+)(\d{3})/;
                while (rgx.test(x1))
                    x1 = x1.replace(rgx, '$1' + '.' + '$2');
                return x1 + x2;
            }
        </script>

        <script>
            function getCalculationGrid(button) {
                var btn = $(button);
                var isValid = true;
                if ($('#TXTFAKTUR').val() == '') {
                    isValid = false;
                    $('#valfaktur').removeClass('form-group');
                    $('#valfaktur').addClass('form-group has-error');
                    $('#valfaktur').addClass('alert');
                    $('#valfaktur').addClass('alert-danger');
                    $("[id*=TXTFAKTUR]").focus();
                    $("[id*=LBINFOFAKTUR]").text("Nomor Faktur jangan dibiarkan kosong!");
                    $("[id*=LBINFOFAKTUR]").css("color", "red");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Nomor Faktur jangan dibiarkan kosong!');
                    return false;
                } else if ($('#TXTTGLPENERIMAAN').val() == '') {
                    isValid = false;
                    $('#valtanggal').removeClass('form-group');
                    $('#valtanggal').addClass('form-group has-error');
                    $('#valtanggal').addClass('alert');
                    $('#valtanggal').addClass('alert-danger');
                    $("[id*=LbTGLPENERIMAAN]").text("Silahkan masukkan Tanggal Penerimaan terlebih dahulu!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Tanggal Penerimaan terlebih dahulu!');
                    return false;
                } else if ($('#TXTTOTALBAYAR').val() == '') {
                    isValid = false;
                    $('#valtotalbayar').removeClass('form-group');
                    $('#valtotalbayar').addClass('form-group has-error');
                    $('#valtotalbayar').addClass('alert');
                    $('#valtotalbayar').addClass('alert-danger');
                    $("[id*=TXTTOTALBAYAR]").focus();
                    $("[id*=LBTOTALBAYAR]").text("Silahkan masukkan Total Pembayaran terlebih dahulu!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan Total Pembayaran terlebih dahulu!');
                    return false;
                } else if ($('#TXTKONSUMEN').val() == '--Pilih--') {
                    isValid = false;
                    $("[id*=TXTKONSUMEN]").focus();
                    $("[id*=LBINFOKONSUMEN]").text("Silahkan pilih Supplier!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan pilih Supplier!');
                    return false;
                } else if ($("[id*=LBINFOFAKTUR]").text() != '') {
                    isValid = false;
                    $("[id*=TXTFAKTUR]").focus();
                    $("[id*=LBINFOFAKTUR]").text("Nomor Faktur/Invoice sudah terdaftar!");
                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Silahkan masukkan nomor faktur/invoice yang lain!');
                    return false;
                } else {
                    $('#Button1').click();
                    return false;
                }
            };
        </script>

        <script type="text/javascript">
            $(function () {
                //$("#TXTTGLPENERIMAAN").datepicker();
                $("#TXTTGLPENERIMAAN").datepicker({
                    onSelect: function () {
                        $("[id*=LbTGLPENERIMAAN]").text(null);
                        $("#TXTTGLPENERIMAAN").datepicker("option", "dateFormat", "dd/mm/yy");
                        return false;
                    }
                });

                $("#TXTTGLPENERIMAAN").on("change", function () {
                    $("#TXTTGLPENERIMAAN").datepicker("option", "dateFormat", "dd/mm/yy");
                });
                //$("#TXTTGLPENERIMAAN").datepicker("option", "dateFormat", "dd/mm/yy");

                $("body").on("click", "[id*=Gridview1] [id*=BTDELETESPAREPART]", function () {
                    //$("[id*=Gridview1] [id*=BTDELETESPAREPART]").click(function () {
                    $(this).closest("tr").remove();
                    return false;
                });

                $("#TXTKONSUMEN").change(function () {
                    $("#LBINFOKONSUMEN").text("");
                });

                var inputfaktur = false;
                $("#TXTFAKTUR").keyup(function () {
                    var faktur = $(this);
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/kasir/input/Penjualan.aspx/GET_FAKTUR")%>',
                        data: JSON.stringify({ "INVOICE_PENERIMAAN": faktur.val() }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            if (result.d.length > 0) {
                                alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>No Faktur/Invoice yang Anda masukkan sudah ada, Anda tidak dapat menyimpan nomor Faktur/Invoice yang sama!');
                                $("[id*=LBINFOFAKTUR]").text("Nomor Faktur/Invoice sudah terdaftar!");
                                inputfaktur = true;
                            } else {
                                $("[id*=LBINFOFAKTUR]").text(null);
                                inputfaktur = false;
                            }
                        },
                        error: function (err, result) { alert(err.responseText); }
                    });
                });

                $("body").on("click", "[id*=Gridview1] [id*=LBDETAILQTY]", function () {
                    var stokBaru = $(this).closest("td").find("[id*=TXTQTY]").val();
                    var kalkulasiStok = parseFloat(stokBaru) + parseFloat(stokLama);

                    $('#TXTDETAILSPAREPART').text(namaSparepart);
                    $('#TXTDETAILSTOKLAMA').text(stokLama);
                    $('#TXTDETAILSTOKTAMBAH').text(stokBaru);
                    $('#TXTDETAILSTOKTOTAL').text(kalkulasiStok);
                    $('#TXTDETAILBELISTD').text(beliSTD);
                    $('#TXTDETAILBELIGOLD').text(beliGold);
                    $('#TXTDETAILBELIGOLDHD').text(beliGoldHD);

                    $('#TXTDETAILJUALSTD').text(jualSTD);
                    $('#TXTDETAILJUALGOLD').text(jualGold);
                    $('#TXTDETAILJUALGOLDHD').text(jualGoldHD);

                    $('#myModal').modal('show');
                    return false;
                });

                $("body").on("click", "[id*=Gridview1] [id*=LNKNAMABARANG]", function () {
                    var kodebrg = $(this).closest("tr").find("[id*=TXTKDBARANG]").text();
                    var brg = $(this).text();

                    $('#modal-img-barang').attr('src', '../../dist/img/No_Image-128.png');
                    $('#modal-nama-barang').text(null);
                    $('#modal-stokakhir-barang').text(null);
                    $('#modal-hargabeli-barang').text(null);
                    $('#modal-hrgjual-barang').text(null);
                    $('#modal-kategori-barang').text(null);
                    $('#modal-supplier-barang').text(null);
                    $('#modal-kasir-barang').text(null);
                    $('#modal-tgl-barang').text(null);

                    $.ajax({
                        type: "POST",
                        url: "Penjualan.aspx/GET_DETAIL_BARANG",
                        data: '{KDBARANG: "' + kodebrg + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        error: OnErrorOrFailure,
                        failure: OnErrorOrFailure,
                        success: function (data) {
                            if (data.d.length > 0) {

                                $('#modal-info-barang').modal('show');

                                //if (!$.trim(data.d[0].split('-')[11])) {
                                //    $('#modal-img-barang').attr('src', '../../dist/img/No_Image-128.png');
                                //}
                                //else {
                                $('#modal-img-barang').attr('src', data.d[0].split('-')[11].replace("~", "../..") + data.d[0].split('-')[10]);
                                //}

                                $('#modal-nama-barang').text(data.d[0].split('-')[2]);
                                //$('#modal-kode-barang').text(data.d[0].split('-')[2]);
                                $('#modal-stokakhir-barang').text(data.d[0].split('-')[3]);
                                $('#modal-hargabeli-barang').text('Rp.' + data.d[0].split('-')[4]);
                                $('#modal-hargajual-barang').text('Rp.' + data.d[0].split('-')[9]);
                                $('#modal-kategori-barang').text(data.d[0].split('-')[5]);
                                $('#modal-supplier-barang').text(data.d[0].split('-')[6]);
                                $('#modal-kasir-barang').text(data.d[0].split('-')[7]);
                                $('#modal-tgl-barang').text(data.d[0].split('-')[8]);

                            } else {
                                $('#modal-warning').modal('show');
                                $('#modal-text-info').text(brg + " belum dimasukkan dalam daftar penerimaan barang")
                                //alert(brg + " belum dimasukkan dalam daftar penerimaan barang");
                            }
                        }
                    });
                    function OnErrorOrFailure(response) {
                        alert(response.responseText);
                    }
                    return false;
                });

                $('body').on('click', '.clsdeleteSparepart', function () {
                    alert($(this).attr('id'));
                });

                $('body').on('click', '.clsshowSparepart', function () {
                    //alert($(this).closest("tr").find('td').eq(0).text());
                    $('#HFIDXSPAREPART').val(parseInt($(this).closest("tr").find('td').eq(0).text()));
                });

                $('body').on('click', '[id*=Button1]', function () {
                    var arrInputKdBarang = [];

                    $("#Gridview1").find("[id*=HF_ID_BARANG]").each(function () {
                        arrInputKdBarang.push($(this).val());
                    });
                    var explodedKdBarang = $.map(arrInputKdBarang, function (KdBarangName, KdBarangIndex) {
                        return ([KdBarangName]);
                    });

                    var arrInputNamaBarang = [];
                    $("#Gridview1").find("[id*=LNKNAMABARANG]").each(function () {
                        arrInputNamaBarang.push($(this).text());
                    });
                    var explodedNamaBarang = $.map(arrInputNamaBarang, function (NamaBarangName, NamaBarangIndex) {
                        return ([NamaBarangName]);
                    });

                    var arrInputStokAkhir = [];
                    $("#Gridview1").find(".StokAkhir").each(function () {
                        arrInputStokAkhir.push($(this).text());
                    });
                    var explodedStokAkhir = $.map(arrInputStokAkhir, function (StokAkhirName, StokAkhirIndex) {
                        return ([StokAkhirName]);
                    });

                    var arrInputJUMBELI = [];
                    $("#Gridview1").find(".InputJUMBELI").each(function () {
                        arrInputJUMBELI.push($(this).val());
                    });
                    var explodedJUMBELI = $.map(arrInputJUMBELI, function (JUMBELIName, JUMBELIIndex) {
                        return ([JUMBELIName]);
                    });
                    //alert(explodedJUMBELI)

                    var arrInputHARGABELI = [];
                    $("#Gridview1").find(".InputHARGABELI").each(function () {
                        arrInputHARGABELI.push($(this).val());
                    });
                    var explodedHARGABELI = $.map(arrInputHARGABELI, function (HARGABELIName, HARGABELIIndex) {
                        return ([HARGABELIName]);
                    });

                    getInsertFromAjax();

                    function getInsertFromAjax() {
                        var TXTFAKTUR = $("[id*=TXTFAKTUR]");
                        var TXTTGLPENERIMAAN = $("[id*=TXTTGLPENERIMAAN]");
                        var TXTTOTALHARGABELI = $("[id*=TXTTOTALHARGABELI]");
                        var TXTIDKONSUMEN = $("[id*=TXTIDKONSUMEN]");
                        var TXTKETERANGAN = $("[id*=TXTKETERANGAN]");
                        var message = "";

                        var x = $('#Gridview1 tbody .count');
                        var i;
                        var cnt = 0 - 1;
                        var alerted = false;
                        for (i = 0; i < parseInt(x.length); i++) {
                            (function (index) {
                                cnt++;
                                //alert(explodedKdBarang[cnt]);
                                $.ajax({
                                    type: "POST",
                                    url: "Penjualan.aspx/GET_INSERT_DATA",
                                    data: '{KODE_PENERIMAAN: "' + explodedKdBarang[cnt] +
                                        '", INVOICE_PENJUALAN: "' + TXTFAKTUR.val() +
                                        '", KODE_KONSUMEN: "' + TXTIDKONSUMEN.val() +
                                        '", TANGGAL_PENJUALAN: "' + TXTTGLPENERIMAAN.val() +
                                        '", JUMLAH_BELI: "' + explodedJUMBELI[cnt] +
                                        '", TOTAL_BAYAR: "' + TXTTOTALHARGABELI.text() +
                                        '", KETERANGAN: "' + TXTKETERANGAN.val() + '" }',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    error: OnErrorOrFailure,
                                    failure: OnErrorOrFailure,
                                    beforeSend: function (jqXHR, options) {
                                        setTimeout(function () {
                                            $.ajax($.extend(options, { beforeSend: $.noop }));
                                        }, 5000);
                                        //$(".modals").fadeIn("slow");
                                        $("[id*=BTSIMPAN]").buttonLoader('start');
                                        return false;
                                    },
                                    success: function (response) {
                                        //$(".modals").fadeOut("slow");
                                        $("[id*=BTSIMPAN]").buttonLoader('stop');
                                        if (!alerted) {
                                            alerted = true;
                                            alertify.set({ delay: 30000 });
                                            alertify.success('<img id="Image2" src="../../dist/img/accept-icon.png" style="height:30px;width:30px;" /><strong> Informasi!</strong> </br>Data berhasil diupdate.');
                                        }

                                        //$('html, body').animate({
                                        //    scrollTop: parseInt($("#BTINSERTDATATABLE").offset().top)
                                        //}, 1000);
                                        message += explodedNamaBarang;
                                        GET_SUCCESS_SAVE(message);
                                        return false;
                                    }
                                });
                                function OnErrorOrFailure(response) {
                                    alert(response.responseText);
                                    $("[id*=BTSIMPAN]").buttonLoader('stop');
                                }
                                function OnBeforeSend(response) {
                                    $(".modals").fadeIn("slow");
                                }
                                return false;
                            })(i);
                        }
                    }
                    return false;
                });

                function GET_SUCCESS_SAVE(KDBARANG) {
                    return window.location.href = '../message/success.aspx?PreviousPage=Penerimaan.aspx&nama_barang=' + KDBARANG;
                }

                $("body").on("click", "[id*=ButtonAdd]", function (e) {
                    var row = $(this).closest("tr");
                    var validateCountDefault = row.find(".has-error");
                    var spanSparepart = row.find(".InputSparepart");
                    var thisInput = row.find("input[type=text]");
                    var thisFormGroup; //= row.find(".form-group");
                    var thisSpan; //= row.find(".help-block");
                    if (validateCountDefault.length > 0) {
                        alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Masih ada ' + validateCountDefault.length + ' lagi yang masih kosong, harap diisi!!!.');
                        if ($(thisInput).val() === '') {
                            row.find(".has-error").each(function () {
                                thisFormGroup = $(this);
                                $(thisFormGroup).removeClass('form-group');
                                $(thisFormGroup).addClass('form-group has-error');
                                thisFormGroup.find(".spanDefault").each(function () {
                                    thisSpan = $(this);
                                    $(thisSpan).text('Field masih kosong!!!');

                                    $('#Panel1').fadeOut(2000);
                                    //return false;
                                });
                            });
                        }
                    } else if (validateCountDefault.length == 0) {
                        //var gridview1 = '[id*=Gridview1]';
                        e.preventDefault();
                        var rowCount = $('#Gridview1 tbody .count').length;
                        var contactdiv = '<tr class="data-class_' + rowCount + '">' +
                            '<td class="count">' + parseInt(rowCount + 1) + '</td>' +
                            '<td><a href="#" id="Gridview1_BTSHOWSPAREPART_' + rowCount + '" style="font-size: x-large" data-toggle="modal" data-target="#divBarang"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>&nbsp;<a href="#" id="Gridview1_BTDELETESPAREPART_' + rowCount + '" style="font-size: x-large"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>' +
                            '<td><div id="Gridview1_valKdBarang_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><span id="Gridview1_TXTKDBARANG_' + rowCount + '" class="InputKdBarang" style="font-size:Small;"></span><span id="LBINFOKDBARANG" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td id="tdvalNamaBarang"><div id="Gridview1_valNamaBarang_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><a id="Gridview1_LNKNAMABARANG_' + rowCount + '" class="InputBarang" href="javascript:__doPostBack("Gridview1$ctl0' + rowCount + '$LNKNAMABARANG","")" style="font-size:Small;"></a><span id="Gridview1_TXTNAMABARANG_0" style="font-size:Small;"></span><span id="LBINFONAMABARANG' + rowCount + '" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valQty_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><span id="Gridview1_TXTSTOKAKHIR_' + rowCount + '" class="StokAkhir" style="font-size:Small;"></span><span id="LBINFOQty" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valJumBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTJUMBELI' + rowCount + '" type="text" id="Gridview1_TXTJUMBELI_' + rowCount + '" class="form-control InputJUMBELI" style="font-size:Small;" /><span id="LBINFOJUMBELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valHargaBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTHARGABELI' + rowCount + '" type="text" id="Gridview1_TXTHARGABELI_' + rowCount + '" class="form-control InputHARGABELI" style="font-size:Small;" /><span id="LBINFOHARGABELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '</tr>';
                        $('#Gridview1').append(contactdiv);
                        $('#HFIDXSPAREPART').val(parseInt(rowCount));
                        return false;
                    }
                });

                $("body").on("click", "[id*=BTINSERTDATATABLE]", function (e) {
                    var validateCountDefault = $(".validate").find(".default");
                    var validateCountDanger = $(".validate").find(".has-error");

                    var thisFormGroup;
                    var thisSpan;
                    if (validateCountDanger.length > 0) {

                        alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Masih ada ' + validateCountDanger.length + ' lagi yang masih kosong, harap diisi!!!.');
                        $(".validate").find(".has-error").each(function () {
                            thisFormGroup = $(this);
                            $(thisFormGroup).removeClass('form-group');
                            $(thisFormGroup).addClass('form-group has-error');
                            $(".validate").find(".has-error").find(".spanDefault").each(function () {
                                thisSpan = $(this);
                                $(thisSpan).text('Field masih kosong!!!');

                                $('#Panel1').fadeOut(2000);
                                //return false;
                            });
                        });

                        return false;
                    } else if (validateCountDanger.length == 0) {
                        var totals = 0;
                        $("#Gridview1 tr").each(function () {
                            var hrgbeli = $(this).find(".InputSubTotal").text();
                            if (hrgbeli != '') {
                                totals += parseFloat(hrgbeli);
                                return;
                            }
                        });
                        $("[id*=TXTTOTALHARGABELI]").text("Rp." + Comma(totals));
                        $("#Gridview1").find("input").attr("disabled", "disabled");
                        e.preventDefault();
                        $("#Gridview1").find("[id*=BTSHOWSPAREPART]").css("pointer-events", "none").css('cursor', 'default');
                        $("#Gridview1").find("[id*=BTDELETESPAREPART]").css("pointer-events", "none").css('cursor', 'default');

                        $('#Panel1').fadeIn(2000);
                        $('#TXTFAKTUR').focus();
                        $('html, body').animate({
                            scrollTop: parseInt($("#Panel1").offset().top)
                        }, 2000);
                        return false;
                    }
                    return false;
                });

                $("body").on("change", "[id*=Gridview1] .InputSparepart", function () {
                    alert('calculated value');
                });

                var kdbarang = [];
                var namabarang = [];
                var idbarang = [];
                $("body").on("click", "[id*=btCheck]", function () {
                    var message = "";
                    var HFKODE_SPAREPART = "";
                    var HFIDBARANG = "";
                    var countchecked = $("[id*=GVBARANG] input[type=checkbox]:checked").length;

                    kdbarang.length = 0;
                    namabarang.length = 0;
                    idbarang.length = 0;

                    $("[id*=GVBARANG] input[type=checkbox]:checked").each(function () {
                        var row = $(this).closest("tr")[0];
                        var rowChecked = $(this).closest("tr");
                        HFKODE_SPAREPART = rowChecked.find("[id*=hfKODE_BARANG]").val();
                        HFIDBARANG = rowChecked.find("[id*=HFIDBARANG]").val();
                        message += row.cells[4].innerHTML;
                        message += "\n";

                        if ($(this).is(':checked')) {
                            kdbarang.push(HFKODE_SPAREPART);
                            namabarang.push(row.cells[3].innerHTML);
                            idbarang.push(HFIDBARANG);
                        }
                    });

                    var totals = 0;

                    for (var rowCount = 0; rowCount < countchecked; rowCount++) {                             //var rowCount = countchecked;
                        var contactdiv = '<tr class="data-class_' + rowCount + '">' +
                            '<td class="count">' + parseInt(rowCount + 1) + '</td>' +
                            '<td><a href="#" id="Gridview1_BTSHOWSPAREPART_' + rowCount + '" style="font-size: x-large" data-toggle="modal" data-target="#divBarang"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>&nbsp;<a href="#" id="Gridview1_BTDELETESPAREPART_' + rowCount + '" style="font-size: x-large"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>' +
                            '<td><div id="Gridview1_valKdBarang_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTKDBARANG_' + rowCount + '" class="InputKdBarang" style="font-size:Small;">' + kdbarang[rowCount] + '</span><input name="Gridview1$ctl02$HF_ID_BARANG' + rowCount + '" type="hidden" id="Gridview1_HF_ID_BARANG_' + rowCount + '" value="' + idbarang[rowCount] + '" class="inputIDBarang" /><span id="LBINFOKDBARANG" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td id="tdvalNamaBarang"><div id="Gridview1_valNamaBarang_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><a id="Gridview1_LNKNAMABARANG_' + rowCount + '" class="InputBarang" href="javascript:__doPostBack("Gridview1$ctl0' + rowCount + '$LNKNAMABARANG","")" style="font-size:Small;">' + namabarang[rowCount] + '</a><span id="Gridview1_TXTNAMABARANG_0" style="font-size:Small;"></span><span id="LBINFONAMABARANG' + rowCount + '" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valQty_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTSTOKAKHIR_' + rowCount + '" class="StokAkhir" style="font-size:Small;">' + GET_STOK_BARANG(kdbarang[rowCount]) + '</span><span id="LBINFOQty" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valJumBeli_' + rowCount + '" class="form-group default has-error"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTJUMBELI' + rowCount + '" type="text" id="Gridview1_TXTJUMBELI_' + rowCount + '" class="form-control InputJUMBELI" style="font-size:Small;" /><span id="LBINFOJUMBELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valHargaBeli_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><input name="Gridview1$ctl02$TXTHARGABELI' + rowCount + '" type="text" id="Gridview1_TXTHARGABELI_' + rowCount + '" class="form-control InputHARGABELI" value="' + GET_HARGA_JUAL(kdbarang[rowCount]) + '" style="font-size:Small;" /><span id="LBINFOHARGABELI" style="font-size:x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '<td><div id="Gridview1_valSubTotal_' + rowCount + '" class="form-group default has-success"><div class="col-sm-10"><span id="Gridview1_TXTSUBTOTAL_' + rowCount + '" class="InputSubTotal" style="font-size:Small;"></span><span id="LBINFOSUBTOTAL" style="font-size: x-small" class="help-block spanDefault"></span></div></div></td>' +
                            '</tr>';
                        $('#Gridview1').append(contactdiv);
                        $('#HFIDXSPAREPART').val(parseInt(rowCount));

                        $('#divBarang').modal('toggle');
                        $("[id*=LBINFONAMABARANG]").text('');
                        $("[id*=LBINFOKDBARANG]").text('');
                        $("[id*=LBINFOQty]").text('');

                        totals += parseFloat(GET_HARGA_JUAL(kdbarang[rowCount]));
                        $("[id*=TXTTOTALHARGABELI]").text('Rp. ' + Comma(totals));
                        $("[id*=ButtonCancel]").css("visibility", "visible");
                    }

                    $("#Gridview1 tr td").each(function () {
                        var rowChecked = $(this).closest("tr");
                        if (rowChecked.find("[id*=TXTKDBARANG]").text() == "") {
                            $(this).remove();
                        }
                    });

                    var seen = {};
                    $('#Gridview1 .InputKdBarang').each(function () {
                        var txt = $(this).text(); //$("td:first-child", $(this)).text();
                        if (seen[txt]) $(this).parents("tr").remove();
                        else seen[txt] = true;
                    });

                    return false;
                });

                function GET_STOK_BARANG(KDBARANG) {
                    var kdBuku;
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/kasir/input/Penjualan.aspx/GET_STOCK")%>',
                        data: JSON.stringify({ "KDBARANG": KDBARANG }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            var stoks = result.d;

                            if (!$.trim(result.d)) {
                                kdBuku = 0;
                            }
                            else {
                                $.each(stoks, function (index, stok) {
                                    kdBuku = result.d;
                                });
                            }


                        },
                        error: function (err, result) { alert(err.responseText); }
                    });

                    return kdBuku;
                }

                function GET_HARGA_JUAL(KDBARANG) {
                    var kdBuku;
                    $.ajax({
                        type: "POST",
                        url: '<%=ResolveUrl("~/kasir/input/Penjualan.aspx/GET_HARGA_JUAL")%>',
                        data: JSON.stringify({ "KDBARANG": KDBARANG }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        success: function (result) {
                            var stoks = result.d;

                            if (!$.trim(result.d)) {
                                kdBuku = 0;
                            }
                            else {
                                $.each(stoks, function (index, stok) {
                                    kdBuku = result.d;
                                });
                            }
                        },
                        error: function (err, result) { alert(err.responseText); }
                    });

                    return kdBuku;
                }

                function uniqueArray(list) {
                    var result = [];
                    $.each(list, function (i, e) {
                        if ($.inArray(e, result) == -1) result.push(e);
                    });
                    return result;
                }

                $("body").on("keyup", "[id*=Gridview1] [id*=TXTJUMBELI]", function () {
                    var stok = GET_STOK_BARANG($(this).closest("tr").find("[id*=TXTKDBARANG]").text());
                    var kurangiStok = $(this);
                    var subtotal = $(this).closest("tr").find("[id*=TXTSUBTOTAL]").text();
                    var x = document.getElementById('<%=Me.Gridview1.ClientID%>').querySelectorAll('input[type="hidden"]');
                    var i;
                    var cnt = 0 - 1;
                    var totals = 0;

                    for (i = 0; i < x.length; i++) {

                        cnt++;
                        if (!jQuery.trim($(kurangiStok).val()) == '') {
                            if (!isNaN(parseFloat($(kurangiStok).val()))) {
                                var hasil = parseFloat(stok) - parseFloat(kurangiStok.val());

                                if (hasil < 0) {
                                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Stok akhir tidak boleh minus!');
                                    kurangiStok.val(0);
                                };

                                var row = $(kurangiStok).closest("tr");
                                var total = parseFloat($("[id*=TXTHARGABELI]", row).val()) * parseFloat(kurangiStok.val());
                                $("[id*=TXTSTOKAKHIR]", row).text(hasil);
                                $("[id*=TXTSUBTOTAL]", row).text(total);

                                totals += parseFloat($("[id*=TXTHARGABELI]", row).val());
                                $("[id*=TXTTOTALHARGABELI]").text('Rp.' + Comma(totals));
                            }
                        } else {
                            $(kurangiStok).val('0');
                        }

                        $("[id*=TXTJUMBELI]").keydown(function (e) {
                            var keyCode = e.which;
                            if (keyCode != 8 && keyCode != 9 && keyCode != 13 && keyCode != 37 && keyCode != 38 && keyCode != 39
                                && keyCode != 40 && keyCode != 46 && keyCode != 110 && keyCode != 190) {
                                if (keyCode < 48) {
                                    e.preventDefault();
                                }
                                else if (keyCode > 57 && keyCode < 96) {
                                    e.preventDefault();
                                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Harap Harga Beli diisi dengan angka!');
                                }
                                else if (keyCode > 105) {
                                    e.preventDefault();
                                }
                            }

                        });
                    };
                });

                $("body").on("keyup", "[id*=Gridview1] [id*=TXTHARGABELI]", function () {
                    var stok = GET_STOK_BARANG($(this).closest("tr").find("[id*=TXTKDBARANG]").text());
                    var kurangiStok = $(this);

                    var x = document.getElementById('<%=Me.Gridview1.ClientID%>').querySelectorAll('input[type="hidden"]');
                    var i;
                    var cnt = 0 - 1;
                    var totals = 0;

                    for (i = 0; i < x.length; i++) {

                        //if (x[i].type == "checkbox" && x[i].checked)
                        cnt++;
                        if (!jQuery.trim($(kurangiStok).val()) == '') {
                            if (!isNaN(parseFloat($(kurangiStok).val()))) {
                                $('#myhiddenField').val('');
                                var row = $(kurangiStok).closest("tr");

                                var total = parseFloat($("[id*=TXTJUMBELI]", row).val()) * parseFloat(kurangiStok.val());
                                $("[id*=TXTSUBTOTAL]", row).text(total);

                                totals += parseFloat(kurangiStok.val());
                                $("[id*=TXTTOTALHARGABELI]").text('Rp.' + Comma(totals));
                            }
                        } else {
                            $(kurangiStok).val('0');
                        }

                        $("[id*=TXTHARGABELI]").keydown(function (e) {
                            var keyCode = e.which;
                            if (keyCode != 8 && keyCode != 9 && keyCode != 13 && keyCode != 37 && keyCode != 38 && keyCode != 39
                                && keyCode != 40 && keyCode != 46 && keyCode != 110 && keyCode != 190) {
                                if (keyCode < 48) {
                                    e.preventDefault();
                                }
                                else if (keyCode > 57 && keyCode < 96) {
                                    e.preventDefault();
                                    alertify.error('<img id="Image2" src="../../dist/img/Action_Close_32x32.png" style="height:30px;width:30px;" /><strong> Error!</strong> </br>Harap Harga Beli diisi dengan angka!');
                                }
                                else if (keyCode > 105) {
                                    e.preventDefault();
                                }
                            }

                        });
                    };
                });

                $("#<%=UpdatePanel1.ClientID %>").on("click", "[id*=GVBARANG] [id*=DetailButton]", function (e) {
                    //$("[id*=GVBARANG] [id*=DetailButton]").click(function () {
                    var row = $(this).closest("tr");
                    e.preventDefault();
                    $(this).css("pointer-events", "none").css('cursor', 'default');
                    var HFKODE_SPAREPART = row.find("[id*=hfKODE_BARANG]").val();
                    var BARANG = row.find('td').eq(3).text();
                    var LNKNAMABARANG = row.find('td').eq(5).text();

                    $('#Gridview1_TXTKDBARANG_' + parseInt($('#HFIDXSPAREPART').val())).text(HFKODE_SPAREPART); //+ '-' + KOMPONEN + '-' + SPAREPART);
                    $('#Gridview1_LNKNAMABARANG_' + parseInt($('#HFIDXSPAREPART').val())).text(BARANG);
                    $('#Gridview1_valNamaBarang_' + parseInt($('#HFIDXSPAREPART').val())).removeClass("has-error").addClass("form-group has-success");
                    $('#Gridview1_valKdBarang_' + parseInt($('#HFIDXSPAREPART').val())).removeClass("has-error").addClass("form-group has-success");
                    $('#Gridview1_valJumBeli_' + parseInt($('#HFIDXSPAREPART').val())).addClass("has-error");
                    $('#Gridview1_valHargaBeli_' + parseInt($('#HFIDXSPAREPART').val())).removeClass("form-group has-success").addClass("form-group has-error");
                    //$("#divBarang").modal('hide');

                    $('#divBarang').modal('toggle');
                    $("[id*=LBINFONAMABARANG]").text('');
                    $("[id*=LBINFOKDBARANG]").text('');
                    $("[id*=LBINFOQty]").text('');
                    return false;
                });

                $('body').on('click', '#BTDISMISSALERTWARNING', function () {
                    $("#divAlertWarning").fadeOut("slow");
                    $("#BTSHOWINFO").css("visibility", "visible");
                    $("#BTSHOWINFO").fadeIn("slow");
                    return false;
                });

                $('body').on('click', '#BTDONTSHOWAGAIN', function () {
                    alerted = true;
                    alertedNewData = true;
                    $("#divAlertWarning").fadeOut("slow");
                    $("#BTSHOWINFO").css("visibility", "visible");
                    $("#BTSHOWINFO").fadeIn("slow");
                    return false;
                });

                $('body').on('click', '#BTSHOWINFO', function () {
                    alerted = true;
                    alertedNewData = true;
                    $('#divAlertWarning').fadeIn(4000);
                    $(this).css("visibility", "hidden");
                    return false;
                });

                $('#TXTTOTALBAYAR').on('keydown', function (e) {
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                        (e.keyCode == 65 && e.ctrlKey === true) ||
                        (e.keyCode >= 35 && e.keyCode <= 39)) {
                        return;
                    }

                    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                        e.preventDefault();
                        $("[id*=LBTOTALBAYAR]").text('Harap diisi dengan angka!!!');
                        $('#valtotalbayar').removeClass('form-group');
                        $('#valtotalbayar').addClass('form-group has-error');
                        $('#valtotalbayar').addClass('alert');
                        $('#valtotalbayar').addClass('alert-danger');
                    } else {
                        $("[id*=LBTOTALBAYAR]").text('Yap, ini sudah angka.');
                        $('#valtotalbayar').removeClass('form-group has-error');
                        $('#valtotalbayar').addClass('form-group has-success');
                        $('#valtotalbayar').removeClass('alert-danger');
                        $('#valtotalbayar').addClass('alert-success');
                    }
                });

                $("body").on("keyup", "[id*=Gridview1] input[type=text]", function () {
                    if (!this.value) {
                        $(this).closest("td").find(".help-block").text('Jangan biarkan kosong!!!');
                        $(this).closest("td").find(".form-group").removeClass("form-group").addClass("form-group has-error");
                    } else {
                        $(this).closest("td").find(".help-block").text('');
                        $(this).closest("td").find(".form-group").removeClass("form-group has-error").addClass("form-group has-success");
                    }
                });

                $("body").on("keydown", "[id*=Gridview1] input[type=text]", function (e) {
                    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                        (e.keyCode == 65 && e.ctrlKey === true) ||
                        (e.keyCode >= 35 && e.keyCode <= 39)) {
                        return;
                    }

                    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                        e.preventDefault();
                        $(this).closest("td").find(".help-block").text('Isi dengan angka!!!');
                        $(this).closest("td").find(".form-group").removeClass("form-group").addClass("form-group has-error");
                        $(this).closest("td").find(".help-block").addClass('help-block spanDefault');
                    } else {
                        $(this).closest("td").find(".help-block").text('');
                        $(this).closest("td").find(".form-group").removeClass("default form-group has-error").addClass("form-group has-success");
                        $(this).closest("td").find(".help-block").removeClass('help-block spanDefault').addClass('help-block');
                        //$(this).closest("tr").find("[id*=LBINFOJual_GoldHD]").addClass('help-block');
                    }
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

                $("body").on("click", "[id*=BTSUBMIT]", function () {
                    var btn = $(this);
                    $("#LBINFO").text('');
                    if ($("#TXTUSERNAME").val() == '' && $("#TXTPASSWORD").val() == '') {
                        $(".inputUser").removeClass('form-group');
                        $(".inputUser").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        $(".inputPassword").removeClass('form-group');
                        $(".inputPassword").addClass('form-group has-error');
                        return false;
                    } else if ($("#TXTUSERNAME").val() == '') {
                        $(".inputUser").removeClass('form-group');
                        $(".inputUser").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else if ($("#TXTPASSWORD").val() == '') {
                        $(".inputPassword").removeClass('form-group');
                        $(".inputPassword").addClass('form-group has-error');
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else {
                        $(btn).buttonLoader('start');
                        return true;
                    }
                    return false;
                });

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
