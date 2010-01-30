# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE=""
JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH=""
MY_PN="de_willuhn_ds"
MY_P="${MY_PN}-${PV}"

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Supplementary classes used by applications like Jameica"
HOMEPAGE="http://www.willuhn.de/projects/jameica/"
SRC_URI="http://willuhn.de/products/jameica/releases/${PV}/datasource/${MY_PN}.src.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${build}"

IUSE=""

COMMON_DEP=""
#COMMON_DEP="dev-java/commons-cli:1
#			dev-java/commons-logging"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_XML="${S}/build/build.xml"

src_install() {
	java-pkg_dojar releases/${PV}-0/lib/de_willuhn_ds/de_willuhn_ds.jar
#	java-pkg_newjar releases/${PV}-0/jameica/jameica.jar ${PN}.jar
	use source && java-pkg_dosrc src
}
