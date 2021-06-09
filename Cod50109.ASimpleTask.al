codeunit 50109 "A Simple Task"
{
    trigger OnRun()
    begin
        SimpleTaskFunction();
    end;

    local procedure SimpleTaskFunction()
    var
        SimpleTaskResultL: Record "Simple Task Result";
    begin
        SimpleTaskResultL.UpdateWithNewRun();
    end;

    procedure AddTaskToScheduler()
    begin
        TaskScheduler.CreateTask(Codeunit::"A Simple Task", 0, false, '', CurrentDateTime());
    end;

    procedure DeleteTaskFromScheduler(TaskID: Guid)
    begin
        TaskScheduler.CancelTask(TaskID);
    end;

    procedure SetTaskToReady(TaskId: Guid)
    begin
        TaskScheduler.SetTaskReady(TaskId);
    end;
}