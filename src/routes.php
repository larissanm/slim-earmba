<?php

use Slim\Http\Request;
use Slim\Http\Response;
use Slim\Http\UploadedFile;

//conexão remota
$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

function moveUploadedFile($directory, UploadedFile $uploadedFile)
{
    $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
    $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
    $filename = sprintf('%s.%0.8s', $basename, $extension);

    $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

    return $filename;
}

// Routes

$app->get('/[{name}]', function (Request $request, Response $response, array $args) {
    // Sample log message
    $this->logger->info("Slim-Skeleton '/' route");

    // Render index view
    return $this->renderer->render($response, 'index.phtml', $args);
});

//grupo api
$app->group('/api', function () use ($app) {
    //grupo paciente
    $app->group('/paciente', function () use ($app) {
        //login do paciente
        $app->post('/login', function ($request, $response) {
          
            $email=$request->getParam('login');
            $password=$request->getParam('senha');
            $sql = "select * from cadastro where login = :login and senha = :senha";
            try {
                $sth = $this->db->prepare($sql);
                $sth->bindParam("login", $email);
                $sth->bindParam("senha",$password);

                $sth->execute();
                $result = $sth->fetchObject();
                return $this->response->withJson($result);
            } catch (PDOException $e) {
                return $this->response->withJson("Erro ao logar o usuario ". $e->getCode() . $e, 500);
            }
        });

          //grupo Rotinas
          $app->group('/rotinas', function () use ($app) {

            //Inserção da rotina
            $app->post('/inserir', function ($request, $response) {
                $nome=$request->getParam('nome');
                $idCad=$request->getParam('id_cad');
                $clima=$request->getParam('clima');
                $observacao=$request->getParam('observacao');
                $local=$request->getParam('local');
                $horaInicio=$request->getParam('hora_inicio');
                $horaTermino=$request->getParam('hora_termino');
                $data=$request->getParam('data');

                $sql = "INSERT  rotina(nome,id_cad,clima,observacao,local,hora_inicio,hora_termino,data) VALUES(:nome,:id_cad,:clima,:observacao,:local,:hora_inicio,:hora_termino,:data)";
                try {
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("nome", $nome);
                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("clima",$clima);
                    $sth->bindParam("observacao",$observacao);
                    $sth->bindParam("local",$local);
                    $sth->bindParam("hora_inicio",$horaInicio);
                    $sth->bindParam("hora_termino",$horaTermino);
                    $sth->bindParam("data",$data);

                    $sth->execute();
                    $status = "Rotina adicionada com sucesso!";
                    
                    return $this->response->withJson($status);
                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao adicionar a Rotina. " . $e->getCode(), 500);
                }
            });
            //selecionar lista de rotinas de um determinado dia
            $app->post('/pesquisar', function ($request, $response) {
                
                  $idCad=$request->getParam('id_cad');
                  $data=$request->getParam('data');
                  $sql = "select * from rotina where id_cad = :id_cad and data = :data";
                  try {
                      $sth = $this->db->prepare($sql);
                      $sth->bindParam("id_cad", $idCad);
                      $sth->bindParam("data",$data);
      
                      $sth->execute();
                      $result = $sth->fetchAll();
                      return $this->response->withJson($result);
                  } catch (PDOException $e) {
                      return $this->response->withJson("Erro ao Pesquisar as Rotinas ". $e->getCode() . $e, 500);
                  }
              });

              $app->put('/atualizar', function ($request, $response, $args) {
                $nome=$request->getParam('nome');
                $idAtividade=$request->getParam('id_atividade');
                $clima=$request->getParam('clima');
                $observacao=$request->getParam('observacao');
                $local=$request->getParam('local');
                $horaInicio=$request->getParam('hora_inicio');
                $horaTermino=$request->getParam('hora_termino');
            
                try {
                    $sql = "UPDATE rotina SET nome=:nome, observacao=:observacao, local=:local , hora_inicio=:hora_inicio, hora_termino=:hora_termino,clima=:clima WHERE id_atividade=:id_atividade";
            
                 
                    
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("nome", $nome);
                    $sth->bindParam("id_atividade",$idAtividade);
                    $sth->bindParam("clima",$clima);
                    $sth->bindParam("observacao",$observacao);
                    $sth->bindParam("local",$local);
                    $sth->bindParam("hora_inicio",$horaInicio);
                    $sth->bindParam("hora_termino",$horaTermino);
            
                    $sth->execute();
            
                    $result = $sth->rowCount();
            
                    if ($result == 1) {
                        $status = "Atividade atualizada com sucesso!";
                        return $this->response->withJson($status);
                    } else {
                        $status = "Erro ao atualizar Atividade.";
                        return $this->response->withJson($status);
                    }
                } catch (Exception $e) {
                    return $this->response->withJson("Ocorreu algum erro interno." . $e->getCode(), 500);
                }
            });

            $app->delete('/deletar/[{id_atividade}]', function ($request, $response, $args) {
                $id_atividade=$request->getParam('id_atividade');
                try {
                    $sth = $this->db->prepare("DELETE FROM rotina WHERE id_atividade=:id_atividade");
                    $sth->bindParam("id_atividade", $id_atividade);
                    $sth->execute();
            
                    $result = $sth->rowCount();
            
                    if ($result == 1) {
                        $status = "Atividade deletado com sucesso!";
                    } else {
                        $status = "Erro ao deletar a Atividade.";
                    }
                    return $this->response->withJson($status);
                } catch (Exception $e) {
                    return $this->response->withJson("Ocorreu algum erro interno." . $e->getCode(), 500);
                }
            
            });
            
            
         });
           

         $app->group('/remedio', function () use ($app) {
            
                        //Inserção da medicação
                        $app->post('/inserir', function ($request, $response) {
                            $nome=$request->getParam('nome');
                            $idCad=$request->getParam('id_cad');
                            $dosagem=$request->getParam('dosagem');
                            $miligramagem=$request->getParam('miligramagem');
                            $principio_ativo=$request->getParam('principio_ativo');
                            $intervalo=$request->getParam('intervalo');
                        
                            $sql = "INSERT  medicamentos(nome,id_cad,dosagem,miligramagem,principio_ativo,intervalo) VALUES(:nome,:id_cad,:dosagem,:miligramagem,:principio_ativo,:intervalo)";
                            try {
                                $sth = $this->db->prepare($sql);
                                $sth->bindParam("nome", $nome);
                                $sth->bindParam("id_cad",$idCad);
                                $sth->bindParam("dosagem",$dosagem);
                                $sth->bindParam("miligramagem",$miligramagem);
                                $sth->bindParam("principio_ativo",$principio_ativo);
                                $sth->bindParam("intervalo",$intervalo);
                              
                                $sth->execute();
                                $status = "Medicamento adicionado com sucesso!";
                                
                                return $this->response->withJson($status);
                            } catch (PDOException $e) {
                                return $this->response->withJson("Erro ao adicionar o Medicamento. " . $e->getCode(), 500);
                            }
                        });
                        //selecionar lista de remedios do paciente
                        $app->get('/pesquisar/[{id_cad}]', function ($request, $response,$args) {
                            
                              $idCad=$request->getParam('id_cad');
                              $sql = "select * from medicamentos where id_cad = :id_cad";
                              try {
                                  $sth = $this->db->prepare($sql);
                                  $sth->bindParam("id_cad", $idCad);
                                 
                  
                                  $sth->execute();
                                  $result = $sth->fetchAll();
                                  return $this->response->withJson($result);
                              } catch (PDOException $e) {
                                  return $this->response->withJson("Erro ao Pesquisar os Medicamentos ". $e->getCode() . $e, 500);
                              }
                          });
            
                          $app->put('/atualizar', function ($request, $response, $args) {
                            $nome=$request->getParam('nome');
                            $id_remedio=$request->getParam('id_remedio');
                            $dosagem=$request->getParam('dosagem');
                            $miligramagem=$request->getParam('miligramagem');
                            $principio_ativo=$request->getParam('principio_ativo');
                            $intervalo=$request->getParam('intervalo');
                           
                        
                            try {
                                $sql = "UPDATE rotina SET nome=:nome, miligramagem=:miligramagem, principio_ativo=:principio_ativo , intervalo=:intervalo,dosagem=:dosagem WHERE id_remedio=:id_remedio";
                        
                             
                                
                                $sth = $this->db->prepare($sql);
                                $sth->bindParam("nome", $nome);
                                $sth->bindParam("id_remedio",$id_remedio);
                                $sth->bindParam("dosagem",$dosagem);
                                $sth->bindParam("miligramagem",$miligramagem);
                                $sth->bindParam("principio_ativo",$principio_ativo);
                                $sth->bindParam("intervalo",$intervalo);
                               
                        
                                $sth->execute();
                        
                                $result = $sth->rowCount();
                        
                                if ($result == 1) {
                                    $status = "Remedio atualizada com sucesso!";
                                    return $this->response->withJson($status);
                                } else {
                                    $status = "Erro ao atualizar o Remedio.";
                                    return $this->response->withJson($status);
                                }
                            } catch (Exception $e) {
                                return $this->response->withJson("Ocorreu algum erro interno." . $e->getCode(), 500);
                            }
                        });
            
                        $app->delete('/deletar/[{id_remedio}]', function ($request, $response, $args) {
                            $id_remedio=$request->getParam('id_remedio');
                            try {
                                $sth = $this->db->prepare("DELETE FROM medicamentos WHERE id_remedio=:id_remedio");
                                $sth->bindParam("id_remedio", $id_remedio);
                                $sth->execute();
                        
                                $result = $sth->rowCount();
                        
                                if ($result == 1) {
                                    $status = "Remedio deletado com sucesso!";
                                } else {
                                    $status = "Erro ao deletar o remedio.";
                                }
                                return $this->response->withJson($status);
                            } catch (Exception $e) {
                                return $this->response->withJson("Ocorreu algum erro interno." . $e->getCode(), 500);
                            }
                        
                        });
                        
                     });

        //grupo relatorio
         $app->group('/relatorio', function () use ($app) {
             
            $app->get('/receberWeekNumber/[{data}]', function ($request, $response,$args) {
                  $data=$request->getParam('data');
                  $duedt = explode("-", $data);
                  $date  = mktime(0, 0, 0, $duedt[1], $duedt[2], $duedt[0]);
                  $week  = (int)date('W', $date);
                  return $this->response->withJson($week);
              });

            $app->post('/gerarGrafico', function ($request, $response) {
                $idCad=$request->getParam('id_cad');
                //$ano=$request->getParam('ano');
                $semana=$request->getParam('semana');
            
                $sql = "SELECT * FROM nota_diaria WHERE id_cad =:id_cad AND semana=:semana  ORDER BY data ";
                try {
                    $sth = $this->db->prepare($sql);

                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("semana",$semana);
                  //  $sth->bindParam("ano",$ano);

                    $sth->execute();
                    $result = $sth->fetchAll();
                    return $this->response->withJson($result);
                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao Carregar o Grafico ". $e->getCode() . $e, 500);
                }
            });
         });

         $app->group('/teste', function () use ($app) {

            $app->get('/pesquisarMiniMental', function ($request, $response,$args) {
                  $sql = "select * from teste_stc";
                  try {
                      $sth = $this->db->prepare($sql);
                      $sth->execute();
                      $result = $sth->fetchAll();
                      return $this->response->withJson($result);
                  } catch (PDOException $e) {
                      return $this->response->withJson("Erro ao Pesquisar As Perguntas do MiniMental ". $e->getCode() . $e, 500);
                  }
              });

              $app->post('/inserirRespostaMiniMental', function ($request, $response) {
                $id_pergunta_stc=$request->getParam('id_pergunta_stc');
                $idCad=$request->getParam('id_cad');
                $resposta=$request->getParam('resposta');
                $observacao=$request->getParam('observacao');
                $data=$request->getParam('data');
                $clima=$request->getParam('clima');

                
            
                $sql = "INSERT  resposta_stc(id_pergunta_stc,id_cad,resposta,observacao,data,clima) VALUES(:id_pergunta_stc,:id_cad,:resposta,:observacao,:data,:clima)";
                try {
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("id_pergunta_stc", $id_pergunta_stc);
                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("resposta",$resposta);
                    $sth->bindParam("observacao",$observacao);
                    $sth->bindParam("data",$data);
                    $sth->bindParam("clima",$clima);
                  
                    $sth->execute();
                    $status = "Resposta adicionada com sucesso!";
                    
                    return $this->response->withJson($status);
                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao adicionar a Resposta. " . $e->getCode(), 500);
                }
            });              

            $app->post('/inserirRespostaPessoal', function ($request, $response) {
                $id_pergunta_vol=$request->getParam('id_pergunta_vol');
                $idCad=$request->getParam('id_cad');
                $resposta=$request->getParam('resposta');
                $observacao=$request->getParam('observacao');
                $data=$request->getParam('data');
                $clima=$request->getParam('clima');

                
            
                $sql = "INSERT  resposta_vol(id_pergunta_vol,id_cad,resposta,observacao,data,clima) VALUES(:id_pergunta_vol,:id_cad,:resposta,:observacao,:data,:clima)";
                try {
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("id_pergunta_vol", $id_pergunta_vol);
                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("resposta",$resposta);
                    $sth->bindParam("observacao",$observacao);
                    $sth->bindParam("data",$data);
                    $sth->bindParam("clima",$clima);
                  
                    $sth->execute();
                    $status = "Resposta adicionada com sucesso!";
                    
                    return $this->response->withJson($status);
                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao adicionar a Resposta. " . $e->getCode(), 500);
                }
            });            

            $app->post('/insertNotaDiaria', function ($request, $response) {
                $idCad=$request->getParam('id_cad');
                $resultadommes=$request->getParam('resultadommes');
                $resltadotp=$request->getParam('resultadotp');
                $data=$request->getParam('data');
                $resultadotf=$request->getParam('resultadotf');
               
            
                $sql = "select id_nota_diaria from nota_diaria where id_cad =:id_cad and data =:data";
                try {
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("data",$data);
                    $sth->execute();
                    $result = $sth->fetchObject();
                    
                   

                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao Pesquisar A Nota Diaria". $e->getCode() . $e, 500);
                }

           
                if($result==""){
                   
                    $duedt = explode("-", $data);
                    $date  = mktime(0, 0, 0, $duedt[1], $duedt[2], $duedt[0]);
                    $week  = (int)date('W', $date);

                    $sql = "INSERT  nota_diaria(id_cad,resultadommes,resultadotp,data,resultadotf,semana) VALUES(:id_cad,:resultadommes,:resultadotp,:data,:resultadotf,:semana)";
                    try {
                        $sth = $this->db->prepare($sql);
                        $sth->bindParam("id_cad",$idCad);
                        $sth->bindParam("resultadommes",$resultadommes);
                        $sth->bindParam("resultadotp",$resltadotp);
                        $sth->bindParam("data",$data);
                        $sth->bindParam("resultadotf",$resultadotf);
                        $sth->bindParam("semana",$week);
                      
                        $sth->execute();
                        $status = "Notas adicionadas com sucesso!";
                        
                        return $this->response->withJson($status);
                    } catch (PDOException $e) {
                        return $this->response->withJson("Erro ao adicionar a Nota. " . $e->getCode(), 500);
                    }
                    

                }
                else{
                    $sql = "UPDATE nota_diaria SET resultadommes=:resultadommes,resultadotp=:resultadotp,resultadotf=:resultadotf  WHERE (id_cad=:id_cad and data=:data)";
                
                            $sth = $this->db->prepare($sql);
                            $sth->bindParam("resultadommes", $resultadommes);
                            $sth->bindParam("id_cad",$idCad);
                            $sth->bindParam("data",$data);
                            $sth->bindParam("resultadotp",$resltadotp);
                            $sth->bindParam("resultadotf",$resultadotf);
                         
                    
                            $sth->execute();
                    
                            $result = $sth->rowCount();
                    
                            if ($result == 1) {
                                $status = "Nota inserida com sucesso!";
                                return $this->response->withJson($status);
                            } else {
                                $status = "Erro ao lançar a nota.";
                                return $this->response->withJson($status);
                            }
               
                }
               /* 
                */
            });              


        });
        $app->group('/pergunta', function () use ($app) {
            
            $app->post('/inserirPergunta', function ($request, $response) {
                $idCad=$request->getParam('id_cad');
                $pergunta_vol=$request->getParam('pergunta_vol');
                $resposta_vol=$request->getParam('resposta_vol');
                $img=$request->getParam('img');
                $sql = "INSERT  teste_vol(id_cad,pergunta_vol,resposta_vol,img) VALUES(:id_cad,:pergunta_vol,:resposta_vol,:img)";
                try {
                    $sth = $this->db->prepare($sql);
                    $sth->bindParam("id_cad",$idCad);
                    $sth->bindParam("pergunta_vol",$pergunta_vol);
                    $sth->bindParam("resposta_vol",$resposta_vol);
                    $sth->bindParam("img",$img);
                    
                  
                    $sth->execute();
                    $status = "Pergunta adicionada com sucesso!";
                    
                    return $this->response->withJson($status);
                } catch (PDOException $e) {
                    return $this->response->withJson("Erro ao adicionar a Pergunta. " . $e->getCode(), 500);
                }
                

             /*   $img=$request->getParam('img');
             /*   if($img==""){
                    return $this->response->withJson("VAzio");
                }
                else{
                    return $this->response->withJson($img);
                }
               $directory="/";
                $filename = moveUploadedFile($directory, $img);
               
         */
                 //do check for image types here and imprve security.You could restrict to only png/jpg/gif file formats only.Depending on what you need. 
  
             /*   if(!isset($uploadedFiles)
                {
                         $error['status']="error";
                      $error['msg']="Encountered an error: while uploading.no FILE UPLOADED";
                      return $this->response->withJson("Encountered an error: while uploading.no FILE UPLOADED");
                }
                else
                {
                    $imgs=array();
                    if($_FILES['img']['error']==0)
                    {
                        $name=uniqid('img-'.date('Ymd').'-');
                        if(move_uploaded_file($_FILES['img']['tmp_name'],'posters/'.$name)==true)
                        {
                            $old_neem=$_FILES['img']['name'];
         //make sure you have a folder called uploads where this php file is
                            $imgs[]=array('url' => '/uploads/' . $name, 'name' =>$old_neem);
                            $post_success="memata";
                            if($post_success)
                            {
                                 $error['status']="success";
                              $error['msg']="Image updated successfully";
                              return $this->response->withJson("Image updated successfully");
                            }
                            else{
                            $error['status']="error";
                         $error['msg']="Encountered an error: while uploading.no FILE UPLOADED";
                         return $this->response->withJson("Encountered an error: while uploading.no FILE UPLOADED");
                     }
                        }
                    }
                }
                */
                
            });  
            
            $app->get('/pesquisarPergunta/[{id_cad}]', function ($request, $response,$args) {
                
                  $idCad=$request->getParam('id_cad');
                  $sql = "select * from teste_vol where id_cad = :id_cad";
                  try {
                      $sth = $this->db->prepare($sql);
                      $sth->bindParam("id_cad", $idCad);
                     
      
                      $sth->execute();
                      $result = $sth->fetchAll();
                      return $this->response->withJson($result);
                  } catch (PDOException $e) {
                      return $this->response->withJson("Erro ao Pesquisar As Perguntas ". $e->getCode() . $e, 500);
                  }
              });

        });
    });

});
