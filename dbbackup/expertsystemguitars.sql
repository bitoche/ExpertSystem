PGDMP  1    !                |            expertsystemguitars    15.2    16.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            	           1262    27422    expertsystemguitars    DATABASE     �   CREATE DATABASE expertsystemguitars WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
 #   DROP DATABASE expertsystemguitars;
                postgres    false            �            1259    27524    __answer    TABLE     �   CREATE TABLE public.__answer (
    id integer NOT NULL,
    title character varying(255),
    curr_dialog_id integer,
    next_dialog_id integer
);
    DROP TABLE public.__answer;
       public         heap    postgres    false            �            1259    27523    __answer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.__answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.__answer_id_seq;
       public          postgres    false    215            
           0    0    __answer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.__answer_id_seq OWNED BY public.__answer.id;
          public          postgres    false    214            �            1259    27531    __dialog    TABLE     �   CREATE TABLE public.__dialog (
    id integer NOT NULL,
    isend boolean,
    title character varying(255),
    helptext character varying(510)
);
    DROP TABLE public.__dialog;
       public         heap    postgres    false            �            1259    27530    __dialog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.__dialog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.__dialog_id_seq;
       public          postgres    false    217                       0    0    __dialog_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.__dialog_id_seq OWNED BY public.__dialog.id;
          public          postgres    false    216            j           2604    27527    __answer id    DEFAULT     j   ALTER TABLE ONLY public.__answer ALTER COLUMN id SET DEFAULT nextval('public.__answer_id_seq'::regclass);
 :   ALTER TABLE public.__answer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            k           2604    27534    __dialog id    DEFAULT     j   ALTER TABLE ONLY public.__dialog ALTER COLUMN id SET DEFAULT nextval('public.__dialog_id_seq'::regclass);
 :   ALTER TABLE public.__dialog ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217                      0    27524    __answer 
   TABLE DATA           M   COPY public.__answer (id, title, curr_dialog_id, next_dialog_id) FROM stdin;
    public          postgres    false    215   ?                 0    27531    __dialog 
   TABLE DATA           >   COPY public.__dialog (id, isend, title, helptext) FROM stdin;
    public          postgres    false    217   �                  0    0    __answer_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.__answer_id_seq', 49, true);
          public          postgres    false    214                       0    0    __dialog_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.__dialog_id_seq', 45, true);
          public          postgres    false    216            m           2606    27529    __answer __answer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT __answer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.__answer DROP CONSTRAINT __answer_pkey;
       public            postgres    false    215            o           2606    27536    __dialog __dialog_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.__dialog
    ADD CONSTRAINT __dialog_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.__dialog DROP CONSTRAINT __dialog_pkey;
       public            postgres    false    217            p           2606    27566    __answer currdia to diaid    FK CONSTRAINT     �   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT "currdia to diaid" FOREIGN KEY (curr_dialog_id) REFERENCES public.__dialog(id) NOT VALID;
 E   ALTER TABLE ONLY public.__answer DROP CONSTRAINT "currdia to diaid";
       public          postgres    false    217    3183    215            q           2606    27571    __answer nextdia to diaid    FK CONSTRAINT     �   ALTER TABLE ONLY public.__answer
    ADD CONSTRAINT "nextdia to diaid" FOREIGN KEY (next_dialog_id) REFERENCES public.__dialog(id) NOT VALID;
 E   ALTER TABLE ONLY public.__answer DROP CONSTRAINT "nextdia to diaid";
       public          postgres    false    215    3183    217               r  x�mR[n�@��:' �Þ�]��&?�@@$��+l�����gh߈�]�Y�|�U�SU��*�-��b�˯������� 0,@�G�����O�i�������_�y�%}���rԥB��A���?�%O�'O2�vP?7������t��Q�F���7���5(C��n�С���-�w�����h@��>�-w�L�3�Ckc���:.���m��U����f�����25��<qN��_�ӊ[���+ss����V��z+�mhr�o��6�m; ����b��
��b��D(n�����a�AEx�sp3>���F���uG.[�KB��Y�yE�U2#��Q�C�Ɣ�"��C$��\8b�q�����K#         �  x��[_o��}�����EQ���c��İ�R�/���Be*���(�Q96l�@�iҗ<8Q<�D���p��:v�v��ȣ";}�-��������7��Ņ�?Υ���L�l7��O$�q���l/{-�#zf;�^M�qz��"ہ������]�-N�i�F�q>>�WIz�����H�f{7���g8��
/x�ԝ5a��ἰ��5aT���W�V>����� Vj�Lh0//�s�v��!)�uߟ�Asqn��G,� ����𱠏���>����Ǜ_� �}����0\����
��ާs�O8!�$h����>���v�����W(�D�i�3�>B����6ZnT��4�?f���]zd�}������N�k��?��A-��|Ҏ��WJˠ������!F��	}5Bߋ`���v�K�h�
,����<=��'�R� ��U8�7P�dUVF�:�Q�C[�Ë<z�~>si':T{�;|&͢7�`B\-Bq��aPg3lҨ�Cp旴F�
����V������ ��\Xn��k�|h�ޚ}K�Z�n�>��?=��x�o�h��#�E�y_2pLU��l(�6j��P�O�ƴ�n#h�C��Kr�'-�}K�1��I�^1i�k���=r�e�'��3Bg��j�D&\<�Z>����"~�{�И���A��[JP��c�#XBѿ�#	?ўm� >/ܳ��K-�!m����+u���v�1�Z��r��h��c8b�1|�g!����<m��W���%�����z��Wq�֝��|k.�� Mcѓ�����/���R�� �l;
�����=�Z�������e_T
��U&{��#�9y�μ� ȫj�8y�Z�$�NLL�S�6&W�h~��j47"�G1~��l���Q�h���'�\_�ۅ����d{J	,s(����G��>�$����u��&����O�4���[c���Ę��N^,Q��F*{�0́L}S��II�X)!y>ݐ:$h#^f@�c�aG��)�Pj$�l<�闰�1�7�	�w�a�	�yy���>ӹ�� E��B�����D%�I����	2�3���+�O�鄞$p�a�(�`ByDrU`_pԜ	��1X���©���.�:>1���O���E{��=O?)�N�����N�o1���X��eL�M09�K���h�~^G�D3����������A,S�$>���p�"
��^h�}܆��������6��Z%ouњ�V�i@�Cv�@4-t���Y�;��VM\��������ɘ�À��D� ��S��v�ئf~W�,,��:4#�Ė�.DG�![� ɓ�@ϳj����	:W<U�m�59M��[��<��
Ո<�aр������d#cE�U֜04bRɏ=��(��y�G\��D�`�>v;<�ືz���&6m�g�2�,?�ĩ�(�>a(���\�&p�}׽�e/��m����8�.,�<�RO}.�Z�e�O-�%��B���&n���<�;�ng{[��iu.�������rJ��@�D�p�8���Ӂ�*Q�p�W� ������%6�n��d���Q3�7�2G0n�,3���Z����4���e�Ăuu�`V���+�@V�^��no�ov���rs�����mP}�+V��:�mq����^�@���~�����
�=0����֋m����֝H�{$�;�ߺ/����;T�l&��n��P
eM��ך�j�����KQi�%'�n)TB��L96��$,G=*l.҅�������m��J}��hl�<�C��Y�4�d�{��r���:��In��S���E;1��)�#��1s�SŮ8��a�`�Z�G		CB�K�jR�yE(ZWa&.ă{��$>{��7��A�h�#6uӋ=��S�>��:���\Fۄ n�a��}�gDd��2D�ch#�rW1�3JE�s1��\ҖY��^�`�u�-1��u��{��>+���`��'���D��
���O����KҚ��=�~{��n9E��Q]7T5��� �-O,���_U<z����pfD)�'��;�V���Fs�R�à�W��|	���d^�v3h�WD����o4!?0�D�m{�ջ�I��dJ��j��0��%�!>�a1�������(����?Y�"t�KI@)WC�Op�B��J"~�kXA2�äc�}�J��y�
!}������V[\_X�7�ĝ����O�P^u�t��>il}���>Y߄���f��3q��&V6�:�ٺ>#C�lX�Ub����K�b���^�ƺ��h�l;�)�^a����(���qR�sl%�5m�X~���)�ⲋ5��^�b��n]��s���_�E�+m�JO��!�8��AѰ⣼��WѐpP�>�auPG�o��ĀD�E��7oJd�8?�͡�:!T6�ā��X!}��U��4{��_��o�	9tgU�:f8��)H1�K�#�җ�ѥ��ݱ�ѵ�A��9�xL1�	��-�@|#��|ٽ��僜����s�D�<����	a�C"nX�����������5U��07I��f�`���X-��W��Ыr8i����<���%ꀒ�{�'į�u�B�'�y�{�����X}�s�	�:��R����4cg�	,�,�+����΃qN�7ӾM�pھ9EAX(8�rl���<Ά�ξV�qm����*��3|}ʕ�����1����dj���Sdo�ߑP�+��by��Cǖ�u$}��%��C����V��Ps�PKY��6��-�~#Xl���������v1�\����V��,㷖�������o�J��?����q���6�${��o�xߪZ��F>i���L�7�D�B�^��e"�Q����dʎ���b�Jz�=�_���*ι���f�ب���p[�`�8�o����j��IG���w�6�&W�}�P^��������f�1ti��R]�����"a���1�-���s&g C�K�]��cYu~H��	���gtwF\��	5Z��^]�V8� �}㸯nW���f'��m����D�}�t��\�B�_�U��\q�hz���O܄o��#���g�#����Wj�����8M4�K�n�{�P��p	�.k8��t���"�4�s�t/�i4�܂F��F�M.��     