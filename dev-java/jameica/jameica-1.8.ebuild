# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO:
# - init script
# - install init script + conf.d file
# - usage of "server" USE flag
# - mckoi is probably not needed anymore

EAPI="2"

JAVA_PKG_IUSE=""
JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="swt-3.5,commons-cli-1,de-willuhn-util,de-willuhn-datasource,nanoxml,swtcalendar,bcprov,commons-collections,velocity,xmlrpc,jdbc-mysql,h2"
MY_PN="${PN/.src/}"
MY_P="${MY_PN}-${PV}"

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Java Based Message Interchange - A Java™ GUI framework based on SWT"
HOMEPAGE="http://www.willuhn.de/projects/jameica/"
SRC_URI="http://www.willuhn.de/projects/${MY_PN}/releases/${PV}/${MY_PN}/${MY_PN}.src.zip -> ${MY_P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${MY_PN}"

IUSE="source"

COMMON_DEP="dev-java/commons-cli:1
			dev-java/commons-collections
			dev-java/swt:3.5
			~dev-java/de-willuhn-util-${PV}
			~dev-java/de-willuhn-datasource-${PV}
			dev-java/nanoxml
			dev-java/swtcalendar
			dev-java/bcprov
			dev-java/velocity
			dev-util/eclipse-sdk
			dev-java/xmlrpc
			dev-java/jdbc-mysql
			dev-java/h2"
#			dev-java/mckoi"

RDEPEND=">=virtual/jre-1.6
	${COMMON_DEP}"

DEPEND=">=virtual/jdk-1.6
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_XML="${S}/build/build.xml"

#COMPILERS=""

# Make sure, the binaries are removed from the sources to prevent automagic
# linking against them
java_prepare() {
	find . -iname '*.jar' -delete
}

src_compile() {
	eant -Dgentoo.classpath=$(java-pkg_getjars \
	${EANT_GENTOO_CLASSPATH}):/usr/lib/eclipse-3.2/plugins/org.eclipse.ui.forms_3.2.0.v20060602.jar:/usr/lib/eclipse-3.2/plugins/org.eclipse.osgi_3.2.1.R32x_v20060919.jar \
	jar -f "${EANT_BUILD_XML}"
}

src_install() {
#	java-pkg_newjar releases/${PV}-0/jameica/jameica-linux.jar ${PN}-linux.jar
	java-pkg_newjar releases/${PV}.0-0/jameica/jameica.jar ${PN}.jar
	use source && java-pkg_dosrc src
	java-pkg_dolauncher ${PN} --main de.willuhn.jameica.Main
#	doexe ${MY_PN}server${ARCH_SUFFIX}.sh
#	doexe ${MY_PN}${ARCH_SUFFIX}.sh
#
#	rm *.sh rcjameica COPYING README
#
#	dodir /etc/${MY_PN}
#	echo "PASSWORD=\"\"" > secret
#	insinto /etc/${MY_PN}
#	insopts -m0600
#	doins secret
#
#	dodir /var/lib/${MY_PN}
}
