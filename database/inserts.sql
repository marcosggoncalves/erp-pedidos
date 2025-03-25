INSERT INTO USUARIO (CPF, USUARIO, SENHA)
VALUES (
    '069.389.071-10', 
    'MARCOS GONÇALVES', 
    '1234'
);

INSERT INTO usuario (cpf, usuario, senha) VALUES
    ('069.389.071-10', 'MARCOS GONÇALVES', '1234');
INSERT INTO usuario (cpf, usuario, senha) VALUES
    ('123.456.789-00', 'JOÃO SILVA', 'abcd');
INSERT INTO usuario (cpf, usuario, senha) VALUES
    ('987.654.321-00', 'MARIA OLIVEIRA', 'senha123');
INSERT INTO usuario (cpf, usuario, senha) VALUES
    ('456.789.123-00', 'CARLOS SANTOS', 'qwerty');
INSERT INTO usuario (cpf, usuario, senha) VALUES
    ('321.654.987-00', 'ANA PEREIRA', 'pass123');

INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Notebook Dell', 4500.00, 10);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Mouse Logitech', 150.00, 50);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Teclado Mecânico', 350.00, 30);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Monitor 24 polegadas', 1200.00, 20);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Impressora HP', 800.00, 15);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Pendrive 32GB', 50.00, 100);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('SSD 1TB', 500.00, 25);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Memória RAM 16GB', 350.00, 40);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Cadeira Gamer', 900.00, 10);
INSERT INTO produto (nome, preco_unit, quantidade_estoque) VALUES
    ('Webcam Full HD', 250.00, 30);

INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('José Almeida', '123.456.789-01');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Empresa ABC LTDA', '12.345.678/0001-99');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Fernanda Souza', '987.654.321-02');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Carlos Pereira', '456.789.123-03');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Loja XYZ', '98.765.432/0001-88');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Roberto Martins', '321.654.987-04');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Sônia Braga', '741.852.963-05');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Fernando Rocha', '369.258.147-06');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Supermercado Sempre Bom', '23.456.789/0001-77');
INSERT INTO cliente (nome, cpf_cnpj) VALUES
    ('Marta Lima', '852.963.741-07');

INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (1, 1, '2025-03-01');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (2, 2, '2025-03-02');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (3, 3, '2025-03-03');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (4, 4, '2025-03-04');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (5, 5, '2025-03-05');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (6, 1, '2025-03-06');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (7, 2, '2025-03-07');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (8, 3, '2025-03-08');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (9, 4, '2025-03-09');
INSERT INTO pedido (cliente_id, usuario_id, data_pedido) VALUES
    (10, 5, '2025-03-10');

INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (1, 1, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (1, 3, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (2, 2, 5);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (2, 4, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (3, 5, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (3, 6, 10);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (4, 7, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (4, 8, 3);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (5, 9, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (5, 10, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (6, 1, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (6, 2, 4);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (7, 3, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (7, 4, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (8, 5, 3);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (8, 6, 5);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (9, 7, 1);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (9, 8, 2);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (10, 9, 3);
INSERT INTO pedido_produto (pedido_id, produto_id, quantidade) VALUES
    (10, 10, 4);
