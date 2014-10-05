# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{2,3}} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Django Template Blocks with extra functionality"
HOMEPAGE="https://github.com/ojii/django-sekizai"

SRC_URI="https://github.com/ojii/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/django-1.3
	>=dev-python/django-classy-tags-0.3.1
"
DEPEND="dev-python/setuptools"

