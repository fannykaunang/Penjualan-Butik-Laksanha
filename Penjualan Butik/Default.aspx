<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Home | Penjualan Butik</title>
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
</head>
<body class="hold-transition sidebar-mini">
    <form runat="server">
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
                        <a href="#" class="nav-link">Home</a>
                    </li>
                </ul>
            </nav>

            <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="../../index3.html" class="brand-link">
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
                            <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                            <li class="nav-item">
                                <a href="#" class="nav-link">
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
                                        <a href="kasir/input/Barang.aspx" class="nav-link">
                                            <i class="fas fa-cube nav-icon"></i>
                                            <p>Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/input/Kategori_Barang.aspx" class="nav-link">
                                            <i class="fas fa-align-center nav-icon"></i>
                                            <p>Kategori Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/input/Supplier.aspx" class="nav-link">
                                            <i class="fas fa-shuttle-van nav-icon"></i>
                                            <p>Supplier</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/input/Konsumen.aspx" class="nav-link">
                                            <i class="fas fa-chalkboard-teacher nav-icon"></i>
                                            <p>Konsumen</p>
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
                                        <a href="kasir/input/Penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-cloud-download-alt nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/input/Penjualan.aspx" class="nav-link">
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
                                        <a href="kasir/output/list-barang.aspx" class="nav-link">
                                            <i class="far fa-clipboard nav-icon"></i>
                                            <p>Daftar Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/output/kartu-stok-barang.aspx" class="nav-link">
                                            <i class="fas fa-poll-h nav-icon"></i>
                                            <p>Stok Barang</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/output/list-penerimaan.aspx" class="nav-link">
                                            <i class="fas fa-file-download nav-icon"></i>
                                            <p>Transaksi Penerimaan</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="kasir/output/list-penjualan.aspx" class="nav-link">
                                            <i class="fas fa-file-upload nav-icon"></i>
                                            <p>Transaksi Penjualan</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-header">AKUN</li>
                            <li class="nav-item">
                                <a href="account/User-Profile.aspx" class="nav-link">
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
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Dashboard</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-info">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="TXTPENJUALAN" runat="server"></asp:Label></h3>
                                        <p>Total Barang Terjual</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-bag"></i>
                                    </div>
                                    <a href="kasir/output/list-penjualan.aspx" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-success">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="TXTPENERIMAAN" runat="server"></asp:Label></h3>

                                        <p>Total Barang Masuk</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-stats-bars"></i>
                                    </div>
                                    <a href="kasir/output/list-penerimaan.aspx" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-warning">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="TXTKONSUMEN" runat="server"></asp:Label></h3>

                                        <p>Total Konsumen</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-person-add"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                            <div class="col-lg-3 col-6">
                                <!-- small box -->
                                <div class="small-box bg-danger">
                                    <div class="inner">
                                        <h3>
                                            <asp:Label ID="TXTPENDAPATANHARIINI" runat="server"></asp:Label></h3>

                                        <p>Pendapatan hari ini</p>
                                    </div>
                                    <div class="icon">
                                        <i class="ion ion-pie-graph"></i>
                                    </div>
                                    <a href="#" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                            <!-- ./col -->
                        </div>

                        <div class="row">
                            <!-- Left col -->
                            <section class="col-lg-12 connectedSortable ui-sortable">
                                <!-- Custom tabs (Charts with tabs)-->
                                <div class="card">
                                    <div class="card-header d-flex p-0 ui-sortable-handle" style="cursor: move;">
                                        <h3 class="card-title p-3">
                                            <i class="fas fa-chart-bar mr-1"></i>
                                            Transaksi
                                        </h3>

                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div id="cvcontainerDatangPulang" style="height: 600px; margin: 0 auto"></div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                            </section>
                        </div>

                        <div class="row">
                            <!-- Left col -->
                            <section class="col-lg-12 connectedSortable ui-sortable">
                                <!-- Custom tabs (Charts with tabs)-->
                                <div class="card">
                                    <div class="card-header d-flex p-0 ui-sortable-handle" style="cursor: move;">
                                        <h3 class="card-title p-3">
                                            <i class="fas fa-chart-line mr-1"></i>
                                            Terlaris
                                        </h3>

                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div id="container" style="height: 1000px; margin: 0 auto"></div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                            </section>
                        </div>
                    </div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->

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

        <script src="dist/js/HighCharts/highcharts.js"></script>
        <script src="dist/js/HighCharts/exporting.js"></script>
        <script src="dist/js/HighCharts/export-data.js"></script>

        <script type="text/javascript">
            window.onload = function () {
                //Loading();
                //getChartByMonth();
                //getPieChart();
                getPastYear();
                GetBarangTerlaris();

                function getPastYear() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/Default.aspx/GET_IN_OUT_GROUPBY_PERIODE")%>',
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {
                            Result = Result.d;

                            var series = [];
                            var categories = [];
                            var PERIODE = [];
                            var JUMLAHMASUK = [];
                            var JUMLAHKELUAR = [];

                            for (var i in Result) {
                                categories.push(Result[i].PERIODE);
                                JUMLAHMASUK.push(Result[i].JUMLAHMASUK);
                                JUMLAHKELUAR.push(Result[i].JUMLAHKELUAR);
                            }
                            series.push(
                                {
                                    name: 'Penerimaan',
                                    data: JUMLAHMASUK
                                },
                                {
                                    name: 'Penjualan',
                                    data: JUMLAHKELUAR
                                }
                            );
                            BindChartPastYear(categories, series);
                        },
                        error: function (xhr) {
                            alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
                        }
                    });
                }

                function BindChartPastYear(categories, series) {
                    Highcharts.chart('cvcontainerDatangPulang', {
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: 'Transaksi Dalam 1 Tahun',
                            x: -20,
                            style: {
                                fontSize: '1.5em'
                            }
                        },
                        subtitle: {
                            text: 'Grafik <b>Transaksi</b>',
                            x: -20
                        },
                        colors: ['#007bff', '#dc3545'],
                        xAxis: {
                            title: {
                                text: 'Bulan'
                            },
                            categories: categories,
                            labels: {
                                autoRotation: [-10, -20, -30, -40, -50, -60, -70, -80, -90]
                            }
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: null
                            },
                            labels: {
                                formatter: function () {
                                    return this.value;
                                }
                            }
                        },
                        legend: {
                            reversed: true,
                        },
                        tooltip: {
                            borderRadius: 2,
                            borderWidth: 1,
                            borderColor: '#999',
                            shadow: false,
                            shared: true,
                            useHTML: true,
                            yDecimals: 0,
                            formatter: function () {
                                var s = '<table><caption>' + this.x + '</caption>'
                                    + '<tbody>',
                                    sum = 0;

                                $.each(this.points, function (i, point) {
                                    s += '<tr><th style="color:' + point.color + '">\u25CF ' + point.series.name + ': </th>'
                                        + '<td style="text-align: right;color:' + point.color + '">' + point.y + '</td></tr>';
                                    sum += point.y;
                                });

                                s += '<tr><th>Total: </th>'
                                    + '<td style="text-align:right"><b>' + sum + '</b></td></tr>'
                                    + '</tbody></table>'

                                return s;
                            },
                            shared: true,
                        },
                        plotOptions: {
                            series: {
                                stacking: 'normal'
                            },
                            column: {
                                stacking: 'normal',
                                dataLabels: {
                                    enabled: true,
                                    color: ['#e0402b', '#007bff']
                                },
                            }
                        },
                        series: series
                    });
                }

                function GetBarangTerlaris() {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: '<%=ResolveUrl("~/Default.aspx/GET_BARANG_TERLARIS")%>',
                        data: "{}",
                        dataType: "json",
                        success: function (Result) {

                            Result = Result.d;

                            var series = [];
                            var categories = [];
                            var NAMA_BARANG = [];
                            var TOTAL = [];

                            for (var i in Result) {
                                categories.push(Result[i].NAMA_BARANG);
                                TOTAL.push(Result[i].TOTAL);
                            }
                            series.push(
                                {
                                    name: 'TOTAL',
                                    data: TOTAL
                                }
                            );

                            BindChart(categories, series);
                        },
                        error: function (xhr) {
                            alert('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);
                        }
                    });
                }

                function BindChart(categories, series) {
                    Highcharts.chart('container', {
                        chart: {
                            type: 'bar'
                        },
                        title: {
                            text: 'Grafik Barang Terlaris',
                            style: {
                                fontSize: '1.5em'
                            }
                        },
                        colors: ['#3942f9', '#45f938', '#f93737', '#a136f9', '#f99436', '#f9e836'],
                        xAxis: {
                            categories: categories,
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: 'Grafik Barang Terlaris'
                            }
                        },
                        legend: {
                            reversed: true,
                        },
                        tooltip: {
                            borderRadius: 2,
                            borderWidth: 1,
                            borderColor: '#999',
                            shadow: false,
                            shared: true,
                            useHTML: true,
                            yDecimals: 0,
                            formatter: function () {
                                var s = '<table><caption>' + this.x + '</caption>'
                                    + '<tbody>',
                                    sum = 0;

                                $.each(this.points, function (i, point) {
                                    s += '<tr><th style="color:' + point.color + '">\u25CF ' + point.series.name + ': </th>'
                                        + '<td style="text-align: right;color:' + point.color + '">' + point.y + '</td></tr>';
                                    sum += point.y;
                                });

                                s += '<tr><th>Total: </th>'
                                    + '<td style="text-align:right"><b>' + sum + '</b></td></tr>'
                                    + '</tbody></table>'

                                return s;
                            },
                            shared: true,
                        },
                        plotOptions: {
                            column: {
                                colorByPoint: true
                            },
                            series: {
                                stacking: 'normal'
                            },
                            bar: {
                                allowPointSelect: true
                            },
                        },
                        series: series
                    });
                }
            }
        </script>

    </form>
</body>
</html>
