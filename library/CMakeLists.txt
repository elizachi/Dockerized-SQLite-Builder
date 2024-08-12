cmake_minimum_required(VERSION 3.16)
project(SQLiteBuild)

set(CMAKE_C_STANDARD 11)

include_directories(include)

set(SOURCES
	src/sqlite3.c
	src/shell.c
)

set(HEADERS
	include/sqlite3.h
	include/sqlite3ext.h
)

if(WIN32)
	add_library(sqlite3 SHARED ${SOURCES} ${HEADERS})
	target_compile_options(sqlite3 PRIVATE /W4)
elseif(UNIX)
	add_library(sqlite3 SHARED ${SOURCES} ${HEADERS})
	target_compile_options(sqlite3 PRIVATE -Wall -Wextra)
endif()


