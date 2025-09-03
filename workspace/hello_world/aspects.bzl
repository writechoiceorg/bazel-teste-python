# Provider para passar os arquivos JSON gerados
FuncInfo = provider(fields = {"funcs": "Lista de arquivos JSON com nomes de funções"})

def _doc_generator_aspect_impl(target, ctx):
    json_files = []
    if hasattr(ctx.rule.attr, "srcs"):
        for t in ctx.rule.attr.srcs:
            for f in t.files.to_list():
                if f.path.endswith(".py"):
                    json_file = ctx.actions.declare_file("%s.json" % f.path)
                    ctx.actions.run(
                        outputs = [json_file],
                        inputs = [f],
                        executable = ctx.executable._parser,
                        arguments = [f.path, json_file.path],
                    )
                    json_files.append(json_file)
    
    return [FuncInfo(funcs = json_files)]

doc_generator_aspect = aspect(
    implementation = _doc_generator_aspect_impl,
    attr_aspects = ["deps"],
    attrs = {
        "_parser": attr.label(
            default = Label("//hello_world:parse_functions"),
            executable = True,
            cfg = "exec",
        ),
    },
)

def _doc_aggregator_rule_impl(ctx):
    all_funcs_files = []
    for dep in ctx.attr.deps:
        if FuncInfo in dep:
            all_funcs_files.extend(dep[FuncInfo].funcs)
            
    output_file = ctx.actions.declare_file("docs.md")
    
    args = ctx.actions.args()
    args.add(output_file.path)
    args.add_all(all_funcs_files)
    
    ctx.actions.run(
        outputs = [output_file],
        inputs = depset(all_funcs_files),
        executable = ctx.executable._aggregator,
        arguments = [args],
    )
    
    return [DefaultInfo(files = depset([output_file]))]

doc_aggregator_rule = rule(
    implementation = _doc_aggregator_rule_impl,
    attrs = {
        "deps": attr.label_list(aspects = [doc_generator_aspect]),
        "_aggregator": attr.label(
            default = Label("//hello_world:aggregate_docs"),
            executable = True,
            cfg = "exec",
        ),
    },
)