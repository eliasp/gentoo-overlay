# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="File and Image Management Application for django."
HOMEPAGE="http://github.com/stefanfoulis/django-filer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-1.4
	>=dev-python/easy-thumbnails-1.0
	|| ( =dev-python/django-mptt-0.5.2 =dev-python/django-mptt-0.6.0 =dev-python/django-mptt-0.6.1 )
	>=dev-python/django_polymorphic-0.2
"

DOCS="AUTHORS README.rst"
