# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE=""

MY_PN="${PN/.src/}"
MY_P="${MY_PN}-${PV}"

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="An editor to view/modify entries on HBCI cards"
HOMEPAGE="http://hbci4java.kapott.org"
SRC_URI="http://hbci4java.kapott.org/${P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${MY_PN}"

IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	dev-java/swt:3.5"

EANT_BUILD_XML="${S}/build/build.xml"
#src_install() {
#
#	dodoc README || die "Error installing documentation files"
#	dodir /opt/${MY_PN}/bin
#	exeinto /opt/${MY_PN}/bin
#	doexe ${MY_PN}server${ARCH_SUFFIX}.sh
#	doexe ${MY_PN}${ARCH_SUFFIX}.sh
#	dosym /opt/${MY_PN}/bin/${MY_PN}${ARCH_SUFFIX}.sh /usr/bin/${MY_PN}
#	dosym /opt/${MY_PN}/bin/${MY_PN}server${ARCH_SUFFIX}.sh /usr/bin/${MY_PN}server
#
#	rm *.sh rcjameica COPYING README
#
#	insinto /opt/${MY_PN}
#	doins -r *
#	#cp -r ./* ${D}opt/${MY_PN}/
#
#	dodir /etc/${MY_PN}
#	echo "PASSWORD=\"\"" > secret
#	insinto /etc/${MY_PN}
#	insopts -m0600
#	doins secret
#
#	dodir /var/lib/${MY_PN}
#}
#
#
