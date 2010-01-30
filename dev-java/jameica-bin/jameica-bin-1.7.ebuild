# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO:
# - init script
# - install init script + conf.d file
# - QA Notice: Pre-stripped files found:
# - set JARFILE in confd file depending on ARCH
# DONE:
# - alternative/better method to: cp -r ./* ${D}opt/${PN}/ (recursive doins?)

EAPI="2"

JAVA_PKG_IUSE=""

MY_PN="${PN/-bin/}"
MY_P="${MY_PN}-${PV}"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Java Based Message Interchange - A Java™ GUI framework based on SWT"
HOMEPAGE="http://www.willuhn.de/projects/jameica/"
SRC_URI="
	amd64? ( http://www.willuhn.de/projects/${MY_PN}/releases/${PV}/${MY_PN}/${MY_PN}-linux-amd64.zip
		-> ${MY_P}-amd64.zip )
	x86? ( http://www.willuhn.de/projects/${MY_PN}/releases/${PV}/${MY_PN}/${MY_PN}-linux.zip
		-> ${MY_P}-x86.zip )
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${MY_PN}"

IUSE=""

COMMON_DEP="!${CATEGORY}/${MY_PN}"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	dev-java/swt:3.5
	${COMMON_DEP}"

src_install() {
	use amd64 && ARCH_SUFFIX="-amd64"
	use x86 && ARCH_SUFFIX=""

	dodoc README || die "Error installing documentation files"
	dodir /opt/${MY_PN}/bin
	exeinto /opt/${MY_PN}/bin
	doexe ${MY_PN}server${ARCH_SUFFIX}.sh
	doexe ${MY_PN}${ARCH_SUFFIX}.sh
	dosym /opt/${MY_PN}/bin/${MY_PN}${ARCH_SUFFIX}.sh /usr/bin/${MY_PN}
	dosym /opt/${MY_PN}/bin/${MY_PN}server${ARCH_SUFFIX}.sh /usr/bin/${MY_PN}server

	rm *.sh rcjameica COPYING README

	insinto /opt/${MY_PN}
	doins -r *
	#cp -r ./* ${D}opt/${MY_PN}/

	dodir /etc/${MY_PN}
	echo "PASSWORD=\"\"" > secret
	insinto /etc/${MY_PN}
	insopts -m0600
	doins secret

	dodir /var/lib/${MY_PN}
}


