# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1 git-r3

DESCRIPTION="Gallery plugin for django-cms."
HOMEPAGE="https://github.com/side2k/djangocms-gallery"
EGIT_REPO_URI="https://github.com/side2k/${PN}.git"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DEPEND="
	dev-python/django-filer
	dev-python/easy-thumbnails
"

DOCS="README.md"
