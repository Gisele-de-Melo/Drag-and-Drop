object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Drag and Drop'
  ClientHeight = 337
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 337
    Align = alClient
    TabOrder = 0
    object pnlToDo: TPanel
      Left = 10
      Top = 16
      Width = 185
      Height = 306
      Margins.Left = 8
      Caption = 'pnlToDo'
      DragMode = dmAutomatic
      TabOrder = 0
      object pnlTask1: TPanel
        AlignWithMargins = True
        Left = 9
        Top = 9
        Width = 167
        Height = 41
        Cursor = crHandPoint
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'pnlTask1'
        Color = 12615935
        DragMode = dmAutomatic
        ParentBackground = False
        TabOrder = 0
      end
      object pnlTask2: TPanel
        AlignWithMargins = True
        Left = 9
        Top = 58
        Width = 167
        Height = 41
        Cursor = crHandPoint
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 0
        Align = alTop
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'pnlTask2'
        Color = 16777088
        DragMode = dmAutomatic
        ParentBackground = False
        TabOrder = 1
      end
    end
    object pnlInProgress: TPanel
      Left = 209
      Top = 16
      Width = 185
      Height = 306
      Caption = 'pnlInProgress'
      DragMode = dmAutomatic
      TabOrder = 1
    end
    object pnlDone: TPanel
      Left = 408
      Top = 16
      Width = 185
      Height = 306
      Caption = 'pnlDone'
      DragMode = dmAutomatic
      TabOrder = 2
    end
  end
end
