# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1

DESCRIPTION="Simple photo gallery plugin for DjangoCMS, using filer."
HOMEPAGE="https://github.com/shagi/cmsplugin_gallery_filer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	>=dev-python/django-inline-ordering-0.1.1
	dev-python/easy-thumbnails
	dev-python/django-filer
"

DOCS="AUTHORS README.rst"
