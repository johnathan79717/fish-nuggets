function contest
    set rel_template_path "."
    while not contains template.cc (ls $rel_template_path)
        set rel_template_path "$rel_template_path/.."
    end
    mkdir -p $argv
    cat "/Users/jonathan/Dropbox/Competitive_Programming/template.h" "$rel_template_path/template.cc" > "$argv/main.cc"
    cd $argv
    subl main.cc
end
