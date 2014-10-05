# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_{3,4}} )

inherit distutils-r1

DESCRIPTION="A Django application for managing hierarchical pages of content"
HOMEPAGE="https://www.django-cms.org/"
SRC_URI="https://github.com/divio/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

RDEPEND="
	>=dev-python/django-1.4
	>=dev-python/south-0.7.2
	>=dev-python/django-classy-tags-0.5
	|| ( =dev-python/django-mptt-0.5.2 =dev-python/django-mptt-0.6.0 =dev-python/django-mptt-0.6.1 )
	>=dev-python/django-sekizai-0.7
	dev-python/html5lib
	dev-python/djangocms-admin-style
	>=dev-python/djangocms-text-ckeditor-2.1.1
	<dev-python/django-reversion-1.8.1
"
# django-reversion is fixed to =1.6.6, see: https://github.com/divio/django-cms/issues/3211

DEPEND="
	${RDEPEND}
	dev-python/setuptools
	test? (
		<dev-python/django-reversion-1.8.1
		>=dev-python/jinja-2.6
		>=dev-python/pygments-1.5
		>=dev-python/djangocms-text-ckeditor-2.1.1
	)
"
#	test? (
#		# TODO: dev-python/djangocms-column
#		# TODO: dev-python/djangocms-style
#		# TODO: =dev-python/pillow-1.7.7
#		# TODO =dev-python/Sphinx-1.1.3
#		# TODO =dev-python/dj-database-url-0.2.1
#		# TODO: dev-python/django-hvad
#	)

#DOCS="AUTHORS CHANGELOG.txt README.rst CONTRIBUTING.rst"
