# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

KMNAME="playground/pim"
inherit kde4-meta

DESCRIPTION="A KDE Akonadi Resource for GroupDAV servers."
HOMEPAGE="http://opensource.maniatek.com/calgo/index.html"
#ESVN_REPO_URI="svn://anonsvn.kde.org/home/kde/trunk/playground/pim/calgo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="kde-base/akonadi"
RDEPEND="${DEPEND}"
