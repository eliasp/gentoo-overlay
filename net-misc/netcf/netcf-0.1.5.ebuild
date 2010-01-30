# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="netcf is a cross-platform network configuration library."
HOMEPAGE="https://fedorahosted.org/netcf/"
SRC_URI="https://fedorahosted.org/released/netcf/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=app-admin/augeas-0.5.3"
RDEPEND="${DEPEND}"

src_install() {
	dodir /usr/share/augeas/lenses
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS ChangeLog README NEWS
	mv "${D}"usr/share/netcf/lenses/* "${D}"usr/share/augeas/lenses/
}
