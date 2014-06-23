# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_{6,7},3_{2,3},3_3} )

inherit distutils-r1

DESCRIPTION="Django-CMS plugins for django-filer."
HOMEPAGE="http://github.com/stefanfoulis/cmsplugin-filer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-1.4
	>=dev-python/django-cms-2.2
	>=dev-python/django-sekizai-0.4.2
	>=dev-python/easy-thumbnails-1.0
	>=dev-python/django-filer-0.9
"

DOCS="AUTHORS README.rst"
