# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_{2,3}} pypy2_0 )

inherit distutils-r1

DESCRIPTION="Class based template tags for django"
HOMEPAGE="https://github.com/ojii/django-classy-tags"

SRC_URI="https://github.com/ojii/django-classy-tags/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=dev-python/django-1.2"
DEPEND="dev-python/setuptools"
