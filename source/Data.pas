﻿unit Data;

{$pointermath on}
{$scopedenums on}

interface

uses
  { EcoRT }
  System.Types,

  { Rtl }
  System.Math;

type
  RTData = record
  public
    class procedure Clear(var AField: System.Boolean); overload; static;
    class procedure Clear(var AField: System.ShortInt); overload; static;
    class procedure Clear(var AField: System.SmallInt); overload; static;
    class procedure Clear(var AField: System.Integer); overload; static;
    class procedure Clear(var AField: System.Int64); overload; static;
    class procedure Clear(var AField: System.Currency); overload; static;
    class procedure Clear(var AField: System.Double); overload; static;
    class procedure Clear(var AField: System.TDate); overload; static; inline;
    class procedure Clear(var AField: System.TDateTime); overload; static; inline;
    class procedure Clear(var AField: System.WideChar); overload; static; inline;
    class procedure Clear(var AField: System.UnicodeString); overload; static;
    class procedure Clear(var AField: System.TTime); overload; static; inline;

    class function IsClear(const AField: System.UnicodeString): System.Boolean; overload; static;
    class function IsClear(const AField: System.ShortInt): System.Boolean; overload; static; inline;
    class function IsClear(const AField: System.SmallInt): System.Boolean; overload; static; inline;
    class function IsClear(const AField: System.Integer): System.Boolean; overload; static; inline;
    class function IsClear(const AField: System.Int64): System.Boolean; overload; static; inline;
    class function IsClear(const AField: System.Double): System.Boolean; overload; static;
    class function IsClear(const AField: System.Currency): System.Boolean; overload; static; inline;
  end;

implementation

{ RTData }

class procedure RTData.Clear(var AField: System.ShortInt);
begin
  AField := System.Low(System.ShortInt);
end;

class procedure RTData.Clear(var AField: System.Boolean);
begin
  System.Byte(AField) := $78;
end;

class procedure RTData.Clear(var AField: System.Integer);
begin
  AField := System.Low(System.Integer);
end;

class procedure RTData.Clear(var AField: System.SmallInt);
begin
  AField := System.Low(System.SmallInt);
end;

class procedure RTData.Clear(var AField: System.Int64);
begin
  AField := System.Low(System.Int64);
end;

class procedure RTData.Clear(var AField: System.Currency);
begin
  System.PInt64(@AField)^ := System.Low(System.Int64);
end;

class procedure RTData.Clear(var AField: System.WideChar);
begin
  AField := #$00;
end;

class procedure RTData.Clear(var AField: System.UnicodeString);
begin
  AField := #$0000#$FFFF;
end;

class procedure RTData.Clear(var AField: System.TDateTime);
begin
  Clear(System.Double(AField));
end;

class procedure RTData.Clear(var AField: System.TDate);
begin
  Clear(System.Double(AField));
end;

class procedure RTData.Clear(var AField: System.Double);
begin
  AField := -System.Math.MaxDouble;
end;

class procedure RTData.Clear(var AField: System.TTime);
begin
  Clear(System.Double(AField));
end;

class function RTData.IsClear(const AField: System.Integer): System.Boolean;
begin
  Result := (AField = System.Low(System.Integer));
end;

class function RTData.IsClear(const AField: System.SmallInt): System.Boolean;
begin
  Result := (AField = System.Low(System.SmallInt));
end;

class function RTData.IsClear(const AField: System.ShortInt): System.Boolean;
begin
  Result := (AField = System.Low(System.ShortInt));
end;

class function RTData.IsClear(const AField: System.Currency): System.Boolean;
begin
  Result := IsClear(System.PInt64(@AField)^);
end;

class function RTData.IsClear(const AField: System.Double): System.Boolean;
begin
  Result := System.Math.SameValue(AField, -System.Math.MaxDouble);
end;

class function RTData.IsClear(const AField: System.Int64): System.Boolean;
begin
  Result := (AField = System.Low(System.Int64));
end;

class function RTData.IsClear(const AField: System.UnicodeString): System.Boolean;
begin
  //Result := (AField = #$0000#$FFFF);
  Result := (System.Length(AField) > 0) and (System.PWideChar(System.Pointer(AField))[0] = #$0000);
end;

end.
