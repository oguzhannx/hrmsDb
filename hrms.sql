PGDMP                         y            hrms    13.2    13.2      ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16584    hrms    DATABASE     a   CREATE DATABASE hrms WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE hrms;
                postgres    false            ?            1259    16763 
   candidates    TABLE       CREATE TABLE public.candidates (
    id integer NOT NULL,
    first_name character varying(15) NOT NULL,
    last_name character varying(15) NOT NULL,
    idendity_number character varying(11) NOT NULL,
    birth_date date NOT NULL,
    is_mernis_confirmed integer NOT NULL
);
    DROP TABLE public.candidates;
       public         heap    postgres    false            ?            1259    16758 	   employees    TABLE     ?   CREATE TABLE public.employees (
    id integer NOT NULL,
    first_name character varying(15) NOT NULL,
    last_name character varying(15) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            ?            1259    16753 	   employers    TABLE     #  CREATE TABLE public.employers (
    id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    web_adress character varying(45) NOT NULL,
    phone_number character varying(15) NOT NULL,
    is_mernis_confirmed integer NOT NULL,
    is_employee_confirmed integer NOT NULL
);
    DROP TABLE public.employers;
       public         heap    postgres    false            ?            1259    16813 
   job_titles    TABLE     \   CREATE TABLE public.job_titles (
    id integer NOT NULL,
    name character(1) NOT NULL
);
    DROP TABLE public.job_titles;
       public         heap    postgres    false            ?            1259    16748    users    TABLE     |   CREATE TABLE public.users (
    id integer NOT NULL,
    email character(1) NOT NULL,
    password character(1) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16773    with_employee_verification    TABLE     ?   CREATE TABLE public.with_employee_verification (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    is_confirmed boolean NOT NULL
);
 .   DROP TABLE public.with_employee_verification;
       public         heap    postgres    false            ?            1259    16768    with_mernis_verification    TABLE     m   CREATE TABLE public.with_mernis_verification (
    id integer NOT NULL,
    is_confirmed boolean NOT NULL
);
 ,   DROP TABLE public.with_mernis_verification;
       public         heap    postgres    false            ?          0    16763 
   candidates 
   TABLE DATA           q   COPY public.candidates (id, first_name, last_name, idendity_number, birth_date, is_mernis_confirmed) FROM stdin;
    public          postgres    false    203   ?'       ?          0    16758 	   employees 
   TABLE DATA           >   COPY public.employees (id, first_name, last_name) FROM stdin;
    public          postgres    false    202   ?'       ?          0    16753 	   employers 
   TABLE DATA           {   COPY public.employers (id, company_name, web_adress, phone_number, is_mernis_confirmed, is_employee_confirmed) FROM stdin;
    public          postgres    false    201   (       ?          0    16813 
   job_titles 
   TABLE DATA           .   COPY public.job_titles (id, name) FROM stdin;
    public          postgres    false    206   (       ?          0    16748    users 
   TABLE DATA           4   COPY public.users (id, email, password) FROM stdin;
    public          postgres    false    200   ;(       ?          0    16773    with_employee_verification 
   TABLE DATA           S   COPY public.with_employee_verification (id, employee_id, is_confirmed) FROM stdin;
    public          postgres    false    205   X(       ?          0    16768    with_mernis_verification 
   TABLE DATA           D   COPY public.with_mernis_verification (id, is_confirmed) FROM stdin;
    public          postgres    false    204   u(       ?           2606    16767    candidates candidates_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_pkey;
       public            postgres    false    203            =           2606    16762    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    202            ;           2606    16757    employers employers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employers DROP CONSTRAINT employers_pkey;
       public            postgres    false    201            E           2606    16817    job_titles job_titles_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.job_titles
    ADD CONSTRAINT job_titles_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.job_titles DROP CONSTRAINT job_titles_pkey;
       public            postgres    false    206            9           2606    16752    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    200            C           2606    16777 :   with_employee_verification with_employee_verification_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.with_employee_verification
    ADD CONSTRAINT with_employee_verification_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.with_employee_verification DROP CONSTRAINT with_employee_verification_pkey;
       public            postgres    false    205            A           2606    16772 6   with_mernis_verification with_mernis_verification_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.with_mernis_verification
    ADD CONSTRAINT with_mernis_verification_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.with_mernis_verification DROP CONSTRAINT with_mernis_verification_pkey;
       public            postgres    false    204            J           2606    16783    candidates candidates_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_id_fkey FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;
 G   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_id_fkey;
       public          postgres    false    203    2873    200            K           2606    16793 .   candidates candidates_is_mernis_confirmed_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_is_mernis_confirmed_fkey FOREIGN KEY (is_mernis_confirmed) REFERENCES public.with_mernis_verification(id) NOT VALID;
 X   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_is_mernis_confirmed_fkey;
       public          postgres    false    203    204    2881            I           2606    16778    employees employees_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_id_fkey FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;
 E   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_id_fkey;
       public          postgres    false    202    2873    200            F           2606    16788    employers employers_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_id_fkey FOREIGN KEY (id) REFERENCES public.users(id) NOT VALID;
 E   ALTER TABLE ONLY public.employers DROP CONSTRAINT employers_id_fkey;
       public          postgres    false    200    201    2873            H           2606    16808 .   employers employers_is_employee_confirmed_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_is_employee_confirmed_fkey FOREIGN KEY (is_employee_confirmed) REFERENCES public.with_employee_verification(id) NOT VALID;
 X   ALTER TABLE ONLY public.employers DROP CONSTRAINT employers_is_employee_confirmed_fkey;
       public          postgres    false    201    205    2883            G           2606    16803 ,   employers employers_is_mernis_confirmed_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employers_is_mernis_confirmed_fkey FOREIGN KEY (is_mernis_confirmed) REFERENCES public.with_mernis_verification(id) NOT VALID;
 V   ALTER TABLE ONLY public.employers DROP CONSTRAINT employers_is_mernis_confirmed_fkey;
       public          postgres    false    201    204    2881            L           2606    16798 F   with_employee_verification with_employee_verification_employee_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.with_employee_verification
    ADD CONSTRAINT with_employee_verification_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id) NOT VALID;
 p   ALTER TABLE ONLY public.with_employee_verification DROP CONSTRAINT with_employee_verification_employee_id_fkey;
       public          postgres    false    202    205    2877            ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     