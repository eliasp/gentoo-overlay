# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1

DESCRIPTION="Handle configuration defaults of packaged Django apps gracefully"
HOMEPAGE="http://django-appconf.readthedocs.org/en/latest/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/six
"

DOCS="AUTHORS README.rst"
