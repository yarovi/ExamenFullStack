PGDMP     0    "                w         	   mediappbd     10.7 (Ubuntu 10.7-1.pgdg18.04+1)     10.7 (Ubuntu 10.7-1.pgdg18.04+1) g    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            &           1262    16581 	   mediappbd    DATABASE     {   CREATE DATABASE mediappbd WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE mediappbd;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            '           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13083    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            (           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16584    archivo    TABLE     �   CREATE TABLE public.archivo (
    id_archivo integer NOT NULL,
    filename character varying(255),
    filetype character varying(255),
    value bytea
);
    DROP TABLE public.archivo;
       public         postgres    false    3            �            1259    16582    archivo_id_archivo_seq    SEQUENCE     �   CREATE SEQUENCE public.archivo_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.archivo_id_archivo_seq;
       public       postgres    false    197    3            )           0    0    archivo_id_archivo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.archivo_id_archivo_seq OWNED BY public.archivo.id_archivo;
            public       postgres    false    196            �            1259    16595    consulta    TABLE     �   CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    fecha timestamp without time zone,
    id_especialidad integer NOT NULL,
    id_medico integer NOT NULL,
    id_paciente integer NOT NULL
);
    DROP TABLE public.consulta;
       public         postgres    false    3            �            1259    16601    consulta_examen    TABLE     j   CREATE TABLE public.consulta_examen (
    id_consulta integer NOT NULL,
    id_examen integer NOT NULL
);
 #   DROP TABLE public.consulta_examen;
       public         postgres    false    3            �            1259    16593    consulta_id_consulta_seq    SEQUENCE     �   CREATE SEQUENCE public.consulta_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.consulta_id_consulta_seq;
       public       postgres    false    199    3            *           0    0    consulta_id_consulta_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.consulta_id_consulta_seq OWNED BY public.consulta.id_consulta;
            public       postgres    false    198            �            1259    16608    detalle_consulta    TABLE     �   CREATE TABLE public.detalle_consulta (
    id_detalle integer NOT NULL,
    diagnostico character varying(70) NOT NULL,
    tratamiento character varying(300) NOT NULL,
    id_consulta integer NOT NULL
);
 $   DROP TABLE public.detalle_consulta;
       public         postgres    false    3            �            1259    16606    detalle_consulta_id_detalle_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_consulta_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.detalle_consulta_id_detalle_seq;
       public       postgres    false    202    3            +           0    0    detalle_consulta_id_detalle_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.detalle_consulta_id_detalle_seq OWNED BY public.detalle_consulta.id_detalle;
            public       postgres    false    201            �            1259    16616    especialidad    TABLE     v   CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    nombre character varying(50) NOT NULL
);
     DROP TABLE public.especialidad;
       public         postgres    false    3            �            1259    16614     especialidad_id_especialidad_seq    SEQUENCE     �   CREATE SEQUENCE public.especialidad_id_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.especialidad_id_especialidad_seq;
       public       postgres    false    204    3            ,           0    0     especialidad_id_especialidad_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.especialidad_id_especialidad_seq OWNED BY public.especialidad.id_especialidad;
            public       postgres    false    203            �            1259    16624    examen    TABLE     �   CREATE TABLE public.examen (
    id_examen integer NOT NULL,
    descripcion character varying(250) NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.examen;
       public         postgres    false    3            �            1259    16622    examen_id_examen_seq    SEQUENCE     �   CREATE SEQUENCE public.examen_id_examen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.examen_id_examen_seq;
       public       postgres    false    206    3            -           0    0    examen_id_examen_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.examen_id_examen_seq OWNED BY public.examen.id_examen;
            public       postgres    false    205            �            1259    16632    medico    TABLE     �   CREATE TABLE public.medico (
    id_medico integer NOT NULL,
    cmp character varying(12) NOT NULL,
    apellidos character varying(70) NOT NULL,
    nombres character varying(70) NOT NULL
);
    DROP TABLE public.medico;
       public         postgres    false    3            �            1259    16630    medico_id_medico_seq    SEQUENCE     �   CREATE SEQUENCE public.medico_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.medico_id_medico_seq;
       public       postgres    false    208    3            .           0    0    medico_id_medico_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.medico_id_medico_seq OWNED BY public.medico.id_medico;
            public       postgres    false    207            �            1259    16638    menu    TABLE     �   CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    icono character varying(20),
    nombre character varying(20),
    url character varying(50)
);
    DROP TABLE public.menu;
       public         postgres    false    3            �            1259    16747    menu_rol    TABLE     \   CREATE TABLE public.menu_rol (
    id_menu integer NOT NULL,
    id_rol integer NOT NULL
);
    DROP TABLE public.menu_rol;
       public         postgres    false    3            �            1259    16740    oauth_access_token    TABLE       CREATE TABLE public.oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256),
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);
 &   DROP TABLE public.oauth_access_token;
       public         postgres    false    3            �            1259    16645    paciente    TABLE     .  CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    apellidos character varying(70) NOT NULL,
    direccion character varying(150),
    dni character varying(8) NOT NULL,
    email character varying(55),
    nombres character varying(70) NOT NULL,
    telefono character varying(9)
);
    DROP TABLE public.paciente;
       public         postgres    false    3            �            1259    16643    paciente_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE public.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.paciente_id_paciente_seq;
       public       postgres    false    3    211            /           0    0    paciente_id_paciente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;
            public       postgres    false    210            �            1259    16653    reset_token    TABLE     �   CREATE TABLE public.reset_token (
    id bigint NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    id_usuario integer NOT NULL
);
    DROP TABLE public.reset_token;
       public         postgres    false    3            �            1259    16651    reset_token_id_seq    SEQUENCE     {   CREATE SEQUENCE public.reset_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reset_token_id_seq;
       public       postgres    false    3    213            0           0    0    reset_token_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.reset_token_id_seq OWNED BY public.reset_token.id;
            public       postgres    false    212            �            1259    16659    rol    TABLE     �   CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    descripcion character varying(255),
    nombre character varying(255)
);
    DROP TABLE public.rol;
       public         postgres    false    3            �            1259    16669    signo    TABLE     �   CREATE TABLE public.signo (
    id_signo integer NOT NULL,
    fecha timestamp without time zone,
    pulso integer,
    ritmo_respiratorio integer,
    temperatura integer,
    id_paciente integer NOT NULL
);
    DROP TABLE public.signo;
       public         postgres    false    3            �            1259    16667    signo_id_signo_seq    SEQUENCE     �   CREATE SEQUENCE public.signo_id_signo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.signo_id_signo_seq;
       public       postgres    false    216    3            1           0    0    signo_id_signo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.signo_id_signo_seq OWNED BY public.signo.id_signo;
            public       postgres    false    215            �            1259    16675    usuario    TABLE     �   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    estado boolean NOT NULL,
    clave character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �            1259    16683    usuario_rol    TABLE     b   CREATE TABLE public.usuario_rol (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);
    DROP TABLE public.usuario_rol;
       public         postgres    false    3            \           2604    16587    archivo id_archivo    DEFAULT     x   ALTER TABLE ONLY public.archivo ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivo_id_archivo_seq'::regclass);
 A   ALTER TABLE public.archivo ALTER COLUMN id_archivo DROP DEFAULT;
       public       postgres    false    197    196    197            ]           2604    16598    consulta id_consulta    DEFAULT     |   ALTER TABLE ONLY public.consulta ALTER COLUMN id_consulta SET DEFAULT nextval('public.consulta_id_consulta_seq'::regclass);
 C   ALTER TABLE public.consulta ALTER COLUMN id_consulta DROP DEFAULT;
       public       postgres    false    198    199    199            ^           2604    16611    detalle_consulta id_detalle    DEFAULT     �   ALTER TABLE ONLY public.detalle_consulta ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_consulta_id_detalle_seq'::regclass);
 J   ALTER TABLE public.detalle_consulta ALTER COLUMN id_detalle DROP DEFAULT;
       public       postgres    false    201    202    202            _           2604    16619    especialidad id_especialidad    DEFAULT     �   ALTER TABLE ONLY public.especialidad ALTER COLUMN id_especialidad SET DEFAULT nextval('public.especialidad_id_especialidad_seq'::regclass);
 K   ALTER TABLE public.especialidad ALTER COLUMN id_especialidad DROP DEFAULT;
       public       postgres    false    204    203    204            `           2604    16627    examen id_examen    DEFAULT     t   ALTER TABLE ONLY public.examen ALTER COLUMN id_examen SET DEFAULT nextval('public.examen_id_examen_seq'::regclass);
 ?   ALTER TABLE public.examen ALTER COLUMN id_examen DROP DEFAULT;
       public       postgres    false    205    206    206            a           2604    16635    medico id_medico    DEFAULT     t   ALTER TABLE ONLY public.medico ALTER COLUMN id_medico SET DEFAULT nextval('public.medico_id_medico_seq'::regclass);
 ?   ALTER TABLE public.medico ALTER COLUMN id_medico DROP DEFAULT;
       public       postgres    false    207    208    208            b           2604    16648    paciente id_paciente    DEFAULT     |   ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);
 C   ALTER TABLE public.paciente ALTER COLUMN id_paciente DROP DEFAULT;
       public       postgres    false    211    210    211            c           2604    16656    reset_token id    DEFAULT     p   ALTER TABLE ONLY public.reset_token ALTER COLUMN id SET DEFAULT nextval('public.reset_token_id_seq'::regclass);
 =   ALTER TABLE public.reset_token ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    212    213    213            d           2604    16672    signo id_signo    DEFAULT     p   ALTER TABLE ONLY public.signo ALTER COLUMN id_signo SET DEFAULT nextval('public.signo_id_signo_seq'::regclass);
 =   ALTER TABLE public.signo ALTER COLUMN id_signo DROP DEFAULT;
       public       postgres    false    215    216    216            	          0    16584    archivo 
   TABLE DATA               H   COPY public.archivo (id_archivo, filename, filetype, value) FROM stdin;
    public       postgres    false    197   9v                 0    16595    consulta 
   TABLE DATA               _   COPY public.consulta (id_consulta, fecha, id_especialidad, id_medico, id_paciente) FROM stdin;
    public       postgres    false    199   Vv                 0    16601    consulta_examen 
   TABLE DATA               A   COPY public.consulta_examen (id_consulta, id_examen) FROM stdin;
    public       postgres    false    200   sv                 0    16608    detalle_consulta 
   TABLE DATA               ]   COPY public.detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) FROM stdin;
    public       postgres    false    202   �v                 0    16616    especialidad 
   TABLE DATA               ?   COPY public.especialidad (id_especialidad, nombre) FROM stdin;
    public       postgres    false    204   �v                 0    16624    examen 
   TABLE DATA               @   COPY public.examen (id_examen, descripcion, nombre) FROM stdin;
    public       postgres    false    206   w                 0    16632    medico 
   TABLE DATA               D   COPY public.medico (id_medico, cmp, apellidos, nombres) FROM stdin;
    public       postgres    false    208   ew                 0    16638    menu 
   TABLE DATA               ;   COPY public.menu (id_menu, icono, nombre, url) FROM stdin;
    public       postgres    false    209   �w                  0    16747    menu_rol 
   TABLE DATA               3   COPY public.menu_rol (id_menu, id_rol) FROM stdin;
    public       postgres    false    220   ~x                 0    16740    oauth_access_token 
   TABLE DATA               �   COPY public.oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
    public       postgres    false    219   �x                 0    16645    paciente 
   TABLE DATA               d   COPY public.paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono) FROM stdin;
    public       postgres    false    211   b�                 0    16653    reset_token 
   TABLE DATA               H   COPY public.reset_token (id, expiracion, token, id_usuario) FROM stdin;
    public       postgres    false    213   ��                 0    16659    rol 
   TABLE DATA               :   COPY public.rol (id_rol, descripcion, nombre) FROM stdin;
    public       postgres    false    214   ��                 0    16669    signo 
   TABLE DATA               e   COPY public.signo (id_signo, fecha, pulso, ritmo_respiratorio, temperatura, id_paciente) FROM stdin;
    public       postgres    false    216   �                 0    16675    usuario 
   TABLE DATA               D   COPY public.usuario (id_usuario, estado, clave, nombre) FROM stdin;
    public       postgres    false    217   T�                 0    16683    usuario_rol 
   TABLE DATA               9   COPY public.usuario_rol (id_usuario, id_rol) FROM stdin;
    public       postgres    false    218   ć       2           0    0    archivo_id_archivo_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.archivo_id_archivo_seq', 1, false);
            public       postgres    false    196            3           0    0    consulta_id_consulta_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.consulta_id_consulta_seq', 11, true);
            public       postgres    false    198            4           0    0    detalle_consulta_id_detalle_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.detalle_consulta_id_detalle_seq', 7, true);
            public       postgres    false    201            5           0    0     especialidad_id_especialidad_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 5, true);
            public       postgres    false    203            6           0    0    examen_id_examen_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.examen_id_examen_seq', 3, true);
            public       postgres    false    205            7           0    0    medico_id_medico_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.medico_id_medico_seq', 6, true);
            public       postgres    false    207            8           0    0    paciente_id_paciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 127, true);
            public       postgres    false    210            9           0    0    reset_token_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reset_token_id_seq', 1, false);
            public       postgres    false    212            :           0    0    signo_id_signo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.signo_id_signo_seq', 53, true);
            public       postgres    false    215            f           2606    16592    archivo archivo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT archivo_pkey PRIMARY KEY (id_archivo);
 >   ALTER TABLE ONLY public.archivo DROP CONSTRAINT archivo_pkey;
       public         postgres    false    197            j           2606    16605 $   consulta_examen consulta_examen_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT consulta_examen_pkey PRIMARY KEY (id_consulta, id_examen);
 N   ALTER TABLE ONLY public.consulta_examen DROP CONSTRAINT consulta_examen_pkey;
       public         postgres    false    200    200            h           2606    16600    consulta consulta_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_pkey PRIMARY KEY (id_consulta);
 @   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_pkey;
       public         postgres    false    199            l           2606    16613 &   detalle_consulta detalle_consulta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.detalle_consulta
    ADD CONSTRAINT detalle_consulta_pkey PRIMARY KEY (id_detalle);
 P   ALTER TABLE ONLY public.detalle_consulta DROP CONSTRAINT detalle_consulta_pkey;
       public         postgres    false    202            n           2606    16621    especialidad especialidad_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad);
 H   ALTER TABLE ONLY public.especialidad DROP CONSTRAINT especialidad_pkey;
       public         postgres    false    204            p           2606    16629    examen examen_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.examen
    ADD CONSTRAINT examen_pkey PRIMARY KEY (id_examen);
 <   ALTER TABLE ONLY public.examen DROP CONSTRAINT examen_pkey;
       public         postgres    false    206            r           2606    16637    medico medico_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (id_medico);
 <   ALTER TABLE ONLY public.medico DROP CONSTRAINT medico_pkey;
       public         postgres    false    208            t           2606    16642    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         postgres    false    209            v           2606    16650    paciente paciente_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);
 @   ALTER TABLE ONLY public.paciente DROP CONSTRAINT paciente_pkey;
       public         postgres    false    211            x           2606    16658    reset_token reset_token_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reset_token DROP CONSTRAINT reset_token_pkey;
       public         postgres    false    213            |           2606    16666    rol rol_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public         postgres    false    214            ~           2606    16674    signo signo_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.signo
    ADD CONSTRAINT signo_pkey PRIMARY KEY (id_signo);
 :   ALTER TABLE ONLY public.signo DROP CONSTRAINT signo_pkey;
       public         postgres    false    216            �           2606    16689 $   usuario uk_cto7dkti4t38iq8r4cqesbd8k 
   CONSTRAINT     a   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_cto7dkti4t38iq8r4cqesbd8k UNIQUE (nombre);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uk_cto7dkti4t38iq8r4cqesbd8k;
       public         postgres    false    217            z           2606    16687 (   reset_token uk_shiutqgqq3m7hdrlmckbk4am6 
   CONSTRAINT     d   ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT uk_shiutqgqq3m7hdrlmckbk4am6 UNIQUE (token);
 R   ALTER TABLE ONLY public.reset_token DROP CONSTRAINT uk_shiutqgqq3m7hdrlmckbk4am6;
       public         postgres    false    213            �           2606    16682    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    217            �           2606    16690    consulta consulta_especialidad    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_especialidad FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad);
 H   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_especialidad;
       public       postgres    false    204    199    2926            �           2606    16695    consulta consulta_medico    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_medico FOREIGN KEY (id_medico) REFERENCES public.medico(id_medico);
 B   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_medico;
       public       postgres    false    199    208    2930            �           2606    16700    consulta consulta_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);
 D   ALTER TABLE ONLY public.consulta DROP CONSTRAINT consulta_paciente;
       public       postgres    false    2934    199    211            �           2606    16725    signo consulta_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY public.signo
    ADD CONSTRAINT consulta_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);
 A   ALTER TABLE ONLY public.signo DROP CONSTRAINT consulta_paciente;
       public       postgres    false    216    2934    211            �           2606    16715 !   detalle_consulta detalle_consulta    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_consulta
    ADD CONSTRAINT detalle_consulta FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);
 K   ALTER TABLE ONLY public.detalle_consulta DROP CONSTRAINT detalle_consulta;
       public       postgres    false    2920    202    199            �           2606    16735 '   usuario_rol fk3ftpt75ebughsiy5g03b11akt    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fk3ftpt75ebughsiy5g03b11akt FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 Q   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT fk3ftpt75ebughsiy5g03b11akt;
       public       postgres    false    217    218    2946            �           2606    16755 $   menu_rol fk8uyjomykqlidw6whr5a9vx16d    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fk8uyjomykqlidw6whr5a9vx16d FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);
 N   ALTER TABLE ONLY public.menu_rol DROP CONSTRAINT fk8uyjomykqlidw6whr5a9vx16d;
       public       postgres    false    220    209    2932            �           2606    16750 $   menu_rol fkjtnyb2364scc8ojb7vwh2jflj    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fkjtnyb2364scc8ojb7vwh2jflj FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);
 N   ALTER TABLE ONLY public.menu_rol DROP CONSTRAINT fkjtnyb2364scc8ojb7vwh2jflj;
       public       postgres    false    214    220    2940            �           2606    16730 '   usuario_rol fkkxcv7htfnm9x1wkofnud0ewql    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);
 Q   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql;
       public       postgres    false    214    218    2940            �           2606    16720 '   reset_token fkoc8cqwnb1m8ijoboimhcybrl4    FK CONSTRAINT     �   ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT fkoc8cqwnb1m8ijoboimhcybrl4 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 Q   ALTER TABLE ONLY public.reset_token DROP CONSTRAINT fkoc8cqwnb1m8ijoboimhcybrl4;
       public       postgres    false    217    2946    213            �           2606    16705 +   consulta_examen fkrjj1hrlcgiao8rmnygjc1vynh    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT fkrjj1hrlcgiao8rmnygjc1vynh FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);
 U   ALTER TABLE ONLY public.consulta_examen DROP CONSTRAINT fkrjj1hrlcgiao8rmnygjc1vynh;
       public       postgres    false    200    2920    199            �           2606    16710 +   consulta_examen fktjqr6mtxn3pr0dgm842qkg2jn    FK CONSTRAINT     �   ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT fktjqr6mtxn3pr0dgm842qkg2jn FOREIGN KEY (id_examen) REFERENCES public.examen(id_examen);
 U   ALTER TABLE ONLY public.consulta_examen DROP CONSTRAINT fktjqr6mtxn3pr0dgm842qkg2jn;
       public       postgres    false    206    2928    200            	      x������ � �            x������ � �            x������ � �            x������ � �         S   x�3��MM�L��KTHO�K-J��2��/�/*����2�t��KM���O�L�2�,(΄qL9+KS��KsJR�K�b���� u�         E   x�3���L/�K�,J��/���2�L��OT�L�,(�/.I,I�2�,J-�,���S�O.�I,�P\1z\\\ ���         3   x�3�442�LO,J�L��*M��2�052�L�H,�����E�\1z\\\ `@         �   x�}�An1E��)� �(-m��f���idw�4$#; z����5	 ���?���s0&u{�8�#�fW�@���Ϋ�����aýX�b��8$��ޤ�=�)��Nh�g�D�)%��6�l�������1����xq1.�K 3�ÁC��L9�y%|r����A�7��I�1��JCvjÆǨu�W������)BSF���G�m@          0   x�3�4�2bc 6bS 6bs � �Ō�bF@1#.K�X� ���         �	  x��YI��6<w?f@�O��Bb1�A&�0�� ��V)uui��*�$�����ﮅZk#_)-���5��#�o?~�w)�c|��a
=�]�w��Z�7�5���*σ���3����;�D� 	3*�7ט1:��P"s�}$[��,�G�1z��f��r�`W�����끄�U������b��$2fu.a�=��Cq�e��Ud��h �]g[�d6�8?���j%�ҡ�� A0��?�j��j�X�_���v�OL�rW|k���U�x�����e�k�yn(С�n��x궯�;�֘��,=�"69m�� ]dȺ�	ϡ���r�ŚP��F�����G,քw��Z��}��E��&֥�B6S�!Hu4:�xhD�D�yZ(m6b��qs�)1�4.�vϩ��2KQ+Rz��B��,��b�lu��\b��*Z��Xr���_V�,YT��C�Ӽ�f��v<Wy��Έm�ߩ���}��x�5�K�<UCe�Ǒ�����3��f�܃O�WD	3eb�w��@�����c�C[�̄?�da����j!���yC�bqե1��C��~*��[}@����F��g��F%�jS�k2�k����|�:���̐�PB}�ю�i55z��IU{ �ֿ��C��B��/��ꖉļ��c��@��>�5�H�ˌg�ɶ߬��<���jVȝ���̰�T����qD�f��[8{�,#S�"��;����}��'�O��t�M��J*�E�� B� إ� ��R�*�����E�	��'�����F�[���<�-�0a�"H��ȏ��W�0pŌ�0EX!'�u�;���������R%w=����/2�@��,���z�R��3p�@_�+��}�1q�p4���E?�?��U���O�?���^<����Vؤz�8 ���G�k�W��ĻA�w��;&�G~$��_A��2k�C���[T���ޘ�a+��܂�Q�<�p07��D��X�3��8TA���A���!#0��zE��A�����#bo�#��~�}?�nF����d�eZ���K�R�}^��"��?p��
-��	���؈��HT���~C�X����zM;���BJN������Gmz�{��-�������:�G������y����4�w�V	�p0+KZ����'�z'�+Z�7�C���c{w��߱�`\�E�"�J;��~
��'x�_���C<£/�3
ng/�|���ĕ�ť��1�}��G�'�I���3��>;J���]U�E�+ꨌ�R��k�8dߐ1z�ƃ@�>�ILf�A���䡤�z��|�3�c6��c<g�o���|�5��D�o��ncM�z��>j���ڌϻ�gZ��g_�;��wtjGeSl�������up~<�ړ��e�>-_Sׯu�\�� j��4���2|��Ӊk��-~�>oXG����h?t��h�:\O�j�����Qo��D�Ȅt�	~���<����]�vI۩�n]Fՠ�ce�[ot��XB^��	�;	��(�LS�/~�c�K�F��8�8��Ә��#�V�w��KQ2����#��NZu��ݥ�����')t��ܜg,a�����i��s=��+#fxޝ<I��6v�<��$ǿ�T`�����۶��p�m���>�d��[̕���gh�yS�Ulm��m-��pF�V���W1[��&��c��p����B��t?��g��V�{��9��n�t�3�u\�{��Y����?q�_x>�,�©֤[ܶ�W���WVO)���ǩ�k��E*H�c?���6���=U�cϠ�g�d���S��^/��#*ƕ�*T�aid��K�Ǎ��+�k�q�Ḣ�Y�Q�q�>�
�x����1:F���W6v�1�����TAܫ��G͜=�֜�ɔ}�Xh=��Qg�Wx�=�Ch��qr�Q9z��y�iG���)0��6{G͖���n;�����k��&oKዜ�B�.��󎈂��˧��n�)"| +h��w�Żhf���ycUʼu?�ʮ#�ɵT���%�=���V�g�J��n�7D3��șk�Ayg�%>���s�a�UN���Fd����ܙ�ۻC�,4�ӵ'{�+w���1�����v9�#��4�c���~�?Z�0�}��xF r���-f�{�qH3겹�!L�<���E�h�����m5+6�&�G�m9�-���d�^�El6ޅ�n�R�TSbSrY�J�k��v}Kq��V5=���3��:�i������,��!-�%zr��@r��x�Vc�N��bD�!��r.�����ʈ� ��X\j����`0S�,g���	iU��ቊ��OE�t��cu�;�a>dOÿ�͕Tr��˚J�	^���:�vZ�x�yƍ���*K3���S^"�rM�;�??|�����'�p���Շ�-����yO���_՘����������� v�0         '  x�m�ێ�H@�]_�/����[z���8;��b1l��
H���67�)
�H��q������u�O�c�.R&R�,��f��s۬7_��m�f��WI�1��b��� 1!���+��HP�Q��ؕ~��LcF?3�:�:���g䵨|'3�����Еw�Z�0�=3e���yq�8�",x.\,���B8������ŝRǁ�Ϳ�e�����|��
V��*�j?i�
������viu��!c�B�X?	aS��J{t�
���ڕ��[�EFa_�}�Yb���T�2��2��������ǲ�������2�XE�1ϣ�&���D����lC�!	o_J�pm�08CR���y�p�)$a�K���n�o$p�.$��^�Iˡ��~!	��P,����D/��*6&c@`/$���\1��Y�]H�����^�I��-�j�O;�3��P�K���2,��P��/���6lm�J��bu�6Cf����X�B^L��[k�-��m��4H�"�(��u
h@b1!Fw3���^(i>�tw���bhB�^�W�<�=KAb14ժ/\�F2����.2$Cb&o�0�`/4�E`Z3	[�	+S��������G�zt"��W����PX
MHq�b4
{�	/|�*��f����bT��d��PbTO�0�(��!��E�cK��;�`��� ��0��Q=����0�?�#ZXel������g�8�H�C�1u�-bAc7�F@b3�XC5�޾V*����P����@c/��iXWs�=b����Z�}w�������n�)	a	#�u�G�7�?6�p�f������+�ap��vN�	��}�O-��9n��:ɬ֙5i�J�4Ǐ�?���w�r? ���sX���a�n��z�|9_ o���l�c߄o�.dw���k��'��D�8G�4����m��5���zb}j:7؇лS�ɖ���r�>9�W��5����f������t��k�㭲�L�~�Nv��{u�����4L
�sH�W��z����C��W �V�K            x������ � �         L   x�3�tL����,.)JL�/�tt����2�-.M,���v�2�(*΄(RHIUHJ,N�)�%�Ŝ.N�\1z\\\ �IT         2   x�3�420��50�54R04�26�2��301�44�4�41�4������� ���         `   x�3�,�T1JT14P�*52ȴ4�
q�J4.M43�
�w�vJ6��s+q�7.(6J�ps+���pv�����,�O�OI�2�Ԥ����T�=... �*�            x�3�4�2�4�2�4����� /     