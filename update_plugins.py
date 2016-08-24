import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
PLUGINS = """
ack.vim https://github.com/mileszs/ack.vim
AutoComplPop https://github.com/vim-scripts/AutoComplPop
bufexplorer https://github.com/corntrace/bufexplorer
clang_complete https://github.com/Rip-Rip/clang_complete
ctrlp.vim https://github.com/kien/ctrlp.vim
mru.vim https://github.com/vim-scripts/mru.vim
nerdtree https://github.com/scrooloose/nerdtree
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
peaksea https://github.com/vim-scripts/peaksea
snipmate-snippets https://github.com/scrooloose/snipmate-snippets
syntastic https://github.com/scrooloose/syntastic
tabline.vim https://github.com/mkitt/tabline.vim
taglist.vim https://github.com/vim-scripts/taglist.vim
tlib https://github.com/vim-scripts/tlib
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
VHDL-indent-93-syntax https://github.com/vim-scripts/VHDL-indent-93-syntax
vim-airline https://github.com/bling/vim-airline
vim-airline-themes https://github.com/vim-airline/vim-airline-themes
vim-colors-solarized https://github.com/altercation/vim-colors-solarized
vim-commentary https://github.com/tpope/vim-commentary.git
vim-easy-align https://github.com/junegunn/vim-easy-align.git
vim-fugitive https://github.com/tpope/vim-fugitive
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-latex https://github.com/vim-latex/vim-latex.git
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-repeat https://github.com/tpope/vim-repeat
vim-snipmate https://github.com/garbas/vim-snipmate
vim-snippets https://github.com/honza/vim-snippets
YankRing https://github.com/vim-scripts/YankRing.vim

""".strip()

GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)

    print('Updated {0}'.format(plugin_name))


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        for line in PLUGINS.splitlines():
            name, github_url = line.split(' ')
            zip_path = GITHUB_ZIP % github_url
            download_extract_replace(name, zip_path,
                                     temp_directory, SOURCE_DIR)
    finally:
        shutil.rmtree(temp_directory)
