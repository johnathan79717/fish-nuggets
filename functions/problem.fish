function problem
    set rel_template_path "."
    while not contains template.cc (ls $rel_template_path)
        set rel_template_path "$rel_template_path/.."
    end
    set dir $argv[1]
    set argc (count $argv)
    if [ $argc -gt 1 ]
        set libs $argv[2..$argc]
    end
    mkdir -p $dir
    if not contains main.cc (ls $dir)
        set main "$dir/main.cc"
        cat "/Users/jhao/Workspace/competitive-programming/template.h" >> $main
        for lib in $libs
            cat "/Users/jhao/Workspace/codebook/$lib" >> $main
        end
        cat "$rel_template_path/template.cc" >> $main
    end
    cd $dir
    vim main.cc
end
