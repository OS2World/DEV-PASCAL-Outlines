Unit CustomOutline;
// A minor enhancement to TOutline to remember which node was
// right clicked
// And also, has a SetAndShowSelectedItem method
Interface

Uses
  Classes, Forms, OutLine;

{Declare new class}
Type
  TCustomOutline=Class(TOutline)
    Protected
    FPopupNode: TOutlineNode;
    Procedure ParentNotification(Var Msg:TMessage);Override;

    Public
    Procedure SetAndShowSelectedItem( NodeIndex: longint );
    Property PopupNode: TOutlineNode read FPopupNode;
  End;

Exports
  TCustomOutline,'User','CustomOutline.bmp';

Implementation

Uses
  PmStdDlg, PmWin;

Procedure TCustomOutline.SetAndShowSelectedItem( NodeIndex: longint );
Begin
  SelectedItem:= NodeIndex;
  // The only way I can find to actually show the selected node
  // if its off screen!!!
  // Send a cursor up + cursor down key stroke
  if NodeIndex>1 then
  begin
    SendMsg( Handle,
             WM_CHAR,
             MPFROM2SHORT( KC_VIRTUALKEY, 0 ),
             MPFROM2SHORT( 0, VK_UP ) );
    SendMsg( Handle,
             WM_CHAR,
             MPFROM2SHORT( KC_VIRTUALKEY, 0 ),
             MPFROM2SHORT( 0, VK_DOWN ) );
  end
  else
  begin
    // selecting root node
    if ItemCount>1 then
    begin
      SendMsg( Handle,
               WM_CHAR,
               MPFROM2SHORT( KC_VIRTUALKEY, 0 ),
               MPFROM2SHORT( 0, VK_DOWN ) );
      SendMsg( Handle,
               WM_CHAR,
               MPFROM2SHORT( KC_VIRTUALKEY, 0 ),
               MPFROM2SHORT( 0, VK_UP ) );
    end;
  end;
  // Expand the selected node
  SelectedNode.Expand;
End;

Procedure TCustomOutline.ParentNotification(Var Msg:TMessage);
Var
  RecordCore:POutlineRecord;
Begin
  Case Msg.Param1Hi Of
    CN_CONTEXTMENU:
    Begin
      If Designed Then Exit;

      RecordCore := Pointer(Msg.Param2);
      If RecordCore = Nil Then Exit;
      FPopupNode := RecordCore^.Node;
    end;
  end; // case
  Inherited ParentNotification( Msg );
end;

Initialization
  {Register classes}
  RegisterClasses([TCustomOutline]);
End.

