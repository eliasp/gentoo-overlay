# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit kde4-base git-2

DESCRIPTION="A dataengine to access SANE scanners"
HOMEPAGE="https://gitorious.org/sane-on-kde-plasma"
EGIT_REPO_URI="https://github.com/eliasp/plasma-dataengine-libksane.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	kde-base/libksane
"
RDEPEND="${DEPEND}"

