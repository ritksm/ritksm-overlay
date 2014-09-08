# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="C/C++ IDE. NEW. INTELLIGENT. CROSS-PLATFORM. Enhancing productivity for every C and C++ developer on Linux, OS X and Windows."
HOMEPAGE="http://www.jetbrains.com/clion/"
SRC_URI="http://download.jetbrains.com/cpp/${P}.tar.gz"
RESTRICT="strip mirror"

LICENSE="|| ( CLion_license CLion_Preview_License CLion_Academic_license CLion_Classroom_license CLion_OpenSource_license )"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	>=virtual/jre-1.6
    sys-libs/ncurses[tinfo]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${PV}

src_install() {
	local dest="/opt/${PN}"

	insinto ${dest}
	doins -r *

	fperms 755 ${dest}/bin/{clion.sh,fsnotifier{,64},inspect.sh}
	fperms 755 ${dest}/bin/cmake/bin/cmake{,-x64}
	fperms 755 ${dest}/bin/gdb/x{64,86}/bin/gdb

	newicon bin/${PN}.svg ${PN}.svg
	make_wrapper ${PN} ${dest}/bin/${PN}.sh
	make_desktop_entry ${PN} "CLion" ${PN}
}
