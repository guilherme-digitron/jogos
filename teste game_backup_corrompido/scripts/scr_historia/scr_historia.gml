// Conta caracteres "visíveis" (ignora tags)
function hist_count_shown(txt) {
    var cnt = 0;
    var i = 1;
    var L = string_length(txt);
    while (i <= L) {
        var ch = string_char_at(txt, i);
        if (ch == "<") {
            i += 1;
            while (i <= L && string_char_at(txt, i) != ">") i += 1;
            i += 1;
        } else {
            cnt += 1;
            i += 1;
        }
    }
    return cnt;
}

// Constrói a string parcial com tags inteiras
function hist_build_shown(txt, n) {
    var out = "";
    var shown_count = 0;
    var i = 1;
    var L = string_length(txt);
    while (i <= L) {
        var ch = string_char_at(txt, i);
        if (ch == "<") {
            var tag = "<";
            i += 1;
            while (i <= L) {
                var ch2 = string_char_at(txt, i);
                tag += ch2;
                i += 1;
                if (ch2 == ">") break;
            }
            out += tag;
        } else {
            if (shown_count < n) out += ch;
            shown_count += 1;
            i += 1;
        }
    }
    return out;
}
