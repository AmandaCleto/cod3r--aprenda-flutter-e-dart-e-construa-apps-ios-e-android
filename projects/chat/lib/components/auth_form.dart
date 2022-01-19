import 'dart:io';
import 'package:chat/components/user_image_picker.dart';
import 'package:chat/core/models/auth_form_data.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubmit(_formData);
  }

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      color: Palette.customLightColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (_formData.isSignup)
              Positioned(
                child: UserImagePicker(
                  onImagePick: _handleImagePick,
                  name: _formData.name,
                ),
                right: 0,
                left: 0,
                top: -80,
              ),
            Container(
              padding:
                  _formData.isSignup ? const EdgeInsets.only(top: 40.0) : null,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (_formData.isSignup)
                      TextFormField(
                        key: const ValueKey('name'),
                        initialValue: _formData.name,
                        onChanged: (name) => setState(() {
                          _formData.name = name;
                        }),
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: (_name) {
                          final name = _name ?? '';
                          if (name.trim().length < 3) {
                            return 'Nome deve ter no mínimo 3 caracteres';
                          }
                          return null;
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('email'),
                      initialValue: _formData.email,
                      onChanged: (email) => _formData.email = email,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: (_email) {
                        final email = _email ?? '';
                        if (!email.contains('@')) {
                          return 'E-mail informado não é válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      initialValue: _formData.password,
                      obscureText: true,
                      onChanged: (password) => _formData.password = password,
                      decoration: const InputDecoration(labelText: 'Senha'),
                      validator: (_password) {
                        final password = _password ?? '';
                        if (password.length < 6) {
                          return 'Senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text(
                          _formData.isLogin ? 'Entrar' : 'Cadastrar',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _formData.toggleAuthMode();
                        });
                      },
                      child: Text(
                        _formData.isLogin
                            ? 'Criar uma nova conta?'
                            : 'Já possui uma conta?',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
