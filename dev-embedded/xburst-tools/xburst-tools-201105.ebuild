# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools

MY_P="${PN}_${PV}"
S="${WORKDIR}"

DESCRIPTION="Tools for booting and flashing Ingenic XBurst CPU based devices"
HOMEPAGE="http://projects.qi-hardware.com/index.php/p/xburst-tools/"
SRC_URI="http://projects.qi-hardware.com/media/upload/xburst-tools/files/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-firmware"

DEPEND="dev-libs/confuse
	virtual/libusb:1
	firmware? (
		cross-mipsel-openwrt-linux/binutils
		cross-mipsel-openwrt-linux/linux-headers
		cross-mipsel-openwrt-linux/gcc
	)"

RDEPEND="${DEPEND}"

src_prepare(){
	eautoreconf
}

src_configure(){
	econf CROSS_COMPILE=mipsel-openwrt-linux- $(use_enable firmware)
}

