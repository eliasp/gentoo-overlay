# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI=2

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST="spec"

# No documentation task
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC=""

inherit ruby-fakegem

DESCRIPTION="An easy way to vendor gem dependencies"
HOMEPAGE="http://github.com/carlhuda/bundler"

GITHUB_USER="carlhuda"
TREE_HASH="287d3f11b30e7f663f5ffd7c8d4c9517a27941fc"

SRC_URI="http://github.com/${GITHUB_USER}/${PN}/tarball/${TREE_HASH} -> ${PN}-git-${PV}.tgz"
S="${WORKDIR}/${GITHUB_USER}-${PN}-${TREE_HASH:0:7}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# does not work with the reduced interface provided by Ruby 1.9 and
# JRuby, so it needs the full package
ruby_add_rdepend dev-ruby/rubygems

ruby_add_bdepend test dev-ruby/rspec
