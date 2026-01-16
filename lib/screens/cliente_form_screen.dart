import 'package:flutter/material.dart';
import 'package:customer_registration/repositories/cliente_repository.dart';

class ClienteFormScreen extends StatefulWidget {
  final ClienteRepository repository;

  const ClienteFormScreen({super.key, required this.repository});

  @override
  State<ClienteFormScreen> createState => _ClienteFormScreenState();
}

class _ClienteFormScreenState extends State<ClienteFormScreen> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  void Salvar() {
    final cliente = widget.repository.criarCliente(
      nome: nomeController.text, 
      cpf: "", 
      telefone: "", 
      email: emailController.text, 
      logradouro: "", 
      bairro: "", 
      numero: "", 
      cep: ""
    );

    widget.repository.adicionar(cliente);

    Navigator.pop(context);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Novo Cliente")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height:  20,)
              ElevatedButton(onPressed: Salvar,
              child: const Text("Salvar")
              ),
            ],
          ),
          ),
      )
    }
  }
}