local DenotionArray = {
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "_",
    "-",
    "+",
    "=",
    "#",
    "(",
    ")",
    "{",
    "}",
    "[",
    "]",
    "<",
    ">",
    "`",
    "´",
    "!",
    "?",
    ":",
    ";",
    ",",
    ".",
    "~",
    "^",
    "°",
    "*",
    "@",
    "$",
    "?",
    "£",
    "%",
    "&",
    "ß",
    "Ä",
}
local function GetIndex(Char)
    for i,v in ipairs(DenotionArray) do
        if v == Char then
          return i
        end
    end
end

local function ConvertInto(Num)
    local res = ""
    local rem = 1;
    while Num >= 0 and rem >= 0 do 
        rem = Num%69
        Num = (Num - rem)/69
        res = DenotionArray[rem+1] .. res
        if Num == 0 then
            Num = -1
        end
    end
    return res
end

local function ConvertOutOf(Str)
    Str = (tostring(Str)):upper()
    local res = 0;
    local indx = #(tostring(Str));
    for c in (tostring(Str)):gmatch(".") do
      indx = indx - 1   
      res = res + ((GetIndex(c)-1) * 69^indx)  
    end
    return res
end
