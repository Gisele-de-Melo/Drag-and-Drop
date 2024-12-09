//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse c�digo foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto n�o me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    pnlToDo: TPanel;
    pnlTask1: TPanel;
    pnlTask2: TPanel;
    pnlInProgress: TPanel;
    pnlDone: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure panelContainerDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure panelContainerDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure panelTaskDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  private
    FDraggingPanel: TPanel;
    procedure InitializeKanban;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitializeKanban;
end;

procedure TForm1.InitializeKanban;
begin
  // Configura��o inicial dos pain�is que servir�o de containers
  pnlToDo.Caption := 'To Do';
  pnlInProgress.Caption := 'In Progress';
  pnlDone.Caption := 'Done';

  // Configura��o inicial dos pain�is de tarefas
  pnlTask1.Caption := 'Task 1';
  pnlTask2.Caption := 'Task 2';

  //Configurar os pain�is para o modo de arrasto autom�tico
  pnlTask1.DragMode := TDragMode.dmAutomatic;
  pnlTask2.DragMode := TDragMode.dmAutomatic;
  pnlToDo.DragMode := TDragMode.dmAutomatic;
  pnlInProgress.DragMode := TDragMode.dmAutomatic;
  pnlDone.DragMode := TDragMode.dmAutomatic;

  //Configurar os eventos de arrastar sobre dos pain�is
  pnlTask1.OnDragOver := panelTaskDragOver;
  pnlTask2.OnDragOver := panelTaskDragOver;
  pnlToDo.OnDragOver := panelContainerDragOver;
  pnlInProgress.OnDragOver := panelContainerDragOver;
  pnlDone.OnDragOver := panelContainerDragOver;

  //Configurar os eventos de arrastar e soltar dos pain�is
  pnlToDo.OnDragDrop := panelContainerDragDrop;
  pnlInProgress.OnDragDrop := panelContainerDragDrop;
  pnlDone.OnDragDrop := panelContainerDragDrop;
end;

procedure TForm1.panelContainerDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  FDraggingPanel.Align := alBottom; //configura o painel para se alinhar no fundo - essa configura��o far� com que as tarefas fiquem ordenadas uma embaixo da outra, ao arrastar
  FDraggingPanel.Parent := TPanel(Sender); //configura o novo pai do painel tarefa
  FDraggingPanel.Align := alTop; //configura o painel para se alinhar ao topo - essa configura��o far� com que as tarefas fiquem ordenadas uma embaixo da outra, ao arrastar

  FDraggingPanel := nil //Limpa a vari�vel que recebe o  painel que representa a tarefa.
end;

procedure TForm1.panelContainerDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Sender is TPanel); //Configura os pain�is que ser�o os containers para aceitar outros pain�is
end;

procedure TForm1.panelTaskDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Sender is TPanel then
  begin
    FDraggingPanel := TPanel(Sender); //Seta a vari�vel FDraggingPanel para receber o painel que representa a tarefa.
  end;
end;

end.

