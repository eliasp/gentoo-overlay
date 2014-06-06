# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

if [[ ${PV} == "9999" ]] ; then
	inherit autotools git-r3
	KEYWORDS=""
	EGIT_REPO_URI="git://anongit.freedesktop.org/${PN}"
fi

DESCRIPTION="GummiBoot Simple UEFI Boot Manager"
HOMEPAGE="http://freedesktop.org/wiki/Software/gummiboot"

LICENSE="LGPL"
SLOT="0"
IUSE=""

DEPEND="=sys-boot/gnu-efi-3.0s"
RDEPEND=""

src_prepare() {
	./autogen.sh || die "autogen failed"
}
#src_configure() {
#	econf \
#		--sysconfdir=${D}/etc \
#		--with-efi-ldsdir=${D}
#}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR=${D} install
}
