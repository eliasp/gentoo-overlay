# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3,4}} )

inherit distutils-r1

DESCRIPTION="REST Framework for Django"
HOMEPAGE="http://www.django-rest-framework.org/"
SRC_URI="https://github.com/tomchristie/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-1.4.2
"

DOCS="README.md"

