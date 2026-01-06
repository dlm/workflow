export const version = "0.0.0-dev"

export def version_string [] {
    $"wk ($version)"
}

export def show_help [] {
    [
        (version_string)
        ""
        "Usage:"
        "  wk                  Print the hello world placeholder"
        "  wk run [args...]    Placeholder nix run wrapper"
        "  wk env [args...]    Placeholder env helper"
        "  wk --help           Show this help"
        "  wk --version        Show the version string"
    ] | str join "\n" | print
}

export def die [
    message: string,
    --verbose(-v) # show code location detail
] {
    let msg = { msg: $message }
    if $verbose {
        error make $msg
    } else {
        error make --unspanned $msg
    }
}

export def split_on_separator [args: list<string>, sep: string] {
    let idx = $args | enumerate | where item == $sep | get index.0?
    if ($idx | is-empty) {
        { before: $args, after: [] }
    } else {
        { 
            before: ($args | take $idx), 
            after: ($args | skip ($idx + 1)),
        }
    }
}
