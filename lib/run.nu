use ./util.nu

def help []: nothing -> string {
    [
        "wk run - Run packages via nix"
        ""
        "Usage:"
        "  wk run <package> [-- args...]"
        ""
        "Examples:"
        "  wk run hello                    # Run nixpkgs#hello"
        "  wk run hello -- --greeting=yo   # Run with arguments"
        "  wk run nixpkgs#hello            # Use explicit source"
        ""
        "If no '#' is specified, 'nixpkgs#' is prepended automatically."
    ] | str join "\n"
}

export def main [args:list<string>]: nothing -> nothing {
    if ($args | is-empty) {
        util die $"missing package name\n(help)"
    }

    let p = $args | first
    let package = if ($p | str contains "#") { $p } else { $"nixpkgs#($p)" }
    let pass_through_args = $args | skip 1

    nix run $package ...$pass_through_args
}
