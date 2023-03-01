/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     SELECT = 258,
     FROM = 259,
     DISTINCT = 260,
     GROUP = 261,
     HAVING = 262,
     ORDER = 263,
     DESC = 264,
     ASC = 265,
     WHERE = 266,
     AND = 267,
     OR = 268,
     IS = 269,
     NOT = 270,
     ID = 271,
     LIKE = 272,
     BETWEEN = 273,
     END = 274,
     NULL_VAL = 275,
     STR_VAL = 276,
     NUM_VAL = 277,
     DEFAULT_VAL = 278,
     BOOL_VAL = 279,
     SELECTS = 280,
     MAX_FUNC = 281,
     MIN_FUNC = 282,
     AVG_FUNC = 283,
     SUM_FUNC = 284,
     ABS_FUNC = 285,
     CEIL_FUNC = 286,
     FLOOR_FUNC = 287,
     UPPER_FUNC = 288,
     LOWER_FUNC = 289
   };
#endif
/* Tokens.  */
#define SELECT 258
#define FROM 259
#define DISTINCT 260
#define GROUP 261
#define HAVING 262
#define ORDER 263
#define DESC 264
#define ASC 265
#define WHERE 266
#define AND 267
#define OR 268
#define IS 269
#define NOT 270
#define ID 271
#define LIKE 272
#define BETWEEN 273
#define END 274
#define NULL_VAL 275
#define STR_VAL 276
#define NUM_VAL 277
#define DEFAULT_VAL 278
#define BOOL_VAL 279
#define SELECTS 280
#define MAX_FUNC 281
#define MIN_FUNC 282
#define AVG_FUNC 283
#define SUM_FUNC 284
#define ABS_FUNC 285
#define CEIL_FUNC 286
#define FLOOR_FUNC 287
#define UPPER_FUNC 288
#define LOWER_FUNC 289




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

