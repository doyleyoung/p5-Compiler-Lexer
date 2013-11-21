package Compiler::Lexer::TokenType;
use strict;
use warnings;
use constant {
    T_Return => 0,
    T_Add => 1,
    T_Sub => 2,
    T_Mul => 3,
    T_Div => 4,
    T_Mod => 5,
    T_ThreeTermOperator => 6,
    T_Greater => 7,
    T_Less => 8,
    T_StringAdd => 9,
    T_Ref => 10,
    T_Glob => 11,
    T_BitNot => 12,
    T_BitOr => 13,
    T_Or => 14,
    T_BitAnd => 15,
    T_And => 16,
    T_BitXOr => 17,
    T_XOr => 18,
    T_StringMul => 19,
    T_AddEqual => 20,
    T_SubEqual => 21,
    T_MulEqual => 22,
    T_DivEqual => 23,
    T_ModEqual => 24,
    T_GreaterEqual => 25,
    T_LessEqual => 26,
    T_EqualEqual => 27,
    T_Diamond => 28,
    T_Compare => 29,
    T_PolymorphicCompare => 30,
    T_RegOK => 31,
    T_RegNot => 32,
    T_NotEqual => 33,
    T_ArraySize => 34,
    T_StringLess => 35,
    T_StringLessEqual => 36,
    T_StringGreater => 37,
    T_StringGreaterEqual => 38,
    T_StringEqual => 39,
    T_StringNotEqual => 40,
    T_StringCompare => 41,
    T_Inc => 42,
    T_Dec => 43,
    T_Exp => 44,
    T_PowerEqual => 45,
    T_DefaultEqual => 46,
    T_LeftShift => 47,
    T_RightShift => 48,
    T_AndBitEqual => 49,
    T_OrBitEqual => 50,
    T_NotBitEqual => 51,
    T_OrEqual => 52,
    T_AndEqual => 53,
    T_Slice => 54,
    T_DefaultOperator => 55,
    T_ToDo => 56,
    T_VarDecl => 57,
    T_FunctionDecl => 58,
    T_Method => 59,
    T_Assign => 60,
    T_Is => 61,
    T_IsNot => 62,
    T_Not => 63,
    T_BuiltinFunc => 64,
    T_RequireDecl => 65,
    T_Import => 66,
    T_SpecificKeyword => 67,
    T_DataWord => 68,
    T_ModWord => 69,
    T_AUTOLOAD => 70,
    T_CORE => 71,
    T_DESTROY => 72,
    T_STDIN => 73,
    T_STDOUT => 74,
    T_STDERR => 75,
    T_Redo => 76,
    T_Next => 77,
    T_Last => 78,
    T_Goto => 79,
    T_Continue => 80,
    T_Do => 81,
    T_Break => 82,
    T_Handle => 83,
    T_LocalDecl => 84,
    T_OurDecl => 85,
    T_StateDecl => 86,
    T_UseDecl => 87,
    T_UsedName => 88,
    T_RequiredName => 89,
    T_IfStmt => 90,
    T_ElseStmt => 91,
    T_ElsifStmt => 92,
    T_UnlessStmt => 93,
    T_UntilStmt => 94,
    T_WhenStmt => 95,
    T_GivenStmt => 96,
    T_DefaultStmt => 97,
    T_Comma => 98,
    T_Colon => 99,
    T_SemiColon => 100,
    T_LeftParenthesis => 101,
    T_RightParenthesis => 102,
    T_LeftBrace => 103,
    T_RightBrace => 104,
    T_LeftBracket => 105,
    T_RightBracket => 106,
    T_ArrayDereference => 107,
    T_HashDereference => 108,
    T_ScalarDereference => 109,
    T_ShortScalarDereference => 110,
    T_ShortArrayDereference => 111,
    T_ShortHashDereference => 112,
    T_ShortCodeDereference => 113,
    T_ArraySizeDereference => 114,
    T_Key => 115,
    T_BareWord => 116,
    T_Arrow => 117,
    T_Pointer => 118,
    T_NamespaceResolver => 119,
    T_Namespace => 120,
    T_Package => 121,
    T_Class => 122,
    T_CallDecl => 123,
    T_CodeRef => 124,
    T_WhileStmt => 125,
    T_ForStmt => 126,
    T_ForeachStmt => 127,
    T_Annotation => 128,
    T_ArgumentArray => 129,
    T_SpecificValue => 130,
    T_ConstValue => 131,
    T_ProgramArgument => 132,
    T_LibraryDirectories => 133,
    T_Environment => 134,
    T_Include => 135,
    T_Signal => 136,
    T_RegOpt => 137,
    T_RegQuote => 138,
    T_RegDoubleQuote => 139,
    T_RegList => 140,
    T_RegExec => 141,
    T_RegDecl => 142,
    T_RegMatch => 143,
    T_RegDelim => 144,
    T_HandleDelim => 145,
    T_RegMiddleDelim => 146,
    T_RegAllReplace => 147,
    T_RegReplace => 148,
    T_RegReplaceFrom => 149,
    T_RegReplaceTo => 150,
    T_FieldDecl => 151,
    T_TypeRef => 152,
    T_LabelRef => 153,
    T_LocalVarDecl => 154,
    T_GlobalVarDecl => 155,
    T_MultiLocalVarDecl => 156,
    T_MultiGlobalVarDecl => 157,
    T_Prototype => 158,
    T_Var => 159,
    T_CodeVar => 160,
    T_ArrayVar => 161,
    T_HashVar => 162,
    T_Int => 163,
    T_Double => 164,
    T_String => 165,
    T_RawString => 166,
    T_ExecString => 167,
    T_VersionString => 168,
    T_HereDocumentTag => 169,
    T_HereDocumentRawTag => 170,
    T_HereDocumentExecTag => 171,
    T_RawHereDocument => 172,
    T_HereDocument => 173,
    T_HereDocumentEnd => 174,
    T_FormatDecl => 175,
    T_Format => 176,
    T_FormatEnd => 177,
    T_Object => 178,
    T_RegExp => 179,
    T_Array => 180,
    T_Hash => 181,
    T_Operator => 182,
    T_LocalVar => 183,
    T_LocalArrayVar => 184,
    T_LocalHashVar => 185,
    T_GlobalVar => 186,
    T_GlobalArrayVar => 187,
    T_GlobalHashVar => 188,
    T_ArrayRef => 189,
    T_HashRef => 190,
    T_ArrayAt => 191,
    T_HashAt => 192,
    T_ArraySet => 193,
    T_HashSet => 194,
    T_Function => 195,
    T_Call => 196,
    T_Argument => 197,
    T_List => 198,
    T_Default => 199,
    T_Pod => 200,
    T_Comment => 201,
    T_WhiteSpace => 202,
    T_Undefined => 203
};
1;

package Compiler::Lexer::SyntaxType;
use strict;
use warnings;
use constant {
    T_Value => 0,
    T_Term => 1,
    T_Expr => 2,
    T_Stmt => 3,
    T_BlockStmt => 4
};
1;

package Compiler::Lexer::Kind;
use strict;
use warnings;
use constant {
    T_Return => 0,
    T_Operator => 1,
    T_Assign => 2,
    T_Decl => 3,
    T_Function => 4,
    T_SingleTerm => 5,
    T_Import => 6,
    T_SpecificKeyword => 7,
    T_DataWord => 8,
    T_ModWord => 9,
    T_AUTOLOAD => 10,
    T_CORE => 11,
    T_DESTROY => 12,
    T_Handle => 13,
    T_Redo => 14,
    T_Next => 15,
    T_Last => 16,
    T_Goto => 17,
    T_Continue => 18,
    T_Do => 19,
    T_Break => 20,
    T_Module => 21,
    T_Stmt => 22,
    T_DefaultStmt => 23,
    T_Comma => 24,
    T_Colon => 25,
    T_StmtEnd => 26,
    T_Symbol => 27,
    T_Modifier => 28,
    T_Term => 29,
    T_Namespace => 30,
    T_Package => 31,
    T_Class => 32,
    T_Annotation => 33,
    T_RegOpt => 34,
    T_RegPrefix => 35,
    T_RegReplacePrefix => 36,
    T_Ref => 37,
    T_Get => 38,
    T_Set => 39,
    T_Verbose => 40,
    T_Undefined => 41
};
1;
