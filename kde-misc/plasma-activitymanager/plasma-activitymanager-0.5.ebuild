# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit kde4-base

MY_PN=${PN/plasma-/}
MY_P=${MY_PN}-${PV}

DESCRIPTION="KDE4 lightweight Plasma activity manager."
HOMEPAGE="http://www.kde-look.org/content/show.php?content=136278"
SRC_URI="http://kde-apps.org/CONTENT/content-files/136278-${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"
IUSE="debug"

RDEPEND="
	>=kde-base/plasma-workspace-${KDE_MINIMAL}
"

S="${WORKDIR}"/"${MY_P}"
