# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://anongit.freedesktop.org/${PN}"
fi

DESCRIPTION="GummiBoot Simple UEFI Boot Manager"
HOMEPAGE="http://freedesktop.org/wiki/Software/gummiboot"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND="=sys-boot/gnu-efi-3.0s"

src_prepare() {
	./autogen.sh || die "autogen failed"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
