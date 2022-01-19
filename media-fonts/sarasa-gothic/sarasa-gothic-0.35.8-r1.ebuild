# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A CJK programming font based on Iosevka and Source Han Sans."
HOMEPAGE="https://github.com/be5invis/Sarasa-Gothic"
SRC_URI="https://github.com/be5invis/Sarasa-Gothic/releases/download/v${PV}/${PN}-ttf-${PV}.7z"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="classical l10n_zh l10n_ja l10n_ko"

RESTRICT="mirror strip"

DEPEND="
	app-arch/p7zip"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	7z x -o"${S}" "${DISTDIR}/${A}" || die
}

src_configure() {
	use classical || rm *-cl-*.ttf || die
	use l10n_zh || rm *-c-*.ttf || die
	use l10n_zh || rm *-hc-*.ttf || die
	use l10n_zh || rm *-tc-*.ttf || die
	use l10n_ja || rm *-j-*.ttf || die
	use l10n_ko || rm *-k-*.ttf || die
}
