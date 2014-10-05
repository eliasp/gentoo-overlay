# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_3} )

inherit distutils-r1

DESCRIPTION="Text Plugin for django-cms with CK-Editor."
HOMEPAGE="https://www.django-cms.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-cms-2.3
	dev-python/html5lib
	>=virtual/python-imaging-2
"

DOCS="README.rst"

