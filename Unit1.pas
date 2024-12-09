//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse código foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto não me
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
  // Configuração inicial dos painéis que servirão de containers
  pnlToDo.Caption := 'To Do';
  pnlInProgress.Caption := 'In Progress';
  pnlDone.Caption := 'Done';

  // Configuração inicial dos painéis de tarefas
  pnlTask1.Caption := 'Task 1';
  pnlTask2.Caption := 'Task 2';

  //Configurar os painéis para o modo de arrasto automático
  pnlTask1.DragMode := TDragMode.dmAutomatic;
  pnlTask2.DragMode := TDragMode.dmAutomatic;
  pnlToDo.DragMode := TDragMode.dmAutomatic;
  pnlInProgress.DragMode := TDragMode.dmAutomatic;
  pnlDone.DragMode := TDragMode.dmAutomatic;

  //Configurar os eventos de arrastar sobre dos painéis
  pnlTask1.OnDragOver := panelTaskDragOver;
  pnlTask2.OnDragOver := panelTaskDragOver;
  pnlToDo.OnDragOver := panelContainerDragOver;
  pnlInProgress.OnDragOver := panelContainerDragOver;
  pnlDone.OnDragOver := panelContainerDragOver;

  //Configurar os eventos de arrastar e soltar dos painéis
  pnlToDo.OnDragDrop := panelContainerDragDrop;
  pnlInProgress.OnDragDrop := panelContainerDragDrop;
  pnlDone.OnDragDrop := panelContainerDragDrop;
end;

procedure TForm1.panelContainerDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  FDraggingPanel.Align := alBottom; //configura o painel para se alinhar no fundo - essa configuração fará com que as tarefas fiquem ordenadas uma embaixo da outra, ao arrastar
  FDraggingPanel.Parent := TPanel(Sender); //configura o novo pai do painel tarefa
  FDraggingPanel.Align := alTop; //configura o painel para se alinhar ao topo - essa configuração fará com que as tarefas fiquem ordenadas uma embaixo da outra, ao arrastar

  FDraggingPanel := nil //Limpa a variável que recebe o  painel que representa a tarefa.
end;

procedure TForm1.panelContainerDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Sender is TPanel); //Configura os painéis que serão os containers para aceitar outros painéis
end;

procedure TForm1.panelTaskDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Sender is TPanel then
  begin
    FDraggingPanel := TPanel(Sender); //Seta a variável FDraggingPanel para receber o painel que representa a tarefa.
  end;
end;

end.

