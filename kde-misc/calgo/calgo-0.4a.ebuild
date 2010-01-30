# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit kde4-base

DESCRIPTION="A KDE Akonadi Resource for GroupDAV servers."
HOMEPAGE="http://opensource.maniatek.com/calgo/index.html"
SRC_URI="http://opensource.maniatek.com/calgo/files/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="kde-base/akonadi"
RDEPEND="${DEPEND}"
