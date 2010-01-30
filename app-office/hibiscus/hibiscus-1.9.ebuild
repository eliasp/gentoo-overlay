# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO
# - Install a desktop file
# - Copy the icons to /usr/share/icons to make them accessible to the desktop
# 	file

DESCRIPTION="HBCI Plugin for Jameica"
HOMEPAGE="http://jameica.org"
SRC_URI="http://www.willuhn.de/products/hibiscus/releases/${PV}/hibiscus/hibiscus.zip"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

JAMEICA_PLUGIN_DIR="/opt/jameica/plugins"
RDEPEND=">=dev-java/jameica-bin-1.7"

src_install() {
	dodir ${JAMEICA_PLUGIN_DIR}
	insinto ${JAMEICA_PLUGIN_DIR}
	doins -r *
}
