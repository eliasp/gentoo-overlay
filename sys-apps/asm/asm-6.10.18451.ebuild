# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit multilib rpm versionator

MY_PV="$(replace_all_version_separators _ ${PV})"

DESCRIPTION="Adaptec Storage Manager (ASM)"
HOMEPAGE="http://www.adaptec.com/en-US/downloads/"
SRC_URI="amd64? ( ${PN}_linux_x64_v${MY_PV}.rpm )"
LICENSE="Adaptec"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="X"
#RESTRICT="fetch strip"
RESTRICT="fetch"

RDEPEND="( dev-java/sun-jdk:1.5[X=] ) || ( dev-java/sun-jdk:1.6[X=] )"

S="${WORKDIR}/usr/StorMan"

#pkg_nofetch() {
#	use x86 && MYARCH="x86"
#	use amd64 && MYARCH="x64"
#
#	einfo "${PN}_linux_x86_v${MY_PV}.rpm"
#	einfo "Please download the appropriate asm RPM-archive:"
#	einfo ""
#	einfo "wget http://download.adaptec.com/raid/storage_manager/${PN}_linux_${MYARCH}_v${MY_PV}.rpm -P ${DISTDIR}"
#}

src_unpack() {
	rpm_src_unpack
}

src_configure() {
	# binpkg - nothing to do here
	:;
}

src_compile() {
	# binpkg - nothing to do here
	:;
}

src_install() {
	cd "${S}" || die

	if use X ; then
		insinto /opt/StorMan
		doins index.html *.jar *.pps *.so
		# StorMan needs the help inside of /opt/StorMan
		doins -r help

		into /opt
		dobin "${FILESDIR}"/StorMan.sh
		dosed "s:%LIBDIR%:/usr/$(get_libdir):" /opt/bin/StorMan.sh
		dosed 's:\(\.log=\):\1/var/log:g' /opt/StorMan/RaidLog.pps
	fi

	into /opt/StorMan
	dobin {arc,hr}conf
	dosym ../StorMan/bin/arcconf /opt/bin/arcconf
	dosym ../StorMan/bin/hrconf /opt/bin/hrconf
	
	newinitd "${FILESDIR}/${PN}-initd" StorAgnt
	
	insinto /etc/conf.d/
	doins "${FILESDIR}/StorAgnt"

	dodoc README.TXT
}

pkg_postinst() {
	einfo "An init script has been installed for your conveniance"
        einfo "The Adapatec Storage Agent can be start with /etc/init.d/StorAgnt start"
	
	if use X ; then
	einfo "You can start the GUI from /opt/bin/StorMan.sh"
	fi
}
