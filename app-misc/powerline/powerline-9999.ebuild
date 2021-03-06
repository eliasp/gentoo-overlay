# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_{2,3,4}} )

GITHUB_URI="github.com/Lokaltog/${PN}"

if [[ ${PV} == *9999 ]]; then
	SRC_URI=""
	EGIT_REPO_URI="git://${GITHUB_URI}.git"
	EGIT_BRANCH="develop"
	inherit git-r3
else
	SRC_URI="https://${GITHUB_URI}/archive/v${PV}.zip -> ${P}.zip"
fi
KEYWORDS="~amd64"

inherit distutils-r1 eutils font

DESCRIPTION="The ultimate statusline/prompt utility."
HOMEPAGE="http://github.com/Lokaltog/powerline"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE="vim zsh doc awesome tmux bash ipython test git"

S="${WORKDIR}/${PN}"

COMMON_DEPEND="
	virtual/python-argparse
"
RDEPEND="
	${COMMON_DEPEND}
	vim? ( || ( app-editors/vim[python] app-editors/gvim[python] ) )
	awesome? ( >=x11-wm/awesome-3.5 )
	git? ( || ( >=dev-vcs/git-1.7.2 >=dev-python/pygit2-0.17 ) )
"
DEPEND="
	${COMMON_DEPEND}
	doc? ( dev-python/sphinx dev-python/docutils )
	test? (
		|| ( >=dev-vcs/git-1.7.2 >=dev-python/pygit2-0.17 )
		python_targets_python2_7? (
			dev-vcs/mercurial
			dev-vcs/bzr
		)
	)
"

FONT_SUFFIX="otf"
FONT_S="${S}/font"

FONT_CONF=(
	"${FONT_S}/10-powerline-symbols.conf"
)

python_test() {
	PYTHON="${PYTHON}" tests/test.sh || die "Tests fail with ${EPYTHON}"
}

src_compile() {
	distutils-r1_src_compile
	if use doc ; then
		einfo "Generating documentation"
		sphinx-build -b html docs/source docs_output
	fi
}

src_install() {
	unset DOCS
	font_src_install
	if use vim ; then
		insinto /usr/share/vim/vimfiles/plugin
		# Don't do sys.path.append, it points to wrong location
		sed -i -e '/sys\.path\.append/d' powerline/bindings/vim/plugin/powerline.vim
		doins powerline/bindings/vim/plugin/powerline.vim
	fi
	rm powerline/bindings/vim/plugin/powerline.vim
	if use zsh ; then
		insinto /usr/share/zsh/site-contrib
		doins powerline/bindings/zsh/powerline.zsh
		elog ""
		elog "To enable powerline prompt in zsh add"
		elog "    . /usr/share/zsh/site-contrib/powerline.zsh"
		elog "to your .zshrc."
	fi
	rm powerline/bindings/zsh/powerline.zsh
	if use awesome ; then
		elog ""
		elog "To enable powerline statusline in awesome add"
		elog "    require(\"powerline\")"
		elog "and"
		elog "    right_layout:add(powerline_widget)"
		elog "to your .config/awesome/rc.lua. Assuming you were using"
		elog "/etc/xdg/awesome/rc.lua as a template for you own configuration."
		insinto /usr/share/awesome/lib/powerline
		mv powerline/bindings/awesome/powerline.lua init.lua
		doins init.lua
		rm init.lua
		exeinto /usr/share/awesome/lib/powerline
		doexe powerline/bindings/awesome/powerline-awesome.py
	else
		rm powerline/bindings/awesome/powerline.lua
	fi
	rm powerline/bindings/awesome/powerline-awesome.py
	# There are no standard location for this, thus using /usr/share/powerline
	if use tmux ; then
		elog ""
		elog "To enable powerline statusline in tmux add"
		elog "    source /usr/share/powerline/tmux/powerline.conf"
		elog "to your .tmux.conf."
		insinto /usr/share/powerline/tmux
		doins powerline/bindings/tmux/powerline.conf
	fi
	rm powerline/bindings/tmux/powerline.conf
	if use bash ; then
		insinto /usr/share/powerline/bash
		doins powerline/bindings/bash/powerline.sh
		elog ""
		elog "To enable powerline prompt in bash add"
		elog "    . /usr/share/powerline/bash/powerline.sh"
		elog "to your .bashrc/.profile."
	fi
	rm powerline/bindings/bash/powerline.sh
	elog ""
	insinto /etc/xdg/powerline
	doins -r powerline/config_files/*
	rm -r powerline/config_files
	sed -i -e "/DEFAULT_SYSTEM_CONFIG_DIR/ s@None@'/etc/xdg'@" powerline/__init__.py
	distutils-r1_src_install
	use doc && dohtml -r docs_output/*
}
