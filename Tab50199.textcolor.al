table 50149 textcolor
{
    Caption = 'textcolor';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; color; Text[10])
        {
            Caption = 'color';
            DataClassification = ToBeClassified;
        }
        field(2; code; Text[10])
        {
            Caption = 'code';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; color)
        {
            Clustered = true;
        }
    }

}
