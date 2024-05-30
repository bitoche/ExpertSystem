PGDMP      4                |            carselectiondb    15.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    37278    carselectiondb    DATABASE     �   CREATE DATABASE carselectiondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE carselectiondb;
                postgres    false            �            1259    37310    __answer    TABLE     �   CREATE TABLE public.__answer (
    id integer NOT NULL,
    title character varying(255),
    curr_dialog_id integer,
    next_dialog_id integer
);
    DROP TABLE public.__answer;
       public         heap    postgres    false            �            1259    37309    __answer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.__answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.__answer_id_seq;
       public          postgres    false    215            
           0    0    __answer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.__answer_id_seq OWNED BY public.__answer.id;
          public          postgres    false    214            �            1259    37317    __dialog    TABLE     �   CREATE TABLE public.__dialog (
    id integer NOT NULL,
    helptext character varying(2047),
    isend boolean,
    title character varying(255)
);
    DROP TABLE public.__dialog;
       public         heap    postgres    false            �            1259    37316    __dialog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.__dialog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.__dialog_id_seq;
       public          postgres    false    217                       0    0    __dialog_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.__dialog_id_seq OWNED BY public.__dialog.id;
          public          postgres    false    216            j           2604    37313    __answer id    DEFAULT     j   ALTER TABLE ONLY public.__answer ALTER COLUMN id SET DEFAULT nextval('public.__answer_id_seq'::regclass);
 :   ALTER TABLE public.__answer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            k           2604    37320    __dialog id    DEFAULT     j   ALTER TABLE ONLY public.__dialog ALTER COLUMN id SET DEFAULT nextval('public.__dialog_id_seq'::regclass);
 :   ALTER TABLE public.__dialog ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                      0    37310    __answer 
   TABLE DATA           M   COPY public.__answer (id, title, curr_dialog_id, next_dialog_id) FROM stdin;
    public          postgres    false    215   R                 0    37317    __dialog 
   TABLE DATA           >   COPY public.__dialog (id, helptext, isend, title) FROM stdin;
    public          postgres    false    217   �                  0    0    __answer_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.__answer_id_seq', 21, true);
          public          postgres    false    214                       0    0    __dialog_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.__dialog_id_seq', 20, true);
          public          postgres    false    216            m           2606    37315    __answer __answer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT __answer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.__answer DROP CONSTRAINT __answer_pkey;
       public            postgres    false    215            o           2606    37324    __dialog __dialog_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.__dialog
    ADD CONSTRAINT __dialog_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.__dialog DROP CONSTRAINT __dialog_pkey;
       public            postgres    false    217            p           2606    37334 $   __answer fkkap1byhurr6nk3bsakbg82px3    FK CONSTRAINT     �   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT fkkap1byhurr6nk3bsakbg82px3 FOREIGN KEY (next_dialog_id) REFERENCES public.__dialog(id);
 N   ALTER TABLE ONLY public.__answer DROP CONSTRAINT fkkap1byhurr6nk3bsakbg82px3;
       public          postgres    false    215    3183    217            q           2606    37329 $   __answer fkkeivvvj8med8la85y5kx5jsvo    FK CONSTRAINT     �   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT fkkeivvvj8med8la85y5kx5jsvo FOREIGN KEY (curr_dialog_id) REFERENCES public.__dialog(id);
 N   ALTER TABLE ONLY public.__answer DROP CONSTRAINT fkkeivvvj8med8la85y5kx5jsvo;
       public          postgres    false    217    215    3183               \  x�UQmN�P��{��ScX���aJ�N�c4z�%Eh9þ9��Q��03�3�/&}��?8��J�t�K�"��S�w��vZ��� ־4e��X��b���g�j xm~��՝�����A�������/���`C��'Rt�ԖR��<�'����&�0TC�qN�����F�h���5��	�'�������Cp��P�,�[ht{LX����T��s(�%�w\"��ʆ�\g�bj�B����:JH�%�(q�p�pA����5��Y� /
�F%,�i�ol'IY����?w|�T��2�ܸ���d�R��G$�8ۛ�F�lh���X,h�������_�3�9�NB         '  x��Z�n�F>�O� �Uҿ�� MҢ����Nk4� �9�Iu��v�-��>+�EI�+,ߨ��r�%E�EGڋE.�g�ofggݨ�?�88AO��R�U��?���3<\��ki��Tȁ��D�m�n���u��ip"G�]]4N���π'��h��� �/=�v�t��A?G�)h�#^������%�
4����wI�B��A_^�m���i��<�5}$�O�#�Ҵ�V����	��~r$���� 9t<���8ޒ`���0CRTዱ�F�BX��+����*��P�	�v@b���):���J"��cI0@�ZtB�f��h �&	�����Kb��BB<����V��pos��X�N&7dshCr@����B*��A��0�3 #3�SK�^9���X��1�1��}���dU�2�yQ|
?C��4�x0��E��ǔ�Xm�����U�b����V5�猴Uc
'1�����l��l���N�*��ß�^���i���Sii�F:4�5^$��
�����<8b#��~pN�U�8cPf�G;�3�`��Pxkۏ�W���\�,�
��p�
ۇ �՝E3��3u�Ms%��P�1&�czjWQ�,�h�j��$ȡ�gʘX^G�H�������>�
l1���ؿ�~�gC��hc^�!g�Pؔ'������FQ�ٿ�6]��<�>L	�P�8zI�s���z�������	W�kf
Ch�By%�~J�-�X4�p0�0�����"�ɏ9G����}!�փ��My�,{���FhO��Lq�h_&Ժ�a���3��lW�Ù����g,�#�a���jm#�N��gQ^����a&|15��S���(�jX�&`V�����˺�%�C�}I�������v:�;���S>��=��PY��q}��ZX&��<B��(lܸw;���i5� ^�ȣ��u�<+��tN�y�Y`	Si�H��6��nVçܾ��G� �{ ��x3���"X�	v��eX�k��Sy?������s��B�֨t��U�T�_��t+�+�^�;r ��Aq7, t��e�w)x��U���:0�Qy#�a�c��6�W�
b��H�̘#o��T`+x�f����H���r��%��¨ܯaW�U�s��(Vi^��@T[���X���$�F$!+�'� �cvf�V�s�c��zN�9��/�&/�6|��<Yl��������n{^_/xfe����c�O��Az���r�;�L�eP$��(V�-�j/'��9m&6b2x���|�ʘz�j��x�Ѷ�e�ɣ���҇B�c����)큿v�{�8�����
-|���I]Oj�^�:��-��j�X׸#.7�5�<Ӛ�D�E�ܙ����u�E�%I�@),�˅��8>�i�1'���5��<z��S��{,J������f�'��A"���7�A�f���֫��g?���!)(a�c�B늨@(S9���TBdvt1��]ʑM�
e�˯_~�H���爂�^��qo�>�[/;������������1�Կ��W���[��/��#     