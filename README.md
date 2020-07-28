


# Estrutura de pastas


# Motivações
- Propriedade clara dos recursos
- Previsibilidade de uso do módulo (refatoração, manutenção, você sabe o que é compartilhado, o que não é, evita regressões acidentais, evita enormes diretórios de módulos não reutilizáveis, etc.)
- O CI executa apenas os testes que importam (futuro)
- Divisão de código (futuro)


# Como funciona
A estrutura do arquivo é mapeada diretamente para a hierarquia da rota, que é mapeada diretamente para a hierarquia da interface do usuário.
Se considerarmos todas as pastas uma pasta "genérica", teremos apenas uma pasta "feature" como nos exemplos abaixo:

Exemplos de pastas "feature":

- example1
- example2



Exemplos de pastas "genérica":

- components
- config
- page
- stores
- services



Dada esta configuração de rota a navegação do arquivo routes.js:

```
src
└── routes.tsx
```

```js
final  Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
"/": (BuildContext context) => ExScreen1(),
"/ExScreen2": (BuildContext context) => ExScreen2(),
};
```
O mesmo poderá acessar outras paginas e navegar conforme configurarmos.





Agora, configuraríamos nossos diretórios assim:

```
lib
├── bloc
├── blocs
├── components
├── models
├── pages
├── services
└── theme                
```

```
lib
├── bloc
├── blocs
├── components
├── models
└── pages
    ├── example1
    |    ├── components
    |    |   └── body.dart
    |    |
    |    ├── example-bloc.dart
    |    └── examplescreen1.dart
    |           
    ├── example2
    |    ├── components
    |    |   └── body.dart
    |    |
    |    ├── example2-bloc.dart
    |    └── examplescreen2.dart   
```

Em seguida, cada uma dessas pages que possui a sua pasta há seus elementos de componentes, bloc  e o arquivo que lida com a entrada na tela, também conhecido como "Manipulador de rota" que direciona botoes a encaminha para um outra page, dessa maneira ficam mais limpo para qualquer manutenção.


### Components


```

src
├── assets
├── components
│   ├── Card
│   │   ├── index.tsx
│   │   └── styles.tsx
│   └── Button
│       ├── index.tsx
│       └── styles.tsx
├── config
├── pages
│   ├── Home
│   │   ├── index.tsx
│   │   └── styles.tsx
│   └── Profile
│       ├── index.tsx
│       └── styles.tsx

```


Esses componentes são usados de forma global a fins de reutilizar o que foi desenvolvido, evitando repetição de codigos para interface compartilhando entre as pages.


### Serviços compartilhados

Toda page precisa de informações e busca essas informações de APIs. Por esse motivo utilizamos a pasta "services" para organizar os endpoints, onde qualquer tipo de configuração de busca de serviços ou conexão com banco de dados.


```
src
├── assets
├── components
├── config
├── pages
└── services
    └── gitHub
        └── index.tsx
```

```js
import  axios  from  "axios";
const  apiGitHub = axios.create({
	baseURL:  "https://api.github.com/",
});
```


### Store para comunicação e organização de informações

Utilizamos o store para utilizar e organizar as informações, distribuir em qualquer page ou atualizar alguma informação utilizando o redux ou outra biblioteca.

```
src
├── assets
├── components
├── config
├── pages
├── services
└── store
    └── index.tsx

```



### Reducers
**Os reducers** especificam como o estado do aplicativo é alterado em resposta às ações (https://redux.js.org/basics/actions) enviadas para a store. Lembre-se de que as ações apenas descrevem o _que aconteceu_ , mas não descrevem como o estado do aplicativo muda.

```
src
├── assets
├── components
├── config
├── pages
├── services
└── store
    ├── reducers
    │     ├── user
    │     │   └── index.tsx
    │     │
    │     └── index.tsx
    │     
    └── index.tsx
```

Poderá ser criado a quantidade de reducers que for necessário para acionamento de actions, dessa maneira as informações ficam separadas e ao mesmo tempo unidas pois no final o *combineReducers*  ira unificar todas formando um único dado para utilização no state
```js
const  status = useSelector<any>((state) =>  state.user.usuario.status);
```






### Como iniciar o app

**Instalar as dependências:**
```
npm install
```
ou caso tenha yarn 
```
yarn install
```


**Para iniciar o app:**
```
npm start
```
ou caso tenha yarn 
```
yarn start
```




Para desenho da documentação
[https://stackedit.io/app#](https://stackedit.io/app#)
