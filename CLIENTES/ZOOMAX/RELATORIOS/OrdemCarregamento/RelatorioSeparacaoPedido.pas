Var aTotal : Double;

procedure btnOKOnClick(Sender: TfrxComponent);
begin
    if trim(edtNumero.Text) <> '' then
    begin
        qryProdutos.SQL.ADD(
               ' OR ITM.CODMOV = ('       
                       + 'SELECT CODIGO FROM MOVIMENTACOES WHERE CODTIPOMOV = ''2.2.17'''   
                       + 'AND IDMOV = ''' + edtNumero.Text + ''' )');
    end;
    
    qryNota.SQL.ADD(' AND MOV.CODIGO IN( ' + VarToStr(<CODIGOS_MOVIMENTO>) + ')' );  
    qryProdutos.SQL.ADD(' AND ITM.CODMOV IN( ' + VarToStr(<CODIGOS_MOVIMENTO>) + ')' );  

    qryProdutos.SQL.ADD(' ORDER BY NOME_GRUPO, ITM.CODMOV DESC, PRD.NOME');
    
end;      

procedure Shape4OnBeforePrint(Sender: TfrxComponent);
begin
    //if <qryNota."TIPO_FRETE"> = 'CIF' then
        //xCIF.visible := True
    //else
        //xFOB.visible := True;  
end;

procedure Memo24OnBeforePrint(Sender: TfrxComponent);
begin                                              
    //Memo24.Text := FormatFloat('###,###,###,##0.00',Sum(<qryProdutos."VALOR_TOTAL">, MasterData1));  
end;

procedure MasterData1OnBeforePrint(Sender: TfrxComponent);
begin
    qryLote.Close;                 
        qryLote.parambyname('COD_ITEM').value := <qryProdutos."COD_ITEM">;
    qryLote.Open;                       
end;

procedure Memo8OnBeforePrint(Sender: TfrxComponent);
begin
    if trim(edtNumero.Text) <> '' then
    begin
        Memo8.Text :=  varToStr(<qryNota."IDMOV">) +', '+ trim(edtNumero.Text);      
    end;   
end;

begin                    
end.