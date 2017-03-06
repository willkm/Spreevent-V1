using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Spreevent_V1.Models
{
    public class Evento
    {
        private int id;
        private string nome;
        private DateTime data_inicio;
        private DateTime data_fim;
        private string descricao;
        private int confirmacoes;
        private Foto_Evento foto_evento;
        private TipoEvento tipo_evento;
        private Categoria_Evento categoria_evento;
        private Restricao_Idade restricao_idade;
        private string caminho;
        private string endereco;
        private string categoria;
        private string restricao;
        private string tipo;
        private string dataInicio;
        private string dataFim;
        private string horaIn;
        private string horaFim;
        private int idUser;
        

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Nome
        {
            get
            {
                return nome;
            }

            set
            {
                nome = value;
            }
        }

        public DateTime Data_inicio
        {
            get
            {
                return data_inicio;
            }

            set
            {
                data_inicio = value;
            }
        }

        public DateTime Data_fim
        {
            get
            {
                return data_fim;
            }

            set
            {
                data_fim = value;
            }
        }

        public string Descricao
        {
            get
            {
                return descricao;
            }

            set
            {
                descricao = value;
            }
        }

        public int Confirmacoes
        {
            get
            {
                return confirmacoes;
            }

            set
            {
                confirmacoes = value;
            }
        }

        public Foto_Evento Foto_evento
        {
            get
            {
                return foto_evento;
            }

            set
            {
                foto_evento = value;
            }
        }

        public TipoEvento Tipo_evento
        {
            get
            {
                return tipo_evento;
            }

            set
            {
                tipo_evento = value;
            }
        }

        public Categoria_Evento Categoria_evento
        {
            get
            {
                return categoria_evento;
            }

            set
            {
                categoria_evento = value;
            }
        }

        public Restricao_Idade Restricao_idade
        {
            get
            {
                return restricao_idade;
            }

            set
            {
                restricao_idade = value;
            }
        }

        public string Caminho
        {
            get
            {
                return Caminho1;
            }

            set
            {
                Caminho1 = value;
            }
        }

        public string Caminho1
        {
            get
            {
                return caminho;
            }

            set
            {
                caminho = value;
            }
        }

        public string Endereco
        {
            get
            {
                return endereco;
            }

            set
            {
                endereco = value;
            }
        }

        public string Categoria
        {
            get
            {
                return categoria;
            }

            set
            {
                categoria = value;
            }
        }

        public string Restricao
        {
            get
            {
                return restricao;
            }

            set
            {
                restricao = value;
            }
        }

        public string Tipo
        {
            get
            {
                return tipo;
            }

            set
            {
                tipo = value;
            }
        }

        public string DataInicio
        {
            get
            {
                return dataInicio;
            }

            set
            {
                dataInicio = value;
            }
        }

        public string DataFim
        {
            get
            {
                return dataFim;
            }

            set
            {
                dataFim = value;
            }
        }

        public string HoraIn
        {
            get
            {
                return horaIn;
            }

            set
            {
                horaIn = value;
            }
        }

        public string HoraFim
        {
            get
            {
                return horaFim;
            }

            set
            {
                horaFim = value;
            }
        }

        public int IdUser
        {
            get
            {
                return idUser;
            }

            set
            {
                idUser = value;
            }
        }
    }
}