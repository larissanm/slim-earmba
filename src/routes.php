<?php

use Slim\Http\Request;
use Slim\Http\Response;

//conexão remota
$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

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


        //grupo medicamentos
        $app->group('/mendicamentos', function () use ($app) {

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

    });

});
