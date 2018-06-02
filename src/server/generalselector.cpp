#include "generalselector.h"

#include "lua.hpp"
#include "room.h"

#include <QDebug>

GeneralSelector::GeneralSelector(Room *room)
    : QObject(room)
{
    L = room->getLuaState();
    int error = luaL_dofile(L, "lua/general_select.lua");
    if (error) {
        QString error_msg = lua_tostring(L, -1);
        qDebug("Lua script error: %s", error_msg);
        exit(1);
    } else
        initialize();
}
