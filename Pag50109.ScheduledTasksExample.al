page 50109 "Scheduled Tasks Example"
{
    PageType = ListPlus;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Scheduled Task";
    SourceTableView = sorting(ID) where("Run Codeunit" = filter(50109));
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Result)
            {
                field(TaskLastRan; TaskLastRanG)
                {
                    Caption = 'Task last ran:';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            repeater(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field("Run Codeunit"; Rec."Run Codeunit")
                {
                    ApplicationArea = All;
                }
                field("Not Before"; Rec."Not Before")
                {
                    ApplicationArea = All;
                }
                field("Is Ready"; Rec."Is Ready")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Create Task")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SimpleTaskL: Codeunit "A Simple Task";
                begin
                    SimpleTaskL.AddTaskToScheduler();
                    UpdateResult();
                end;
            }
            action("Set Task to Ready")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SimpleTaskL: Codeunit "A Simple Task";
                begin
                    SimpleTaskL.SetTaskToReady(Rec.ID);
                    UpdateResult();
                end;
            }
            action("Delete Task")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SimpleTaskL: Codeunit "A Simple Task";
                begin
                    SimpleTaskL.DeleteTaskFromScheduler(Rec.ID);
                    UpdateResult();
                end;
            }
            action("Refresh Page")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    UpdateResult();
                end;
            }
        }
    }

    var
        TaskLastRanG: DateTime;

    trigger OnOpenPage()
    begin
        UpdateResult();
    end;

    local procedure UpdateResult()
    var
        SimpleTaskResultL: Record "Simple Task Result";
    begin
        clear(TaskLastRanG);
        if SimpleTaskResultL.Get() then
            TaskLastRanG := SimpleTaskResultL."DateTime Task Last Ran";
    end;
}