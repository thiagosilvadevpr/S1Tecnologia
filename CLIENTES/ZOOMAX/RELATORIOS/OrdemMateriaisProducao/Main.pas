procedure BitBtn1OnClick(Sender: TfrxComponent);
begin  
    qryProdutos.SQL.ADD(
        ' AND MOV.CODIGO IN ' + VarToStr(<CODIGOS_MOVIMENTO>)
    );
      
    qryProdutos.SQL.ADD(
        ' GROUP BY '
        + ' ITM.IDPRODUTO,  '
        + ' ITM.DESCPRODUTO '
    );
      
    mmIDsMovimento.Text := 
        'Codigos: ' + VarToStr(<CODIGOS_MOVIMENTO>);
    
    //ShowMessage(qryProdutos.SQL.Text);
end;

procedure MasterData1OnBeforePrint(Sender: TfrxComponent);
begin
    if Frac(<Line> / 2) = 0.5 then
    begin              
        mmIdProduto.Color := $00EBEBEB;        
        mmDescricao.Color := $00EBEBEB;
        mmQuantidade.Color := $00EBEBEB;        
    end            
    else
    begin              
        mmIdProduto.Color := clWhite;
        mmDescricao.Color := clWhite;
        mmQuantidade.Color := clWhite;
    end;         
end;

begin

end.