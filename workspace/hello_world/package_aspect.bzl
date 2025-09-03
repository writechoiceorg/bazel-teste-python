# hello_world/package_aspect.bzl

def _package_aspect_impl(target, ctx):
    """Implementa a lógica do nosso aspect de empacotamento."""
    # Coleta todos os arquivos-fonte do target atual.
    files_to_package = []
    if hasattr(target, "srcs"):
        for src in target.srcs:
            files_to_package.append(src)

    # Cria uma 'provider' para passar os arquivos para os próximos targets.
    return [
        PackageInfo(
            files_to_package = depset(files_to_package)
        )
    ]

# Define o aspect, que 'segue' as dependências do tipo 'deps'.
package_aspect = aspect(
    implementation = _package_aspect_impl,
    attr_aspects = ["deps"],
)

PackageInfo = provider(fields = ["files_to_package"])