# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit latex-package

DESCRIPTION="Support for automation of the LaTeX workflow."
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/contrib/logreq/"
SRC_URI="http://www.ctan.org/tex-archive/macros/latex/contrib/logreq/${PN}.zip -> ${P}.zip"
S="${WORKDIR}/${PN}"

LICENSE="LPPL-1.3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~ppc"
IUSE="+doc examples"

TEXMF="/usr/share/texmf-site"

RDEPEND="
	>=dev-texlive/texlive-latex-2009
	>=dev-texlive/texlive-latexextra-2009
"
DEPEND="${RDEPEND}"

src_install() {
	cd "${S}/latex"
	insinto ${TEXMF}/tex/latex/${PN}
	doins -r logreq.def logreq.sty

	cd "${S}"
	dodoc README

	if use examples ; then
		insinto /usr/share/doc/${P}
		doins -r examples
	fi
}
