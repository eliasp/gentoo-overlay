# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# This ebuild generated by g-cpan 0.15.0

inherit perl-module

S=${WORKDIR}/HTML-Lint-2.06

DESCRIPTION="HTML validation module (& script)"
HOMEPAGE="http://search.cpan.org/search?query=HTML-Lint&mode=dist"
SRC_URI="mirror://cpan/authors/id/P/PE/PETDANCE/HTML-Lint-2.06.tar.gz"


IUSE=""

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 amd64-fbsd arm hppa ia64 m68k mips ppc ppc64 s390 sh sparc sparc-fbsd x86 x86-fbsd  # Prefix keywords ppc-aix x86-freebsd x64-freebsd hppa-hpux ia64-hpux x86-interix mips-irix amd64-linux ia64-linux x86-linux ppc-macos x86-macos x64-macos m68k-mint x86-netbsd ppc-openbsd x86-openbsd x64-openbsd sparc-solaris sparc64-solaris x64-solaris x86-solaris x86-winnt"

DEPEND="dev-perl/HTML-Parser
	>=dev-perl/HTML-Tagset-3.20
	dev-lang/perl"
