Zenix Player Roku v3.1.8 - FIX QR DINAMICO

- Remove o QR fixo de espera que apontava para o portal.
- Enquanto o painel gera o token aparece: Gerando QR seguro...
- O QR somente fica visivel depois que register.php devolve qr_image_url.
- O QR dinamico abre quick-activate.php com o token do aparelho e leva direto para Provider, usuario e senha.
- Mantem o controle parental +18 da v3.1.7.
