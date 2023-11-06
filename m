Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C618C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:59 +0000 (UTC)
Received: from mail2.g23.pair.com (mail2.g23.pair.com [66.39.132.40])
 by mx.groups.io with SMTP id smtpd.web11.50731.1699266598844379776
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 66.39.132.40, mailfrom: bluelightning@bluelightning.org)
Received: from mail2.g23.pair.com (localhost [127.0.0.1])
	by mail2.g23.pair.com (Postfix) with ESMTP id 381FF28477;
	Mon,  6 Nov 2023 05:29:58 -0500 (EST)
Received: from linc.fritz.box (unknown [161.29.74.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.g23.pair.com (Postfix) with ESMTPSA id 5B5E128535;
	Mon,  6 Nov 2023 05:29:57 -0500 (EST)
From: Paul Eggleton <bluelightning@bluelightning.org>
To: docs@lists.yoctoproject.org
Cc: michael.opdenacker@bootlin.com
Subject: [PATCH 06/12] release-notes-4.3: add CVEs, recipe upgrades, license changes, contributors
Date: Mon,  6 Nov 2023 23:29:36 +1300
Message-Id: <e46a9e5e10cbb28925025cb68d3c33e6a3292fab.1699266393.git.bluelightning@bluelightning.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699266393.git.bluelightning@bluelightning.org>
References: <cover.1699266393.git.bluelightning@bluelightning.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: mailmunge 3.10 on 66.39.132.40
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:29:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4592

Add the list of CVE fixes, recipe upgrades (from commits since layer
index version comparison not currently working), license changes and
contributor list.

Signed-off-by: Paul Eggleton <bluelightning@bluelightning.org>
---
 .../migration-guides/release-notes-4.3.rst    | 571 +++++++++++++++++-
 1 file changed, 570 insertions(+), 1 deletion(-)

diff --git a/documentation/migration-guides/release-notes-4.3.rst b/docum=
entation/migration-guides/release-notes-4.3.rst
index dd61a9c8e41..b4d6ae1f974 100644
--- a/documentation/migration-guides/release-notes-4.3.rst
+++ b/documentation/migration-guides/release-notes-4.3.rst
@@ -6,7 +6,7 @@ Release notes for 4.3 (nanbield)
 New Features / Enhancements in 4.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
--  Linux kernel 6.5 and 6.1, gcc 13, glibc 2.38, LLVM 17, and other reci=
pe upgrades
+-  Linux kernel 6.5 and 6.1, gcc 13, glibc 2.38, LLVM 17, and over 300 o=
ther recipe upgrades
=20
 -  The autobuilder's shared-state artefacts are now available over the `=
jsDelivr
    <https://jsdelivr.com>`__ Content Delivery Network (CDN).
@@ -234,16 +234,585 @@ New Features / Enhancements in 4.3
 Known Issues in 4.3
 ~~~~~~~~~~~~~~~~~~~
=20
+
+
 Recipe License changes in 4.3
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
 The following corrections have been made to the :term:`LICENSE` values s=
et by recipes:
=20
+- ``glib-networking``: make :term:`LICENSE` more accurate (``LGPL-2.1`` =
-> ``LGPL-2.1-or-later``) and add an exception for linking to OpenSSL if =
it is enabled (``openssl`` is in :term:`PACKAGECONFIG`)
+- ``libbsd``: set per-package licensing to clarify that BSD-4-Clause cod=
e is only in the ``-doc`` package
+- ``openssh``: BSD-4-Clause code has been removed completely from the co=
debase as part of 9.4p1 update - previously in the kirkstone release, ``B=
SD-4-Clause`` was removed from the :term:`LICENSE` value in our recipe, h=
owever some BSD-4-Clause code actually still remained upstream until 9.4p=
1.
+- ``python3-sphinx``: remove ``BSD-3-Clause`` from :term:`LICENSE` - BSD=
-3-Clause code was removed as part of the python3-sphinx 7.0.1 release (s=
ee `this upstream commit <https://github.com/sphinx-doc/sphinx/commit/a7f=
5d91c29d6f377b9fe7e926965c6f9d3e7b802>`__)
+
+
 Security Fixes in 4.3
 ~~~~~~~~~~~~~~~~~~~~~
=20
+- bind: :cve:`2023-2911`, :cve:`2023-2828`, :cve:`2023-3341`, :cve:`2023=
-4236`
+- binutils: :cve:`2023-1972`
+- connman: :cve:`2023-28488`
+- cups: :cve:`2023-32324`, :cve:`2023-34241`, :cve:`2023-4504`
+- dbus: :cve:`2023-34969`
+- dmidecode: :cve:`2023-30630`
+- dropbear: :cve:`2023-36328`
+- erofs-utils: :cve:`2023-33551`, :cve:`2023-33552`
+- gcc: :cve:`2023-4039`
+- ghostscript: :cve:`2023-28879`, :cve:`2023-36664`, :cve:`2023-38559;` =
ignore :cve:`2023-38560`
+- git: :cve:`2023-25652`, :cve:`2023-29007`
+- glibc: :cve:`2023-4527`, :cve:`2023-4806`
+- go: :cve:`2023-24537`, :cve:`2023-39325`
+- gstreamer: :cve:`2023-40475`, :cve:`2023-40476`
+- inetutils: :cve:`2023-40303`
+- libarchive: ignore :cve:`2023-30571`
+- librsvg: :cve:`2023-38633`
+- libwebp: :cve:`2023-1999`, :cve:`2023-4863`
+- libx11: :cve:`2023-3138`, :cve:`2023-43785`, :cve:`2023-43786`, :cve:`=
2023-43787`
+- libxml2: :cve:`2023-28484`, :cve:`2023-29469;` ignore disputed :cve:`2=
023-45322`
+- libxpm: :cve:`2023-43788`, :cve:`2023-43789`, :cve:`2022-44617`
+- linux: update CVE exclusions
+- ncurses: :cve:`2023-29491`
+- nghttp2: :cve:`2023-44487`
+- ninja: ignore :cve:`2021-4336`, wrong ninja
+- openssh: :cve:`2023-38408`
+- openssl: :cve:`2023-2650`, :cve:`2023-1255`, :cve:`2023-0466`, :cve:`2=
023-0465`, :cve:`2023-0464`, :cve:`2023-3817`, :cve:`2023-3446`, :cve:`20=
23-2975`, :cve:`2023-4807`
+- perl: :cve:`2023-31484`, :cve:`2023-31486`
+- pixman: ignore :cve:`2023-37769`
+- procps: :cve:`2023-4016`
+- python3-git: :cve:`2023-41040`
+- python3: ignore :cve:`2023-36632`
+- python3-urllib3: :cve:`2023-43804`
+- qemu: :cve:`2023-40360`, :cve:`2023-42467;` ignore :cve:`2023-0664` (W=
indows-specific), ignore :cve:`2023-2680` (RHEL specific)
+- screen: :cve:`2023-24626`
+- shadow: :cve:`2023-29383`
+- sqlite3: ignore :cve:`2023-36191`
+- sysstat: :cve:`2023-33204`
+- tiff: :cve:`2022-4645`, :cve:`2023-2731`, :cve:`2023-26965`, :cve:`202=
3-40745`, :cve:`2023-41175`
+- vim: :cve:`2023-2426`, :cve:`2023-2609`, :cve:`2023-2610`, :cve:`2023-=
3896`, :cve:`2023-5441`, :cve:`2023-5535`
+- zlib: ignore :cve:`2023-45853`
+
+
 Recipe Upgrades in 4.3
 ~~~~~~~~~~~~~~~~~~~~~~
=20
+- acpica: upgrade 20220331 -> 20230628
+- adwaita-icon-theme: 43 -> 45.0
+- alsa-lib: upgrade 1.2.8 -> 1.2.10
+- alsa-ucm-conf: upgrade 1.2.8 -> 1.2.10
+- alsa-utils: upgrade 1.2.8 -> 1.2.10
+- apr: upgrade 1.7.2 -> 1.7.4
+- apt: Upgrade to v2.6.0
+- at-spi2-core: update 2.46.0 -> 2.50.0
+- autoconf: Upgrade to 2.72c
+- babeltrace2: upgrade 2.0.4 -> 2.0.5
+- bind: upgrade 9.18.12 -> 9.18.19
+- binutils: Upgrade to 2.41 release
+- bluez5: upgrade 5.66 -> 5.69
+- boost: upgrade 1.81.0 -> 1.83.0
+- btrfs-tools: upgrade 6.1.3 -> 6.5.1
+- busybox: 1.36.0 -> 1.36.1
+- ccache: upgrade 4.7.4 -> 4.8.3
+- cmake: upgrade to 3.27.5
+- connman: update 1.41 -> 1.42
+- coreutils: upgrade 9.1 -> 9.4
+- cpio: upgrade to 2.14
+- cracklib: upgrade 2.9.10 -> 2.9.11
+- createrepo-c: update 0.20.1 -> 1.0.0
+- cryptodev: update to 1.13 + latest git
+- cups: upgrade to 2.4.6
+- curl: upgrade 8.0.1 -> 8.4.0
+- dbus: upgrade 1.14.6 -> 1.14.10
+- debianutils: upgrade 5.8 -> 5.13
+- dhcpcd: upgrade to 10.0.2
+- diffoscope: upgrade 236 -> 249
+- diffutils: update 3.9 -> 3.10
+- dmidecode: upgrade to 3.5
+- dnf: upgrade 4.14.0 -> 4.17.0
+- dos2unix: upgrade 7.4.4 -> 7.5.1
+- dpkg: upgrade to v1.22.0
+- efivar: Upgrade to tip of trunk
+- elfutils: upgrade 0.188 -> 0.189
+- ell: upgrade 0.56 -> 0.58
+- enchant2: upgrade 2.3.4 -> 2.6.1
+- epiphany: upgrade 43.1 -> 44.6
+- erofs-utils: update 1.5 -> 1.6
+- ethtool: upgrade 6.2 -> 6.5
+- eudev: Upgrade 3.2.11 -> 3.2.12
+- ffmpeg: update 5.1.2 -> 6.0
+- file: upgrade 5.44 -> 5.45
+- flac: Upgrade 1.4.2 -> 1.4.3
+- font-util: upgrade 1.4.0 -> 1.4.1
+- freetype: upgrade 2.13.0 -> 2.13.2
+- fribidi: upgrade 1.0.12 -> 1.0.13
+- gawk: upgrade 5.2.1 -> 5.2.2
+- gcc: upgrade to 13.2
+- gcompat: Upgrade to 1.1.0
+- gcr: update 4.0.0 -> 4.1.0
+- gdb: upgrade 13.1 -> 13.2
+- gettext: upgrade 0.21.1 -> 0.22
+- ghostscript: upgrade to 10.02.0
+- git: upgrade to 2.42.0
+- glib-2.0: upgrade 2.74.6 -> 2.78.0
+- glibc: upgrade to 2.38 + stable updates
+- glib-networking: upgrade 2.74.0 -> 2.76.1
+- glslang: upgrade to 1.3.243
+- gmp: upgrade 6.2.1 -> 6.3.0
+- gnu-efi: upgrade 3.0.15 -> 3.0.17
+- gnupg: upgrade 2.4.0 -> 2.4.3
+- gnutls: update 3.8.0 -> 3.8.1
+- gobject-introspection: upgrade 1.74.0 -> 1.78.1
+- go-helloworld: Upgrade to tip of trunk
+- go: update 1.20.1 -> 1.20.10
+- gpgme: update 1.18.0 -> 1.22.0
+- grep: upgrade 3.10 -> 3.11
+- groff: update 1.22.4 -> 1.23.0
+- gsettings-desktop-schemas: upgrade 43.0 -> 44.0
+- gstreamer1.0: upgrade 1.22.0 -> 1.22.5
+- gstreamer: upgrade 1.22.5 -> 1.22.6
+- gtk+3: upgrade 3.24.36 -> 3.24.38
+- gtk4: update 4.10.0 -> 4.12.3
+- gzip: update 1.12 -> 1.13
+- harfbuzz: upgrade 7.1.0 -> 8.2.1
+- icu: upgrade 72-1 -> 73-2
+- igt-gpu-tools: update 1.27.1 -> 1.28
+- iproute2: upgrade 6.2.0 -> 6.5.0
+- iso-codes: upgrade 4.13.0 -> 4.15.0
+- jquery: upgrade 3.6.3 -> 3.7.1
+- json-c: upgrade 0.16 -> 0.17
+- kbd: upgrade 2.5.1 -> 2.6.3
+- kea: upgrade to v2.4.0
+- kexec-tools: upgrade 2.0.26 -> 2.0.27
+- kmscube: upgrade to latest revision
+- less: update 608 -> 643
+- libadwaita: upgrade 1.3.3 -> 1.4.0
+- libarchive: upgrade 3.6.2 -> 3.7.2
+- libassuan: upgrade 2.5.5 -> 2.5.6
+- libatomic-ops: update 7.6.14 -> 7.8.0
+- libcap: upgrade 2.67 -> 2.69
+- libcgroup: update 3.0.0 -> 3.1.0
+- libconvert-asn1-perl: upgrade 0.33 -> 0.34
+- libdnf: update 0.70.1 -> 0.70.1
+- libdrm: upgrade 2.4.115 -> 2.4.116
+- libedit: upgrade 20221030-3.1 -> 20230828-3.1
+- libevdev: upgrade 1.13.0 -> 1.13.1
+- libgcrypt: update 1.10.1 -> 1.10.2
+- libgit2: upgrade 1.6.3 -> 1.7.1
+- libglu: update 9.0.2 -> 9.0.3
+- libgpg-error: update 1.46 -> 1.47
+- libgudev: upgrade 237 -> 238
+- libhandy: upgrade 1.8.1 -> 1.8.2
+- libinput: upgrade to 1.24.0
+- libjpeg-turbo: upgrade to 3.0.0
+- libksba: upgrade 1.6.3 -> 1.6.4
+- libmd: upgrade 1.0.4 -> 1.1.0
+- libmicrohttpd: upgrade 0.9.76 -> 0.9.77
+- libmodule-build-perl: upgrade 0.4232 -> 0.4234
+- libmodulemd: upgrade 2.14.0 -> 2.15.0
+- libnl: upgrade 3.7.0 -> 3.8.0
+- libnss-nis: upgrade 3.1 -> 3.2
+- libpam: update 1.5.2 -> 1.5.3
+- libpcap: upgrade 1.10.3 -> 1.10.4
+- libpng: upgrade 1.6.39 -> 1.6.40
+- libportal: upgrade 0.6 -> 0.7.1
+- libproxy: update 0.4.18 -> 0.5.3
+- libpthread-stubs: update 0.4 -> 0.5
+- librepo: upgrade 1.15.1 -> 1.16.0
+- librsvf: update 2.54.5 -> 2.56.0
+- librsvg: update 2.56.0 -> 2.56.3
+- libsdl2: upgrade 2.26.3 -> 2.28.3
+- libsecret: upgrade 0.20.5 -> 0.21.1
+- libsndfile1: upgrade 1.2.0 -> 1.2.2
+- libsolv: upgrade 0.7.23 -> 0.7.25
+- libsoup: upgrade 3.2.2 -> 3.4.2
+- libssh2: update 1.10.0 -> 1.11.0
+- libtraceevent: upgrade 1.7.2 -> 1.7.3
+- libubootenv: upgrade 0.3.3 -> 0.3.4
+- liburi-perl: update 5.17 -> 5.21
+- libuv: upgrade 1.44.2 -> 1.46.0
+- libva: update 2.16 -> 2.19.0
+- libva-utils: update 2.19.0 -> 2.20.0
+- libwebp: upgrade 1.3.0 -> 1.3.2
+- libx11: upgrade 1.8.4 -> 1.8.7
+- libxcb: upgrade 1.15 -> 1.16
+- libxcrypt: upgrade 4.4.33 -> 4.4.36
+- libxfixes: Upgrade to v6.0.1
+- libxft: upgrade 2.3.7 -> 2.3.8
+- libxi: upgrade to v1.8.1
+- libxml2: upgrade 2.10.3 -> 2.11.5
+- libxpm: upgrade 3.5.15 -> 3.5.17
+- libxslt: upgrade 1.1.37 -> 1.1.38
+- libxt: Upgrade to v1.3.0
+- lighttpd: upgrade 1.4.69 -> 1.4.71
+- linux-firmware: upgrade 20230210 -> 20230804
+- linux-libc-headers: uprev to v6.5
+- linux-yocto/6.1: update to v6.1.57
+- linux-yocto-dev: update to v6.6-rcX
+- linux-yocto: introduce 6.5 reference kernel recipes
+- llvm: Upgrade to 17.0.2
+- ltp: upgrade 20230127 -> 20230516
+- lttng-modules: Upgrade 2.13.9 -> 2.13.10
+- lttng-tools: Upgrade 2.13.9 -> 2.13.11
+- lttng-ust: upgrade 2.13.5 -> 2.13.6
+- lua: update 5.4.4 -> 5.4.6
+- man-pages: upgrade 6.03 -> 6.05.01
+- mc: upgrade 4.8.29 -> 4.8.30
+- mesa: upgrade 23.0.0 -> 23.2.1
+- meson: upgrade 1.0.1 -> 1.2.2
+- mmc-utils: upgrade to latest revision
+- mobile-broadband-provider-info: upgrade 20221107 -> 20230416
+- mpfr: upgrade 4.2.0 -> 4.2.1
+- mpg123: upgrade 1.31.2 -> 1.31.3
+- msmtp: upgrade 1.8.23 -> 1.8.24
+- mtd-utils: upgrade 2.1.5 -> 2.1.6
+- mtools: upgrade 4.0.42 -> 4.0.43
+- musl: update to latest master
+- neard: upgrade 0.18 -> 0.19
+- nettle: upgrade 3.8.1 -> 3.9.1
+- nfs-utils: upgrade 2.6.2 -> 2.6.3
+- nghttp2: upgrade 1.52.0 -> 1.57.0
+- ofono: upgrade 2.0 -> 2.1
+- openssh: upgrade to 9.5p1
+- openssl: upgrade 3.1.0 -> 3.1.3
+- opkg: upgrade 0.6.1 -> 0.6.2
+- opkg-utils: upgrade 0.5.0 -> 0.6.2
+- orc: upgrade 0.4.33 -> 0.4.34
+- ovmf: update 202211 -> 202305
+- ovmf: update edk2-stable202305 -> edk2-stable202308
+- p11-kit: upgrade 0.24.1 -> 0.25.0
+- pango: upgrade 1.50.13 -> 1.51.0
+- parted: upgrade 3.5 -> 3.6
+- patchelf: Upgrade 0.17.2 -> 0.18.0
+- pciutils: upgrade 3.9.0 -> 3.10.0
+- perlcross: update 1.4 -> 1.5
+- perl: update 5.36.0 -> 5.38.0
+- piglit: upgrade to latest revision
+- pigz: upgrade 2.7 -> 2.8
+- pkgconf: upgrade 1.9.4 -> 2.0.3
+- ppp: upgrade 2.4.9 -> 2.5.0
+- procps: update 4.0.3 -> 4.0.4
+- puzzles: upgrade to latest revision
+- python3-attrs: upgrade 22.2.0 -> 23.1.0
+- python3-build: upgrade to 1.0.3
+- python3-certifi: upgrade 2022.12.7 -> 2023.7.22
+- python3-chardet: upgrade 5.1.0 -> 5.2.0
+- python3-cryptography{-vectors}: upgrade 39.0.2 -> 41.0.4
+- python3-cython: upgrade 0.29.33 -> 0.29.36
+- python3-dbusmock: upgrade 0.28.7 -> 0.29.1
+- python3-docutils: upgrade 0.19 -> 0.20.1
+- python3-dtc: upgrade 1.6.1 -> 1.7.0
+- python3-dtschema: upgrade 2023.1 -> 2023.7
+- python3-editables: upgrade 0.3 -> 0.5
+- python3-flit-core: upgrade 3.8.0 -> 3.9.0
+- python3-git: upgrade 3.1.31 -> 3.1.36
+- python3-hatch-fancy-pypi-readme: upgrade 22.8.0 -> 23.1.0
+- python3-hatchling: upgrade 1.13.0 -> 1.18.0
+- python3-hypothesis: upgrade 6.68.2 -> 6.86.2
+- python3-importlib-metadata: upgrade 6.0.0 -> 6.8.0
+- python3-installer: upgrade 0.6.0 -> 0.7.0
+- python3-iso8601: upgrade 1.1.0 -> 2.0.0
+- python3-jsonpointer: upgrade to 2.4
+- python3-libarchive-c: upgrade 4.0 -> 5.0
+- python3-lxml: upgrade 4.9.2 -> 4.9.3
+- python3-markdown: upgrade 3.4.1 -> 3.4.4
+- python3-markupsafe: upgrade 2.1.2 -> 2.1.3
+- python3-more-itertools: upgrade 9.1.0 -> 10.1.0
+- python3-numpy: upgrade 1.24.2 -> 1.26.0
+- python3-packaging: upgrade 23.0 -> 23.1
+- python3-pathspec: upgrade 0.11.0 -> 0.11.2
+- python3-pip: upgrade 23.0.1 -> 23.2.1
+- python3-pluggy: upgrade 1.0.0 -> 1.3.0
+- python3-poetry-core: upgrade 1.5.2 -> 1.7.0
+- python3-psutil: upgrade 5.9.4 -> 5.9.5
+- python3-pyasn1: upgrade 0.4.8 -> 0.5.0
+- python3-pycairo: upgrade 1.23.0 -> 1.24.0
+- python3-pycryptodome: upgrade 3.17 -> 3.19.0
+- python3-pycryptodomex: upgrade 3.17 -> 3.19.0
+- python3-pyelftools: upgrade 0.29 -> 0.30
+- python3-pygments: upgrade 2.14.0 -> 2.16.1
+- python3-pygobject: upgrade 3.42.2 -> 3.46.0
+- python3-pyopenssl: upgrade 23.0.0 -> 23.2.0
+- python3-pyparsing: upgrade 3.0.9 -> 3.1.1
+- python3-pytest-subtests: upgrade 0.10.0 -> 0.11.0
+- python3-pytest: upgrade 7.2.2 -> 7.4.2
+- python3-pytz: upgrade 2022.7.1 -> 2023.3
+- python3-pyyaml: upgrade 6.0 -> 6.0.1
+- python3-requests: Upgrade to 2.31.0
+- python3-ruamel-yaml: upgrade 0.17.21 -> 0.17.32
+- python3-setuptools-rust: upgrade 1.5.2 -> 1.7.0
+- python3-setuptools: upgrade 67.6.0 -> 68.2.2
+- python3-smmap: upgrade 5.0.0 -> 6.0.0
+- python3-sphinx-rtd-theme: upgrade 1.2.0 -> 1.3.0
+- python3-sphinx: upgrade 6.1.3 -> 7.2.6
+- python3-trove-classifiers: upgrade 2023.4.29 -> 2023.9.19
+- python3-typing-extensions: upgrade 4.5.0 -> 4.8.0
+- python3: upgrade 3.11.2 -> 3.11.5
+- python3-urllib3: upgrade 1.26.15 -> 2.0.6
+- python3-webcolors: upgrade 1.12 -> 1.13
+- python3-wheel: upgrade 0.40.0 -> 0.41.2
+- python3-zipp: upgrade 3.15.0 -> 3.17.0
+- qemu: Upgrade 7.2.0 -> 8.1.0
+- re2c: upgrade 3.0 -> 3.1
+- repo: upgrade 2.32 -> 2.36.1
+- rpcsvc-proto: Upgrade to 1.4.4
+- rpm2cpio.sh: update to the last 4.x version
+- rpm: update 4.18.0 -> 4.18.1
+- ruby: upgrade 3.2.1 -> 3.2.2
+- rust: Upgrade 1.68.1 -> 1.70.0
+- screen: update 4.9.0 -> 4.9.1
+- seatd: upgrade 0.7.0 -> 0.8.0
+- serf: upgrade 1.3.9 -> 1.3.10
+- shaderc: upgrade 2023.2 -> 2023.6
+- spirv-headers: upgrade 1.3.239.0 -> 1.3.243.0
+- spirv-tools: upgrade 1.3.239.0 -> 1.3.243.0
+- sqlite3: upgrade 3.41.0 -> 3.43.1
+- squashfs-tools: upgrade 4.5.1 -> 4.6.1
+- sstatesig: Update to match bitbake changes to runtaskdeps
+- strace: upgrade 6.2 -> 6.5
+- stress-ng: upgrade 0.15.06 -> 0.16.05
+- sudo: update 1.9.13p3 -> 1.9.14p3
+- sysfsutils: update 2.1.0 -> 2.1.1
+- sysklogd: upgrade 2.4.4 -> 2.5.2
+- sysstat: update 12.6.2 -> 12.7.4
+- systemd: upgrade 253.1 -> 254.4
+- systemtap: upgrade 4.8 -> 4.9
+- taglib: upgrade 1.13 -> 1.13.1
+- tar: upgrade 1.34 -> 1.35
+- tcf-agent: Update to 1.8.0 release
+- texinfo: upgrade 7.0.2 -> 7.0.3
+- tiff: upgrade to 4.6.0
+- u-boot: Upgrade to 2023.10
+- util-linux: upgrade 2.38.1 -> 2.39.2
+- vala: upgrade 0.56.4 -> 0.56.13
+- valgrind: update 3.20.0 -> 3.21.0
+- vim: upgrade 9.0.1429 -> 9.0.2048
+- vte: upgrade 0.72.0 -> 0.72.2
+- vulkan-headers: upgrade to 1.3.243
+- vulkan-loader: upgrade to 1.3.243
+- vulkan-samples: update to latest SHA
+- vulkan-tools: upgrade to 1.3.243
+- vulkan: upgrade 1.3.243.0 -> 1.3.261.1
+- waffle: upgrade 1.7.0 -> 1.7.2
+- wayland-protocols: upgrade 1.31 -> 1.32
+- wayland: upgrade 1.21.0 -> 1.22.0
+- wayland-utils: upgrade 1.1.0 -> 1.2.0
+- webkitgtk: update 2.38.5 -> 2.40.5
+- weston: update 11.0.1 -> 12.0.2
+- wget: upgrade 1.21.3 -> 1.21.4
+- wireless-regdb: upgrade 2023.02.13 -> 2023.09.01
+- wpebackend-fdo: upgrade 1.14.0 -> 1.14.2
+- xcb-proto: upgrade 1.15.2 -> 1.16.0
+- xdpyinfo: upgrade 1.3.3 -> 1.3.4
+- xeyes: upgrade 1.2.0 -> 1.3.0
+- xf86-input-libinput: upgrade 1.2.1 -> 1.4.0
+- xf86-input-mouse: upgrade 1.9.4 -> 1.9.5
+- xinput: upgrade to v1.6.4
+- xkeyboard-config: upgrade 2.38 -> 2.39
+- xorgproto: upgrade 2022.2 -> 2023.2
+- xserver-xorg: upgrade 21.1.7 -> 21.1.8
+- xtrans: update 1.4.0 -> 1.5.0
+- xwayland: upgrade 22.1.8 -> 23.2.1
+- xwininfo: upgrade to v1.1.6
+- xxhash: upgrade 0.8.1 -> 0.8.2
+- xz: upgrade 5.4.2 -> 5.4.4
+- zlib: upgrade 1.2.13 -> 1.3
+- zstd: upgrade 1.5.4 -> 1.5.5
+
+
+
+
 Contributors to 4.3
 ~~~~~~~~~~~~~~~~~~~
+
+Thanks to the following people who contributed to this release:
+
+- Adrian Freihofer
+- Alassane Yattara
+- Alberto Pianon
+- Alberto Planas
+- Alejandro Hernandez Samaniego
+- Alexander Kanavin
+- Alexandre Belloni
+- Alexis Lothor=C3=A9
+- Alex Kiernan
+- Andreas Cord-Landwehr
+- Andr=C3=A9 Draszik
+- Andrej Valek
+- Andrew Jeffery
+- Andrey Zhizhikin
+- Angelo Ribeiro
+- Antoine Lubineau
+- Antonin Godard
+- Anuj Mittal
+- Archana Polampalli
+- Armin Kuster
+- Arne Schwerdt
+- Arno Baumfalk
+- Arslan Ahmad
+- Bartosz Golaszewski
+- BELHADJ SALEM Talel
+- BELOUARGA Mohamed
+- Benjamin Bara
+- Benjamin Bouvier
+- Bergin, Peter
+- Bruce Ashfield
+- Changhyeok Bae
+- Changqing Li
+- Charles-Antoine Couret
+- Charlie Wu
+- Chen Qi
+- Chi Xu
+- Chris Laplante
+- Christopher Larson
+- Daniel Ammann
+- Daniel McGregor
+- Daniel Semkowicz
+- David Reyna
+- Deepthi Hemraj
+- Denis OSTERLAND-HEIM
+- Denys Dmytriyenko
+- Derek Straka
+- Dit Kozmaj
+- Dmitry Baryshkov
+- Ed Beroset
+- Eero Aaltonen
+- Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in
+- Emil Ekme=C4=8Di=C4=87
+- Emil Kronborg Andersen
+- Enrico J=C3=B6rns
+- Enrico Scholz
+- Etienne Cordonnier
+- Fabien Mahot
+- Fabio Estevam
+- Fahad Arslan
+- Frank WOLFF
+- Frederic Martinsons
+- Frieder Paape
+- Frieder Schrempf
+- Geoff Parker
+- Hannu Lounento
+- Ian Ray
+- Insu Park
+- Jaeyoon Jung
+- Jamin Lin
+- Jan Garcia
+- Jan Vermaete
+- Jasper Orschulko
+- Jean-Marie Lemetayer
+- J=C3=A9r=C3=A9my Rosen
+- Jermain Horsman
+- Jialing Zhang
+- Joel Stanley
+- Joe Slater
+- Johannes Schrimpf
+- Jon Mason
+- J=C3=B6rg Sommer
+- Jose Quaresma
+- Joshua Watt
+- Julien Stephan
+- Kai Kang
+- Khem Raj
+- Kyle Russell
+- Lee Chee Yang
+- Lei Maohui
+- Leon Anavi
+- Lorenzo Arena
+- Louis Rannou
+- Luan Rafael Carneiro
+- Luca Boccassi
+- Luca Ceresoli
+- Marc Ferland
+- Marcus Flyckt
+- Marek Vasut
+- Mark Asselstine
+- Mark Hatle
+- Markus Niebel
+- Markus Volk
+- Marlon Rodriguez Garcia
+- Marta Rybczynska
+- Martijn de Gouw
+- Martin Jansa
+- Martin Siegumfeldt
+- Matthias Schnelte
+- Mauro Queiros
+- Max Krummenacher
+- Michael Halstead
+- Michael Opdenacker
+- Mickael RAMILISON
+- Mikko Rapeli
+- Ming Liu
+- Mingli Yu
+- Narpat Mali
+- Natasha Bailey
+- Nikhil R
+- Ninad Palsule
+- Ola x Nilsson
+- Oleksandr Hnatiuk
+- Otavio Salvador
+- Ovidiu Panait
+- Pascal Bach
+- Patrick Williams
+- Paul Eggleton
+- Paul Gortmaker
+- Paulo Neves
+- Pavel Zhukov
+- Pawan Badganchi
+- Peter Bergin
+- Peter Hoyes
+- Peter Kjellerstedt
+- Peter Marko
+- Peter Suti
+- Petr Gotthard
+- Petr Kubiz=C5=88=C3=A1k
+- Piotr =C5=81obacz
+- Poonam Jadhav
+- Qiu Tingting
+- Quentin Schulz
+- Randolph Sapp
+- Randy MacLeod
+- Ranjitsinh Rathod
+- Rasmus Villemoes
+- Remi Peuvergne
+- Richard Purdie
+- Riyaz Khan
+- Robert Joslyn
+- Robert P. J. Day
+- Robert Yang
+- Roland Hieber
+- Ross Burton
+- Ryan Eatmon
+- Sakib Sajal
+- Samantha Jalabert
+- Sanjay Chitroda
+- Sean Nyekjaer
+- Sergei Zhmylev
+- Siddharth Doshi
+- Soumya Sambu
+- Staffan Ryd=C3=A9n
+- Stefano Babic
+- Stefan Tauner
+- St=C3=A9phane Veyret
+- Stephan Wurm
+- Sudip Mukherjee
+- Sundeep KOKKONDA
+- Svend Meyland Nicolaisen
+- Tan Wen Yan
+- Thomas Roos
+- Tim Orling
+- Tom Hochstein
+- Tom Isaacson
+- Trevor Gamblin
+- Ulrich =C3=96lmann
+- Victor Kamensky
+- Vincent Davis Jr
+- Virendra Thakur
+- Wang Mingyu
+- Xiangyu Chen
+- Yang Xu
+- Yash Shinde
+- Yi Zhao
+- Yoann Congal
+- Yogita Urade
+- Yuta Hayama
+- Zang Ruochen
+- Zhixiong Chi
--=20
2.34.1


