object frmConfigurar: TfrmConfigurar
  Left = 0
  Top = 0
  Caption = 'Configurar Conex'#227'o'
  ClientHeight = 266
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 618
    Height = 199
    Margins.Top = 10
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 141
      Height = 15
      Caption = 'Configura'#231#227'o do Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 28
      Top = 43
      Width = 43
      Height = 15
      Caption = 'Servidor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 285
      Top = 43
      Width = 28
      Height = 15
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 28
      Top = 92
      Width = 48
      Height = 15
      Caption = 'Database'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 287
      Top = 92
      Width = 35
      Height = 15
      Caption = 'LOGIN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 437
      Top = 92
      Width = 38
      Height = 15
      Caption = 'SENHA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 28
      Top = 140
      Width = 186
      Height = 15
      Caption = 'biblioteca do banco de dados (.dll) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Panel8: TPanel
      Left = 17
      Top = 26
      Width = 745
      Height = 1
      BevelOuter = bvNone
      Color = clGray
      ParentBackground = False
      TabOrder = 0
    end
    object edtServidor: TEdit
      Tag = 5
      Left = 28
      Top = 60
      Width = 236
      Height = 23
      Hint = 'Servidor'
      TabOrder = 1
    end
    object edtPorta: TEdit
      Tag = 5
      Left = 285
      Top = 60
      Width = 76
      Height = 23
      Hint = 'Porta de Conex'#227'o'
      TabOrder = 2
    end
    object edtNomeBanco: TEdit
      Tag = 5
      Left = 28
      Top = 108
      Width = 236
      Height = 23
      Hint = 'Nome da Base de Dados'
      TabOrder = 3
    end
    object edtUserName: TEdit
      Tag = 5
      Left = 285
      Top = 108
      Width = 132
      Height = 23
      Hint = 'Login'
      TabOrder = 4
    end
    object edtSenha: TEdit
      Tag = 5
      Left = 437
      Top = 108
      Width = 134
      Height = 23
      Hint = 'Senha'
      PasswordChar = '*'
      TabOrder = 5
    end
    object EdtDll: TEdit
      Tag = 5
      Left = 28
      Top = 161
      Width = 389
      Height = 23
      Hint = 'Nome da Base de Dados'
      TabOrder = 6
    end
    object Button1: TButton
      Left = 417
      Top = 160
      Width = 32
      Height = 25
      Caption = '...'
      TabOrder = 7
      OnClick = Button1Click
    end
  end
  object btnGravar: TButton
    Left = 3
    Top = 213
    Width = 88
    Height = 52
    Caption = 'Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnGravarClick
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Biblioteca .dll|*.dll'
    Left = 491
    Top = 170
  end
end
