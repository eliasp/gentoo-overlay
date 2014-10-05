# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{2,3}} )

inherit distutils-r1 git-r3

DESCRIPTION="Adds pretty CSS styles for the django CMS admin interface."
HOMEPAGE="https://github.com/divio/djangocms-admin-style"
EGIT_REPO_URI="https://github.com/divio/${PN}.git"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE=""

DOCS="AUTHORS.rst README.rst"
