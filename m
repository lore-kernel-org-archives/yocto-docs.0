Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF74CC071DB
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 20:43:42 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.6166.1713127419846649820
 for <docs@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 13:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 3F12A169FE;
	Sun, 14 Apr 2024 16:43:39 -0400 (EDT)
Received: from localhost.localdomain (unknown [209.210.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id D82A6166FC;
	Sun, 14 Apr 2024 16:43:38 -0400 (EDT)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 7/9] release-notes: Add CVEs, recipe upgrades and contributors for 5.0
Date: Sun, 14 Apr 2024 13:43:16 -0700
Message-Id: <d0182baa07ca6bb009b845fcadb1f7fce81a38bd.1713127068.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713127068.git.bluelightning@bluelightning.org>
References: <cover.1713127068.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 14 Apr 2024 20:43:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5142

* Add CVEs from commits
* Add recipe upgrades using layer index branch comparison
* Add contributors from commits

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 .../migration-guides/release-notes-5.0.rst    | 564 +++++++++++++++++-
 1 file changed, 563 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-5.0.rst b/docum=
entation/migration-guides/release-notes-5.0.rst
index 7767a4229d..21de79a638 100644
--- a/documentation/migration-guides/release-notes-5.0.rst
+++ b/documentation/migration-guides/release-notes-5.0.rst
@@ -264,16 +264,578 @@ The following corrections have been made to the :t=
erm:`LICENSE` values set by re
 Security Fixes in 5.0
 ~~~~~~~~~~~~~~~~~~~~~
=20
+-  avahi: :cve:`2023-1981`, :cve:`2023-38469-2`, :cve:`2023-38470-2`, :c=
ve:`2023-38471-2`, :cve:`2023-38469`, :cve:`2023-38470`, :cve:`2023-38471=
`, :cve:`2023-38472`, :cve:`2023-38473`
+-  bind: :cve:`2023-4408`, :cve:`2023-5517`, :cve:`2023-5679`, :cve:`202=
3-50387`
+-  bluez5: :cve:`2023-45866`
+-  coreutils: :cve:`2024-0684`
+-  cups: :cve:`2023-4504`
+-  curl: :cve:`2023-46218`
+-  expat: :cve:`2024-28757`
+-  gcc: :cve:`2023-4039`
+-  glibc: :cve:`2023-5156`, :cve:`2023-0687`
+-  gnutls: :cve:`2024-0553`, :cve:`2024-0567`, :cve:`2024-28834`, :cve:`=
2024-28835`
+-  go: :cve:`2023-45288`
+-  grub: :cve:`2023-4692`, :cve:`2023-4693`
+-  grub2: :cve:`2023-4001` (ignored), :cve:`2024-1048` (ignored)
+-  libgit2: :cve:`2024-24575`, :cve:`2024-24577`
+-  libsndfile1: :cve:`2022-33065`
+-  libssh2: :cve:`2023-48795`
+-  libuv: :cve:`2024-24806`
+-  libxml2: :cve:`2023-45322` (ignored)
+-  linux-yocto/6.6: :cve:`2020-16119`
+-  openssh: :cve:`2023-48795`, :cve:`2023-51384`, :cve:`2023-51385`
+-  openssl: :cve:`2023-5363`, :cve:`2023-5678`, :cve:`2023-6129`, :cve:`=
2023-6237`, :cve:`2024-0727`
+-  perl: :cve:`2023-47100`
+-  pixman: :cve:`2023-37769` (ignored)
+-  python3-cryptography{-vectors}: :cve:`2023-49083`, :cve:`2024-26130`
+-  python3-urllib3: :cve:`2023-45803`
+-  shadow: :cve:`2023-4641`
+-  sudo: :cve:`2023-42456`
+-  tiff: :cve:`2023-6228`, :cve:`2023-6277`, :cve:`2023-52355`, :cve:`20=
23-52356`
+-  vim: :cve:`2023-46246`, :cve:`2023-48231`, :cve:`2023-48232`, :cve:`2=
023-48233`, :cve:`2023-48234`, :cve:`2023-48235`, :cve:`2023-48236`, :cve=
:`2023-48237`, :cve:`2024-22667`
+-  wpa-supplicant: :cve:`2023-52160`
+-  xserver-xorg: :cve:`2023-5574`, :cve:`2023-6816`, :cve:`2024-0229`, :=
cve:`2024-0408`, :cve:`2024-0409`, :cve:`2024-21885`, :cve:`2024-21886`
+-  xwayland: :cve:`2023-5367`, :cve:`2024-0408`, :cve:`2024-0409`, :cve:=
`2023-6816`, :cve:`2024-0229`, :cve:`2024-21885`, :cve:`2024-21886`
+-  zlib: :cve:`2023-45853` (ignored), :cve:`2023-6992` (ignored)
+
+
 Recipe Upgrades in 5.0
 ~~~~~~~~~~~~~~~~~~~~~~
=20
--  go: update 1.20.10 -> 1.22.1
+-  acl 2.3.1 -> 2.3.2
+-  acpica 20230628 -> 20240322
+-  alsa-lib 1.2.10 -> 1.2.11
+-  alsa-tools 1.2.5 -> 1.2.11
+-  alsa-ucm-conf 1.2.10 -> 1.2.11
+-  alsa-utils 1.2.10 -> 1.2.11
+-  appstream 0.16.3 -> 1.0.2
+-  autoconf 2.72c -> 2.72e
+-  bash 5.2.15 -> 5.2.21
+-  bash-completion 2.11 -> 2.12.0
+-  binutils 2.41 -> 2.42
+-  bluez5 5.69 -> 5.72
+-  boost 1.83.0 -> 1.84.0
+-  boost-build-native 1.83.0 -> 1.84.0
+-  btrfs-tools 6.5.1 -> 6.7.1
+-  cairo 1.16.0 -> 1.18.0
+-  cargo 1.70.0 -> 1.75.0
+-  cargo-c-native 0.9.18 -> 0.9.30+cargo-0.77.0
+-  ccache 4.8.3 -> 4.9.1
+-  cmake 3.27.7 -> 3.28.3
+-  cmake-native 3.27.7 -> 3.28.3
+-  createrepo-c 1.0.0 -> 1.0.4
+-  cronie 1.6.1 -> 1.7.1
+-  cross-localedef-native 2.38+git -> 2.39+git
+-  cups 2.4.6 -> 2.4.7
+-  curl 8.4.0 -> 8.7.1
+-  dbus-wait 0.1+git (6cc6077a36fe=E2=80=A6) -> 0.1+git (64bc7c8fae61=E2=
=80=A6)
+-  debianutils 5.13 -> 5.16
+-  desktop-file-utils 0.26 -> 0.27
+-  dhcpcd 10.0.2 -> 10.0.6
+-  diffoscope 249 -> 259
+-  diffstat 1.65 -> 1.66
+-  dnf 4.17.0 -> 4.19.0
+-  dos2unix 7.5.1 -> 7.5.2
+-  ed 1.19 -> 1.20.1
+-  efivar 38+39+git -> 39+39+git
+-  elfutils 0.189 -> 0.191
+-  ell 0.60 -> 0.63
+-  enchant2 2.6.2 -> 2.6.7
+-  epiphany 44.6 -> 46.0
+-  erofs-utils 1.6 -> 1.7.1
+-  ethtool 6.5 -> 6.7
+-  eudev 3.2.12 -> 3.2.14
+-  expat 2.5.0 -> 2.6.2
+-  ffmpeg 6.0 -> 6.1.1
+-  fontconfig 2.14.2 -> 2.15.0
+-  gawk 5.2.2 -> 5.3.0
+-  gcr 4.1.0 -> 4.2.0
+-  gdb 13.2 -> 14.2
+-  gettext 0.22 -> 0.22.5
+-  gettext-minimal-native 0.22 -> 0.22.5
+-  gi-docgen 2023.1 -> 2023.3
+-  git 2.42.0 -> 2.44.0
+-  glib-2.0 2.78.3 -> 2.78.4
+-  glib-networking 2.76.1 -> 2.78.1
+-  glibc 2.38+git -> 2.39+git
+-  glibc-locale 2.38 -> 2.39+git
+-  glibc-mtrace 2.38 -> 2.39+git
+-  glibc-scripts 2.38 -> 2.39+git
+-  glibc-testsuite 2.38+git -> 2.39+git
+-  glibc-y2038-tests 2.38+git -> 2.39+git
+-  glslang 1.3.261.1 -> 1.3.275.0
+-  gnu-config 20230216+git -> 20240101+git
+-  gnupg 2.4.3 -> 2.4.4
+-  gnutls 3.8.3 -> 3.8.4
+-  go 1.20.12 -> 1.22.2
+-  go-binary-native 1.20.12 -> 1.22.2
+-  go-native 1.20.12 -> 1.22.2
+-  go-runtime 1.20.12 -> 1.22.2
+-  gpgme 1.22.0 -> 1.23.2
+-  grub 2.06 -> 2.12
+-  grub-efi 2.06 -> 2.12
+-  gsettings-desktop-schemas 44.0 -> 46.0
+-  gst-devtools 1.22.9 -> 1.22.11
+-  gstreamer1.0 1.22.9 -> 1.22.11
+-  gstreamer1.0-libav 1.22.9 -> 1.22.11
+-  gstreamer1.0-omx 1.22.9 -> 1.22.11
+-  gstreamer1.0-plugins-bad 1.22.9 -> 1.22.11
+-  gstreamer1.0-plugins-base 1.22.9 -> 1.22.11
+-  gstreamer1.0-plugins-good 1.22.9 -> 1.22.11
+-  gstreamer1.0-plugins-ugly 1.22.9 -> 1.22.11
+-  gstreamer1.0-python 1.22.9 -> 1.22.11
+-  gstreamer1.0-rtsp-server 1.22.9 -> 1.22.11
+-  gstreamer1.0-vaapi 1.22.9 -> 1.22.11
+-  gtk+3 3.24.38 -> 3.24.41
+-  gtk4 4.12.3 -> 4.14.1
+-  harfbuzz 8.2.2 -> 8.3.0
+-  hwlatdetect 2.5 -> 2.6
+-  icu 73-2 -> 74-1
+-  inetutils 2.4 -> 2.5
+-  init-system-helpers 1.65.2 -> 1.66
+-  iproute2 6.5.0 -> 6.7.0
+-  iptables 1.8.9 -> 1.8.10
+-  iputils 20221126 -> 20240117
+-  iso-codes 4.15.0 -> 4.16.0
+-  iw 5.19 -> 6.7
+-  json-glib 1.6.6 -> 1.8.0
+-  kbd 2.6.3 -> 2.6.4
+-  kexec-tools 2.0.27 -> 2.0.28
+-  kmod 30 -> 31
+-  kmscube git -> 0.0.1+git
+-  libadwaita 1.4.2 -> 1.5.0
+-  libbsd 0.11.7 -> 0.12.1
+-  libcap-ng 0.8.3 -> 0.8.4
+-  libcap-ng-python 0.8.3 -> 0.8.4
+-  libcomps 0.1.19 -> 0.1.20
+-  libdnf 0.71.0 -> 0.73.0
+-  libdrm 2.4.116 -> 2.4.120
+-  libffi 3.4.4 -> 3.4.6
+-  libgit2 1.7.1 -> 1.7.2
+-  libgloss 4.3.0+git -> 4.4.0+git
+-  libgpg-error 1.47 -> 1.48
+-  libhandy 1.8.2 -> 1.8.3
+-  libical 3.0.16 -> 3.0.17
+-  libidn2 2.3.4 -> 2.3.7
+-  libinput 1.24.0 -> 1.25.0
+-  libksba 1.6.4 -> 1.6.6
+-  libmicrohttpd 0.9.77 -> 1.0.1
+-  libnl 3.8.0 -> 3.9.0
+-  libnotify 0.8.2 -> 0.8.3
+-  libpciaccess 0.17 -> 0.18
+-  libpcre2 10.42 -> 10.43
+-  libpng 1.6.40 -> 1.6.42
+-  libproxy 0.5.3 -> 0.5.4
+-  libpsl 0.21.2 -> 0.21.5
+-  librepo 1.16.0 -> 1.17.0
+-  librsvg 2.56.3 -> 2.57.1
+-  libsdl2 2.28.4 -> 2.30.0
+-  libseccomp 2.5.4 -> 2.5.5
+-  libsecret 0.21.1 -> 0.21.4
+-  libsolv 0.7.26 -> 0.7.28
+-  libsoup 3.4.2 -> 3.4.4
+-  libstd-rs 1.70.0 -> 1.75.0
+-  libtest-warnings-perl 0.031 -> 0.033
+-  libtirpc 1.3.3 -> 1.3.4
+-  libubootenv 0.3.4 -> 0.3.5
+-  libunistring 1.1 -> 1.2
+-  liburi-perl 5.21 -> 5.27
+-  libusb1 1.0.26 -> 1.0.27
+-  libuv 1.46.0 -> 1.48.0
+-  libva 2.19.0 -> 2.20.0
+-  libva-initial 2.19.0 -> 2.20.0
+-  libwpe 1.14.1 -> 1.14.2
+-  libxext 1.3.5 -> 1.3.6
+-  libxkbcommon 1.5.0 -> 1.6.0
+-  libxkbfile 1.1.2 -> 1.1.3
+-  libxml-parser-perl 2.46 -> 2.47
+-  libxml2 2.11.7 -> 2.12.5
+-  libxmlb 0.3.14 -> 0.3.15
+-  libxrandr 1.5.3 -> 1.5.4
+-  libxvmc 1.0.13 -> 1.0.14
+-  lighttpd 1.4.71 -> 1.4.74
+-  linux-firmware 20240220 -> 20240312
+-  linux-libc-headers 6.5 -> 6.6
+-  linux-yocto 6.1.78+git, 6.5.13+git -> 6.6.23+git
+-  linux-yocto-dev 6.6+git -> 6.9+git
+-  linux-yocto-rt 6.1.78+git, 6.5.13+git -> 6.6.23+git
+-  linux-yocto-tiny 6.1.78+git, 6.5.13+git -> 6.6.23+git
+-  llvm 17.0.3 -> 18.1.2
+-  lsof 4.98.0 -> 4.99.3
+-  ltp 20230516 -> 20240129
+-  lttng-modules 2.13.10 -> 2.13.12
+-  lttng-ust 2.13.6 -> 2.13.7
+-  lzip 1.23 -> 1.24
+-  makedepend 1.0.8 -> 1.0.9
+-  man-db 2.11.2 -> 2.12.0
+-  man-pages 6.05.01 -> 6.06
+-  mc 4.8.30 -> 4.8.31
+-  mesa 23.2.1 -> 24.0.2
+-  mesa-gl 23.2.1 -> 24.0.2
+-  meson 1.2.2 -> 1.3.1
+-  minicom 2.8 -> 2.9
+-  mmc-utils 0.1+git (613495ecaca9=E2=80=A6) -> 0.1+git (b5ca140312d2=E2=
=80=A6)
+-  mpg123 1.31.3 -> 1.32.5
+-  newlib 4.3.0+git -> 4.4.0+git
+-  nghttp2 1.57.0 -> 1.61.0
+-  numactl 2.0.16 -> 2.0.18
+-  ofono 2.1 -> 2.4
+-  opensbi 1.2 -> 1.4
+-  openssh 9.5p1 -> 9.6p1
+-  openssl 3.1.5 -> 3.2.1
+-  opkg 0.6.2 -> 0.6.3
+-  opkg-utils 0.6.2 -> 0.6.3
+-  orc 0.4.34 -> 0.4.38
+-  ovmf edk2-stable202308 -> edk2-stable202402
+-  p11-kit 0.25.0 -> 0.25.3
+-  pango 1.51.0 -> 1.52.0
+-  pciutils 3.10.0 -> 3.11.1
+-  piglit 1.0+gitr (71c21b1157c4=E2=80=A6) -> 1.0+gitr (22eaf6a91cfd=E2=80=
=A6)
+-  pkgconf 2.0.3 -> 2.1.1
+-  psplash 0.1+git (44afb7506d43=E2=80=A6) -> 0.1+git (ecc191375669=E2=80=
=A6)
+-  ptest-runner 2.4.2+git -> 2.4.3+git
+-  pulseaudio 16.1 -> 17.0
+-  puzzles 0.0+git (2d9e414ee316=E2=80=A6) -> 0.0+git (80aac3104096=E2=80=
=A6)
+-  python3 3.11.5 -> 3.12.2
+-  python3-alabaster 0.7.13 -> 0.7.16
+-  python3-attrs 23.1.0 -> 23.2.0
+-  python3-babel 2.12.1 -> 2.14.0
+-  python3-bcrypt 4.0.1 -> 4.1.2
+-  python3-beartype 0.15.0 -> 0.17.2
+-  python3-build 1.0.3 -> 1.1.1
+-  python3-certifi 2023.7.22 -> 2024.2.2
+-  python3-cffi 1.15.1 -> 1.16.0
+-  python3-cryptography 41.0.4 -> 42.0.5
+-  python3-cryptography-vectors 41.0.4 -> 42.0.5
+-  python3-cython 0.29.36 -> 3.0.8
+-  python3-dbusmock 0.29.1 -> 0.31.1
+-  python3-dtschema 2023.7 -> 2024.2
+-  python3-git 3.1.36 -> 3.1.42
+-  python3-gitdb 4.0.10 -> 4.0.11
+-  python3-hatch-fancy-pypi-readme 23.1.0 -> 24.1.0
+-  python3-hatch-vcs 0.3.0 -> 0.4.0
+-  python3-hatchling 1.18.0 -> 1.21.1
+-  python3-hypothesis 6.86.2 -> 6.98.15
+-  python3-idna 3.4 -> 3.6
+-  python3-importlib-metadata 6.8.0 -> 7.0.1
+-  python3-iso8601 2.0.0 -> 2.1.0
+-  python3-jsonschema 4.17.3 -> 4.21.1
+-  python3-license-expression 30.1.1 -> 30.2.0
+-  python3-lxml 4.9.3 -> 5.0.0
+-  python3-mako 1.2.4 -> 1.3.2
+-  python3-markdown 3.4.4 -> 3.5.2
+-  python3-markupsafe 2.1.3 -> 2.1.5
+-  python3-more-itertools 10.1.0 -> 10.2.0
+-  python3-numpy 1.26.0 -> 1.26.4
+-  python3-packaging 23.1 -> 23.2
+-  python3-pathspec 0.11.2 -> 0.12.1
+-  python3-pbr 5.11.1 -> 6.0.0
+-  python3-pip 23.2.1 -> 24.0
+-  python3-pluggy 1.3.0 -> 1.4.0
+-  python3-poetry-core 1.7.0 -> 1.9.0
+-  python3-psutil 5.9.5 -> 5.9.8
+-  python3-pyasn1 0.5.0 -> 0.5.1
+-  python3-pycairo 1.24.0 -> 1.26.0
+-  python3-pycryptodome 3.19.0 -> 3.20.0
+-  python3-pycryptodomex 3.19.0 -> 3.20.0
+-  python3-pygments 2.16.1 -> 2.17.2
+-  python3-pyopenssl 23.2.0 -> 24.0.0
+-  python3-pyrsistent 0.19.3 -> 0.20.0
+-  python3-pytest 7.4.2 -> 8.0.2
+-  python3-pytest-runner 6.0.0 -> 6.0.1
+-  python3-pytz 2023.3 -> 2024.1
+-  python3-ruamel-yaml 0.17.32 -> 0.18.6
+-  python3-scons 4.5.2 -> 4.6.0
+-  python3-setuptools 68.2.2 -> 69.1.1
+-  python3-setuptools-rust 1.7.0 -> 1.9.0
+-  python3-setuptools-scm 7.1.0 -> 8.0.4
+-  python3-spdx-tools 0.8.1 -> 0.8.2
+-  python3-sphinx-rtd-theme 1.3.0 -> 2.0.0
+-  python3-sphinxcontrib-applehelp 1.0.4 -> 1.0.8
+-  python3-sphinxcontrib-devhelp 1.0.2 -> 1.0.6
+-  python3-sphinxcontrib-htmlhelp 2.0.1 -> 2.0.5
+-  python3-sphinxcontrib-qthelp 1.0.3 -> 1.0.7
+-  python3-sphinxcontrib-serializinghtml 1.1.5 -> 1.1.10
+-  python3-subunit 1.4.2 -> 1.4.4
+-  python3-testtools 2.6.0 -> 2.7.1
+-  python3-trove-classifiers 2023.9.19 -> 2024.2.23
+-  python3-typing-extensions 4.8.0 -> 4.10.0
+-  python3-unittest-automake-output 0.1 -> 0.2
+-  python3-urllib3 2.0.7 -> 2.2.1
+-  python3-wcwidth 0.2.6 -> 0.2.13
+-  python3-wheel 0.41.2 -> 0.42.0
+-  qemu 8.1.4 -> 8.2.1
+-  qemu-native 8.1.4 -> 8.2.1
+-  qemu-system-native 8.1.4 -> 8.2.1
+-  repo 2.36.1 -> 2.42
+-  resolvconf 1.91 -> 1.92
+-  rpm 4.18.1 -> 4.19.1
+-  rt-tests 2.5 -> 2.6
+-  rust 1.70.0 -> 1.75.0
+-  rust-cross-canadian 1.70.0 -> 1.75.0
+-  rust-llvm 1.70.0 -> 1.75.0
+-  shaderc 2023.6 -> 2023.8
+-  shadow 4.13 -> 4.14.2
+-  shared-mime-info 2.2 -> 2.4
+-  socat 1.7.4.4 -> 1.8.0.0
+-  spirv-headers 1.3.261.1 -> 1.3.275.0
+-  spirv-tools 1.3.261.1 -> 1.3.275.0
+-  sqlite3 3.43.2 -> 3.45.1
+-  strace 6.5 -> 6.7
+-  stress-ng 0.16.05 -> 0.17.05
+-  subversion 1.14.2 -> 1.14.3
+-  swig 4.1.1 -> 4.2.1
+-  sysstat 12.7.4 -> 12.7.5
+-  systemd 254.4 -> 255.4
+-  systemd-boot 254.4 -> 255.4
+-  systemd-bootchart 234 -> 235
+-  systemtap 4.9 -> 5.0
+-  systemtap-native 4.9 -> 5.0
+-  taglib 1.13.1 -> 2.0
+-  ttyrun 2.29.0 -> 2.31.0
+-  u-boot 2023.10 -> 2024.01
+-  u-boot-tools 2023.10 -> 2024.01
+-  update-rc.d 0.8 (8636cf478d42=E2=80=A6) -> 0.8 (b8f950105010=E2=80=A6=
)
+-  usbutils 015 -> 017
+-  util-linux 2.39.2 -> 2.39.3
+-  util-linux-libuuid 2.39.2 -> 2.39.3
+-  vala 0.56.13 -> 0.56.15
+-  valgrind 3.21.0 -> 3.22.0
+-  vim 9.0.2190 -> 9.1.0114
+-  vim-tiny 9.0.2190 -> 9.1.0114
+-  virglrenderer 0.10.4 -> 1.0.1
+-  vte 0.72.2 -> 0.74.2
+-  vulkan-headers 1.3.261.1 -> 1.3.275.0
+-  vulkan-loader 1.3.261.1 -> 1.3.275.0
+-  vulkan-tools 1.3.261.1 -> 1.3.275.0
+-  vulkan-validation-layers 1.3.261.1 -> 1.3.275.0
+-  wayland-protocols 1.32 -> 1.33
+-  webkitgtk 2.40.5 -> 2.44.0
+-  weston 12.0.2 -> 13.0.0
+-  xkbcomp 1.4.6 -> 1.4.7
+-  xkeyboard-config 2.39 -> 2.41
+-  xprop 1.2.6 -> 1.2.7
+-  xwayland 23.2.4 -> 23.2.5
+-  xz 5.4.4 -> 5.4.6
+-  zlib 1.3 -> 1.3.1
+
=20
 Contributors to 5.0
 ~~~~~~~~~~~~~~~~~~~
=20
 Thanks to the following people who contributed to this release:
=20
+-  Adam Johnston
+-  Adithya Balakumar
+-  Adrian Freihofer
+-  Alassane Yattara
+-  Alejandro Hernandez Samaniego
+-  Aleksey Smirnov
+-  Alexander Kanavin
+-  Alexander Lussier-Cullen
+-  Alexander Sverdlin
+-  Alexandre Belloni
+-  Alexandre Truong
+-  Alex Benn=C3=A9e
+-  Alexis Lothor=C3=A9
+-  Alex Kiernan
+-  Alex Stewart
+-  Andr=C3=A9 Draszik
+-  Anibal Limon
+-  Anuj Mittal
+-  Archana Polampalli
+-  Arne Schwerdt
+-  Bartosz Golaszewski
+-  Baruch Siach
+-  baruch@tkos.co.il
+-  Bastian Krause
+-  BELHADJ SALEM Talel
+-  BELOUARGA Mohamed
+-  Bruce Ashfield
+-  Changhyeok Bae
+-  Changqing Li
+-  Charlie Johnston
+-  Chen Qi
+-  Chi Xu
+-  Chris Laplante
+-  Christian Taedcke
+-  Christoph Vogtl=C3=A4nder
+-  Claus Stovgaard
+-  Clay Chang
+-  Cl=C3=A9ment P=C3=A9ron
+-  Colin McAllister
+-  Corentin Guillevic
+-  Daniel Ammann
+-  david d zuhn
+-  David Reyna
+-  Deepthi Hemraj
+-  Denys Dmytriyenko
+-  Derek Erdmann
+-  Desone Burns
+-  Dhairya Nagodra
+-  Dmitry Baryshkov
+-  Eero Aaltonen
+-  Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
+-  Emil Kronborg
+-  Enguerrand de Ribaucourt
+-  Enrico J=C3=B6rns
+-  Enrico Scholz
+-  Etienne Cordonnier
+-  Fabien Mahot
+-  Fabio Estevam
+-  Fahad Arslan
+-  Felix Moessbauer
+-  Florian Wickert
+-  Geoff Parker
+-  Glenn Strauss
+-  Harish Sadineni
+-  Hongxu Jia
+-  Ilya A. Kriveshko
+-  Jamin Lin
+-  Jan Vermaete
+-  Jason Andryuk
+-  Javier Tia
+-  Jeremy A. Puhlman
+-  J=C3=A9r=C3=A9my Rosen
+-  Jermain Horsman
+-  Jiang Kai
+-  Joakim Tjernlund
+-  Joao Marcos Costa
+-  Joe Slater
+-  Johan Bezem
+-  Johannes Schneider
+-  Jonathan GUILLOT
+-  Jon Mason
+-  J=C3=B6rg Sommer
+-  Jose Quaresma
+-  Joshua Watt
+-  Julien Stephan
+-  Justin Bronder
+-  Kai Kang
+-  Kareem Zarka
+-  Kevin Hao
+-  Khem Raj
+-  Konrad Weihmann
+-  Lee Chee Yang
+-  Lei Maohui
+-  lixiaoyong
+-  Logan Gunthorpe
+-  Luca Ceresoli
+-  luca fancellu
+-  Lucas Stach
+-  Ludovic Jozeau
+-  Lukas Funke
+-  Maanya Goenka
+-  Malte Schmidt
+-  Marcel Ziswiler
+-  Marco Felsch
+-  Marcus Folkesson
+-  Marek Vasut
+-  Mark Asselstine
+-  Mark Hatle
+-  Markus Fuchs
+-  Markus Volk
+-  Marlon Rodriguez Garcia
+-  Marta Rybczynska
+-  Martin Hundeb=C3=B8ll
+-  Martin Jansa
+-  Massimiliano Minella
+-  Maxin B. John
+-  Max Krummenacher
+-  Meenali Gupta
+-  Michael Halstead
+-  Michael Opdenacker
+-  Michal Sieron
+-  Mikko Rapeli
+-  Ming Liu
+-  Mingli Yu
+-  Munehisa Kamata
+-  Nick Owens
+-  Niko Mauno
+-  Ola x Nilsson
+-  Oleh Matiusha
+-  Patrick Williams
+-  Paul Barker
+-  Paul Eggleton
+-  Paul Gortmaker
+-  Pavel Zhukov
+-  Peter A. Bigot
+-  Peter Kjellerstedt
+-  Peter Marko
+-  Petr Vorel
+-  Philip Balister
+-  Philip Lorenz
+-  Philippe Rivest
+-  Piotr =C5=81obacz
+-  Priyal Doshi
+-  Quentin Schulz
+-  Ragesh Nair
+-  Randolph Sapp
+-  Randy MacLeod
+-  Rasmus Villemoes
+-  Renat Khalikov
+-  Richard Haar
+-  Richard Purdie
+-  Robert Berger
+-  Robert Joslyn
+-  Robert P. J. Day
+-  Robert Yang
+-  Rodrigo M. Duarte
+-  Ross Burton
+-  Rouven Czerwinski
+-  Ryan Eatmon
+-  Sam Van Den Berge
+-  Saul Wold
+-  Sava Jakovljev
+-  Sean Nyekjaer
+-  Sergei Zhmylev
+-  Shinji Matsunaga
+-  Shubham Kulkarni
+-  Simone Wei=C3=9F
+-  Siong W.LIM
+-  Soumya Sambu
+-  Sourav Kumar Pramanik
+-  Stefan Herbrechtsmeier
+-  St=C3=A9phane Veyret
+-  Steve Sakoman
+-  Sundeep KOKKONDA
+-  Thomas Perrot
+-  Thomas Wolber
+-  Timon Bergelt
+-  Tim Orling
+-  Timotheus Giuliani
+-  Tobias Hagelborn
+-  Tom Hochstein
+-  Tom Rini
+-  Toni Lammi
+-  Trevor Gamblin
+-  Trevor Woerner
+-  Ulrich =C3=96lmann
+-  Valek Andrej
+-  venkata pyla
+-  Victor Kamensky
+-  Vijay Anusuri
+-  Vikas Katariya
+-  Vincent Davis Jr
+-  Viswanath Kraleti
+-  Vyacheslav Yurkov
+-  Wang Mingyu
+-  William A. Kennington III
+-  William Hauser
+-  William Lyu
+-  Xiangyu Chen
+-  Xiaotian Wu
+-  Yang Xu
+-  Yannick Rodriguez
+-  Yash Shinde
+-  Yi Zhao
+-  Yoann Congal
+-  Yogesh Tyagi
+-  Yogita Urade
+-  Zahir Hussain
+-  Zang Ruochen
+-  Zoltan Boszormenyi
+
 Repositories / Downloads for Yocto-5.0
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
--=20
2.25.1


