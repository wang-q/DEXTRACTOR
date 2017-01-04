cmake_minimum_required(VERSION 3.6)
project(DEXTRACTOR)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES
    bax.c
    bax.h
    DB.c
    DB.h
    dex2DB.c
    dexar.c
    dexqv.c
    dexta.c
    dextract.c
    expr.c
    expr.h
    QV.c
    QV.h
    sam.c
    sam.h
    undexar.c
    undexqv.c
    undexta.c)

add_executable(DEXTRACTOR ${SOURCE_FILES})
