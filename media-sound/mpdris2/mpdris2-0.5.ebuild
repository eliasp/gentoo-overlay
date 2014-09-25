# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

MY_PN="mpDris2"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="MPRIS V2.1 support for mpd"
HOMEPAGE="https://github.com/eonpatapon/mpDris2"
SRC_URI="https://github.com/eonpatapon/mpDris2/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
# TODO python-notify abhängig von use-flag machen!
RDEPEND="${DEPEND}
	dev-lang/python:2.7
	>=dev-python/python-mpd-0.5.1[python_targets_python2_7]
	dev-python/notify-python[python_targets_python2_7]
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}/python2.patch"
	epatch "${FILESDIR}/${PV}-desktop.patch"
	epatch "${FILESDIR}/lastfm_coverfetcher.patch"
	epatch "${FILESDIR}/mpd_wrapper.patch"
	epatch "${FILESDIR}/noidle.patch"
	epatch "${FILESDIR}/mpg123.patch"
	epatch "${FILESDIR}/no_cover.patch"
	epatch "${FILESDIR}/playlist_ids.patch"
	epatch "${FILESDIR}/cover_fetch_failure+spotify_fallback.patch"
	epatch "${FILESDIR}/no_album.patch"
}
