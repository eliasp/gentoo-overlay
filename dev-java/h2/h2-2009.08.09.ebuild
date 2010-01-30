# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO:
# - current ebuild obviously installs documentation always as it doesn't even
# 	compile without the gjdoc dependency
# - Check, whether the QA output is valid. Currently gjdoc is reported as
#	unneded?! while it doesn't even compile without it. At the same time, a lot
#	of not yet included dependencies are reported as missing.
# - Does h2 provide advanced functionality - does it need an initscript etc?
# 	Needs to be checked.
# - Make sure, the licensing is correct. See also comment above LICENSE=...

EAPI="2"

JAVA_PKG_IUSE=""
JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="gjdoc"
MY_PV="${PV//./-}"
MY_P="${PN}-${MY_PV}"

WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="A Java based small-footprint SQL database"
HOMEPAGE="http://www.h2database.com/"
SRC_URI="http://h2database.googlecode.com/files/${MY_P}.zip"

# A modified version of the MPL-1.1 is used. What to do here?
# See also: http://www.h2database.com/html/license.html
LICENSE="EPL-1.0 MPL-1.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}/${PN}"

IUSE="source"

COMMON_DEP="dev-java/gjdoc[xmldoclet]"
#COMMON_DEP="dev-java/commons-cli:1
#			dev-java/commons-logging"

RDEPEND=">=virtual/jre-1.5
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.5
	app-arch/unzip
	${COMMON_DEP}"

EANT_BUILD_XML="${S}/build.xml"

# Make sure, the binaries are removed from the sources to prevent automagic
# linking against them
java_prepare() {
	find . -iname '*.jar' -delete
}

src_install() {
	java-pkg_dojar bin/${PN}.jar
#	java-pkg_newjar releases/${PV}-0/jameica/jameica.jar ${PN}.jar
	use source && java-pkg_dosrc src
}
