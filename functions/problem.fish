function problem
    set rel_template_path "."
    while not contains template.cc (ls $rel_template_path)
        set rel_template_path "$rel_template_path/.."
    end
    set dir $argv[1]
    set libs $argv[2..(count $argv)]
    mkdir -p $dir
    if not contains main.cc (ls $dir)
        set main "$dir/main.cc"
        cat "/Users/jonathan/Dropbox/Competitive_Programming/template.h" >> $main
        for lib in $libs
            cat "/Users/jonathan/Dropbox/Competitive_Programming/CodeBook/$lib" >> $main
        end
        cat "$rel_template_path/template.cc" >> "$dir/main.cc"
    end
    cd $dir
    vim main.cc
end
