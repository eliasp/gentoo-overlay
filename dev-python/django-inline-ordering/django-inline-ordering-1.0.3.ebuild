# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1

DESCRIPTION="Django app to ease ordering of related data."
HOMEPAGE="https://github.com/centralniak/django-inline-ordering"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/django
	dev-python/django-admin-jqueryui
"

DOCS="AUTHORS.rst README.rst"
