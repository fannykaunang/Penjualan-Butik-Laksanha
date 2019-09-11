<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="account_Login" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Penjualan Butik | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <link rel="stylesheet" href="../plugins/alertify/css/alertify.core.css" />
    <link rel="stylesheet" href="../plugins/alertify/css/alertify.default.css" id="toggleCSS" />

    <style>
        .alertify-log-custom {
            background: #1755c1;
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
<body class="hold-transition login-page">
    <form runat="server">
        <div class="login-box">
            <div class="login-logo">
                <a href="#"><b>Penjualan</b>Butik</a>
            </div>
            <!-- /.login-logo -->
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg">Silahkan login untuk memulai sesi</p>

                    <div class="input-group mb-3">
                        <asp:TextBox ID="TXTUSERNAME" runat="server" CssClass="form-control" placeholder="Username" TextMode="Email"></asp:TextBox>
                        <div class="input-group-append input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <asp:TextBox ID="TXTPASSWORD" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <div class="input-group-append input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <asp:Label ID="LBINFO" runat="server" ForeColor="#d62c2c"></asp:Label>
                    <div class="row">
                        <div class="col-7">
                            <div class="icheck-primary">
                                <asp:CheckBox ID="chkRememberMe" runat="server" />
                                <label for="chkRememberMe">
                                    Ingatkan Saya
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-5">
                            <%--<asp:Button ID="BTLOGIN" OnClick="BTSUBMIT_Click" runat="server" Text="Sign In" CssClass="btn btn-primary btn-block btn-flat has-spinners" />--%>
                            <asp:LinkButton ID="BTLOGIN" runat="server" OnClick="BTSUBMIT_Click" CssClass="btn btn-primary btn-block btn-flat has-spinners"><i class="fas fa-sign-in-alt"></i>&nbsp;Login</asp:LinkButton>
                        </div>
                        <!-- /.col -->
                    </div>

                    <!-- /.social-auth-links -->

                    <p class="mb-1">
                        <a href="#">Lupa sandi?</a>
                    </p>
                </div>
                <!-- /.login-card-body -->
            </div>
        </div>
        <!-- /.login-box -->

        <!-- jQuery -->
        <script src="../../plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="../plugins/alertify/js/alertify.js"></script>
        <script src="../plugins/alertify/js/alertify.min.js"></script>

        <script type="text/javascript">
            $(function () {
                $('#TXTUSERNAME, #TXTPASSWORD').on("keypress", function (e) {
                    if (e.keyCode == 13) {
                        $("#BTLOGIN")[0].click();
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

                $("body").on("click", "[id*=BTLOGIN]", function () {
                    var btn = $(this);
                    $("#LBINFO").text('');
                    if ($("#TXTUSERNAME").val() == '' && $("#TXTPASSWORD").val() == '') {
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else if ($("#TXTUSERNAME").val() == '') {
                        $("#LBINFO").text('Field masih kosong. Wajib diisi!!!');
                        return false;
                    } else if ($("#TXTPASSWORD").val() == '') {
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
