codeunit 50130 "Raise Telemetry Events"
{
    procedure RaiseEvent(Level: Verbosity)
    var
        CriticalEventMsg: Label 'A critical event';
        ErrorEventMsg: Label 'A error event';
        WarningEventMsg: Label 'A warning event';
        NormalEventMsg: Label 'A normal event';
        CategoryTxt: Label 'Page Action';
        EventRaiseMsg: Label 'Event raised';
        CustDimension: Dictionary of [Text, Text];
    begin
        case Level of
            level::Critical:
                begin
                    CustDimension.Add('result', 'failed');
                    CustDimension.Add('reason', 'critical error in code');
                    LogMessage('TelEx-000', CriticalEventMsg, verbosity::Critical, DataClassification::CustomerContent, TelemetryScope::All, CustDimension);
                end;

            level::Error:
                SendTraceTag('TelEx-001', CategoryTxt, Level, ErrorEventMsg, DataClassification::CustomerContent);
            level::Warning:
                SendTraceTag('TelEx-002', CategoryTxt, Level, WarningEventMsg, DataClassification::CustomerContent);
        end;

        Message(EventRaiseMsg);
    end;
}