procedure BitBtn1OnClick(Sender: TfrxComponent);
begin

    if not ckTodos.Checked then
    begin
        qryMovimentos.SQL.ADD(
            ' AND MOV.CODCLIFORN = ' + FloatToStr(cbCliente.KeyValue)                 
        );
        
        mmFiltroCliente.Text := 
            'Cliente: ' + cbCliente.Text;
    end;
    
    qryMovimentos.SQL.ADD(
       ' ORDER BY CLI.RAZAO '                   
    );  

    //ShowMessage(qryMovimentos.SQL.Text);
end;

procedure MasterData1OnBeforePrint(Sender: TfrxComponent);
begin
    if Frac(<Line> / 2) = 0.5 then
    begin              
        mmCodigo.Color := $00EBEBEB;
        mmDataEmissao.Color := $00EBEBEB;            
        mmIdMov.Color := $00EBEBEB;
        mmValorTotal.Color := $00EBEBEB;        
    end            
    else
    begin              
        mmCodigo.Color := clWhite;
        mmDataEmissao.Color := clWhite;            
        mmIdMov.Color := clWhite;
        mmValorTotal.Color := clWhite;
    end;         
end;

procedure DBLookupComboBox1OnClick(Sender: TfrxComponent);
begin
   ckTodos.Checked := False;                                                                               
end;

begin

end.