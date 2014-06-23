# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1 git-r3

DESCRIPTION="Django-CMS plugins for django-filer."
HOMEPAGE="http://github.com/stefanfoulis/cmsplugin-filer"
EGIT_REPO_URI="http://github.com/eliasp/${PN}.git"

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
	dev-python/django-appconf
"

DOCS="AUTHORS README.rst"
