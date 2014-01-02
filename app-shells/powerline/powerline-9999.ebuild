# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2 vim-plugin

DESCRIPTION="The ultimate shell and vim statusline utility"
HOMEPAGE="https://github.com/Lokaltog/powerline"
SRC_URI=""

EGIT_REPO_URI="git://github.com/Lokaltog/powerline.git"
EGIT_PROJECT="powerline"
EGIT_BRANCH="develop"

LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

VIM_PLUGIN_HELPFILES="Powerline.txt"

src_prepare() {
	# Discard unwanted files
	rm .gitignore README.rst || die
}
