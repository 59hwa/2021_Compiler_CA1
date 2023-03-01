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
     UPDATE = 258,
     SET = 259,
     WHERE = 260,
     AND = 261,
     OR = 262,
     IS = 263,
     NOT = 264,
     ID = 265,
     LIKE = 266,
     BETWEEN = 267,
     END = 268,
     NULL_VAL = 269,
     STR_VAL = 270,
     NUM_VAL = 271,
     DEFAULT_VAL = 272,
     BOOL_VAL = 273,
     UPDATES = 274,
     MAX_FUNC = 275,
     MIN_FUNC = 276,
     AVG_FUNC = 277,
     SUM_FUNC = 278,
     ABS_FUNC = 279,
     CEIL_FUNC = 280,
     FLOOR_FUNC = 281,
     UPPER_FUNC = 282,
     LOWER_FUNC = 283
   };
#endif
/* Tokens.  */
#define UPDATE 258
#define SET 259
#define WHERE 260
#define AND 261
#define OR 262
#define IS 263
#define NOT 264
#define ID 265
#define LIKE 266
#define BETWEEN 267
#define END 268
#define NULL_VAL 269
#define STR_VAL 270
#define NUM_VAL 271
#define DEFAULT_VAL 272
#define BOOL_VAL 273
#define UPDATES 274
#define MAX_FUNC 275
#define MIN_FUNC 276
#define AVG_FUNC 277
#define SUM_FUNC 278
#define ABS_FUNC 279
#define CEIL_FUNC 280
#define FLOOR_FUNC 281
#define UPPER_FUNC 282
#define LOWER_FUNC 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

