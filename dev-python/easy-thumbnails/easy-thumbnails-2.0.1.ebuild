# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_{6,7},3_{2,3},3_3} )

inherit distutils-r1

DESCRIPTION="Easy thumbnails for Django."
HOMEPAGE="http://github.com/SmileyChris/easy-thumbnails"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-1.4.2
	>=virtual/python-imaging-2
	dev-python/six
"

DOCS="AUTHORS README.rst"
