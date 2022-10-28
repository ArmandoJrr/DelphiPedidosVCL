object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido Venda'
  ClientHeight = 625
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 625
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 544
    ExplicitHeight = 624
    object Label1: TLabel
      Left = 17
      Top = 48
      Width = 85
      Height = 21
      Caption = 'Cod Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 257
      Top = 48
      Width = 88
      Height = 21
      Caption = 'Data Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 17
      Top = 0
      Width = 165
      Height = 30
      Caption = 'Dados do Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 17
      Top = 126
      Width = 164
      Height = 30
      Caption = 'Dados do Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 164
      Width = 85
      Height = 21
      Caption = 'Cod Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 136
      Top = 162
      Width = 45
      Height = 21
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 246
      Width = 196
      Height = 30
      Caption = 'Dados dos Produtos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 18
      Top = 292
      Width = 94
      Height = 21
      Caption = 'Cod Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 146
      Top = 292
      Width = 85
      Height = 21
      Caption = 'Quantidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 275
      Top = 292
      Width = 75
      Height = 21
      Caption = 'Valor Unit.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblTotPedido: TLabel
      Left = 16
      Top = 584
      Width = 98
      Height = 21
      Caption = 'Total Pedido: '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EditNomeCli: TEdit
      Left = 135
      Top = 199
      Width = 238
      Height = 23
      ReadOnly = True
      TabOrder = 2
    end
    object DBGrid: TDBGrid
      Left = 16
      Top = 372
      Width = 525
      Height = 189
      DataSource = DmPedido.DsProdutosVenda
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = DBGridCellClick
      OnKeyDown = DBGridKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_produto'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeProd'
          Title.Caption = 'Descri'#231#227'o'
          Width = 247
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qtd'
          Title.Caption = 'Qtd.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_unit'
          Title.Caption = 'Valor Unit.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vl_total'
          Title.Caption = 'Total'
          Visible = True
        end>
    end
    object BtnSalvar: TButton
      Left = 357
      Top = 577
      Width = 161
      Height = 42
      Caption = 'Salvar'
      TabOrder = 8
      OnClick = BtnSalvarClick
    end
    object BtnInserirProd: TButton
      Left = 418
      Top = 317
      Width = 121
      Height = 34
      Caption = 'Inserir Produto'
      TabOrder = 6
      Visible = False
      OnClick = BtnInserirProdClick
    end
    object BtnConsultarPedido: TButton
      Left = 418
      Top = 159
      Width = 121
      Height = 34
      Caption = 'Consultar Pedido'
      TabOrder = 7
      OnClick = BtnConsultarPedidoClick
    end
    object DBEditCodPedido: TDBEdit
      Left = 18
      Top = 79
      Width = 94
      Height = 23
      DataField = 'Nro_pedido'
      DataSource = DmPedido.DsPedido
      ReadOnly = True
      TabOrder = 10
    end
    object DBEditDtEmiss: TDBEdit
      Left = 257
      Top = 79
      Width = 94
      Height = 23
      DataField = 'Dt_emiss'
      DataSource = DmPedido.DsPedido
      ReadOnly = True
      TabOrder = 11
    end
    object BtnNovoPedido: TButton
      Left = 418
      Top = 68
      Width = 121
      Height = 34
      Caption = 'Novo Pedido'
      TabOrder = 0
      OnClick = BtnNovoPedidoClick
    end
    object EditCodCliente: TEdit
      Left = 18
      Top = 199
      Width = 94
      Height = 23
      ReadOnly = True
      TabOrder = 1
      OnExit = EditCodClienteExit
    end
    object EditCodProduto: TEdit
      Left = 18
      Top = 322
      Width = 94
      Height = 23
      ReadOnly = True
      TabOrder = 3
    end
    object EditQtd: TEdit
      Left = 146
      Top = 322
      Width = 94
      Height = 23
      ReadOnly = True
      TabOrder = 4
      OnExit = EditQtdExit
    end
    object EditVlUnit: TEdit
      Left = 275
      Top = 322
      Width = 98
      Height = 23
      ReadOnly = True
      TabOrder = 5
      OnExit = EditVlUnitExit
    end
    object BtnExcluirPedido: TButton
      Left = 418
      Top = 200
      Width = 121
      Height = 34
      Caption = 'Excluir Pedido'
      TabOrder = 12
      OnClick = BtnExcluirPedidoClick
    end
    object EditTotPedido: TEdit
      Left = 114
      Top = 583
      Width = 68
      Height = 23
      ReadOnly = True
      TabOrder = 13
    end
  end
end
