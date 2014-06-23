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
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools
	test? (
		>=TODO/django-reversion-1.6.6
		=TODO/Pillow-1.7.7
		=TODO/Sphinx-1.1.3
		=TODO/Jinja2-2.6
		=TODO/Pygments-1.5
		=TODO/dj-database-url-0.2.1
		TODO/django-hvad
		>=dev-python/djangocms-text-ckeditor-2.1.1
		TODO/djangocms-column
		TODO/djangocms-style
	)
"

#DOCS="AUTHORS CHANGELOG.txt README.rst CONTRIBUTING.rst"
