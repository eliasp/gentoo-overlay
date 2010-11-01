# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit latex-package

DESCRIPTION="Bibliographies in LaTeX using BibTeX for sorting only"
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/exptl/biblatex/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
S="${WORKDIR}/${PN}"

LICENSE="LPPL-1.3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"
IUSE="+doc examples"

TEXMF="/usr/share/texmf-site"

RDEPEND="
	>=dev-tex/logreq-1.0
	>=dev-texlive/texlive-latexextra-2010
	app-text/texlive-core
"
DEPEND="${RDEPEND}"

src_install() {
	cd "${S}/latex"
	insinto ${TEXMF}/tex/latex/${PN}
	doins -r bbx biblatex.cfg biblatex.def biblatex.sty blx-compat.def 	blx-natbib.def cbx lbx

	cd "${S}/bibtex/bst/"
	insinto ${TEXMF}/bibtex/bst/${PN}
	doins biblatex.bst

	cd "${S}/bibtex/bib/"
	insinto ${TEXMF}/bibtex/bib/${PN}
	doins biblatex-examples.bib

	cd "${S}/bibtex/csf/"
	insinto ${TEXMF}/bibtex/csf/${PN}
	doins *.csf

	cd "${S}"
	dodoc README

	cd "${S}/doc"
	if use doc ; then
		dodoc biblatex.pdf biblatex.tex
	fi
	if use examples ; then
		insinto /usr/share/doc/${P}
		doins -r examples resources
	fi
}
