def parse_hi_line(line: str):
    line = line.strip()

    if not line.startswith("hi "):
        return None

    parts = line.split()
    if len(parts) < 2:
        return None

    group = parts[1]
    attrs = {}

    for token in parts[2:]:
        if "=" not in token:
            continue

        key, value = token.split("=", 1)

        if key == "guifg" and value != "NONE":
            attrs["fg"] = value

        elif key == "guibg" and value != "NONE":
            attrs["bg"] = value

        elif key == "gui":
            styles = value.split(",")

            for style in styles:
                if style == "bold":
                    attrs["bold"] = True
                elif style == "italic":
                    attrs["italic"] = True
                elif style == "underline":
                    attrs["underline"] = True
                elif style == "undercurl":
                    attrs["undercurl"] = True
                elif style == "reverse":
                    attrs["reverse"] = True
                elif style == "strikethrough":
                    attrs["strikethrough"] = True
                elif style == "nocombine":
                    attrs["nocombine"] = True

    args = ", ".join(f'{k} = "{v}"' if isinstance(v, str) else f"{k} = true"
                     for k, v in attrs.items())

    return f'vim.api.nvim_set_hl(0, "{group}", {{ {args} }})'


def main():
    with open("/home/pragyan/open-source/nvcode-color-schemes.vim/colors/materialOcean.vim") as file:
        for line in file.readlines():
            result = parse_hi_line(line)
            if result:
                print(result)


if __name__ == "__main__":
    main()
