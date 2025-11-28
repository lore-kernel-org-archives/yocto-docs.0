Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3332CD116F3
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 15:35:21 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18710.1764344119769495855
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Nov 2025 07:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=A56HlUo1;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 444781A1DE8
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B73C60706
	for <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62E6310B02060;
	Fri, 28 Nov 2025 16:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764344115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0DURvi3HzUFWPryh4XQSmIhf8Y1VcKrEIZ2kudJNe14=;
	b=A56HlUo1KFpMOxWOCJLWWMxzaa2spMm6W+ebMpfjfZDPHCPU+TkrxvqYPLLY/BUg+Yoqn5
	zzScnC3Ut9U7+OC5uKT94xFy8TIfU02/hL7YLo7kRaLZ4fUU1dN10/+OfwThfFo8CuXMzj
	pVp9exRCOqHPs5TW8JXDMhEuzDBgk6edcGd5FHuyXV3HmyUy88ryqsgc/o1H0CMNa8JQi0
	GKQuyufY+t0xl+b5nOlMd+qUCUDQ7HwGgQ6Kp0TUcgR0cqTPNHRc8k0orO3Ic59JfoG98h
	UlDXwTRAjkHYOwRGJs1uDbgtQcw4Amzj4TxFvL7GIlzF9FJhLtBb5Fpw6JCUcA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Nov 2025 16:35:03 +0100
Subject: [PATCH 6/9] migration-guides/release-notes-5.3.rst: add recipe
 upgrades
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20251128-release-note-5-3-updates-v1-6-6ef679198e80@bootlin.com>
References: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
In-Reply-To: <20251128-release-note-5-3-updates-v1-0-6ef679198e80@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=23209;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=08UeqTZ0jJPfGzQOw91K0LpYighTQmcfUEU06y896QM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpKcEuQcoLH3aN4O5diCXNyK/XOH7yOwDM72MR0
 /ZxzkCqmvmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaSnBLgAKCRDRgEFAKaOo
 NjCDD/4z8GQPtu9nR6xzA57lZB0LU4yH/B5NbC2Jsj4RNDQQADHoos9phJds4PmdnSOU/ZhdYVF
 ZuXuZs0RRB/XALcmemXg/5f3oddHtxUyCC+NnA1FtF9AdVENGlDbjSmWARtUhKVLfe+xs5iuM1F
 If8hwmhDOaE1v51biVZTiX48TXI9i26Vul+8QrW7HmZL5IQC7o5V7FpRegjqqVQOQN3ZsfyO+gM
 7DyhyRE89zmGhkBcNcohP953ORV4cnsw3R4A2QTAVcOoDUze1HlT/Yc4MYpv7O2ONtY/wElp+LY
 wSxMfdGGJglbIM4U8hRq0BQFUBGHgbni6DEzk1kQzHNlFPmyILCeNMCiVrReMmlhpy6t6iiqlz2
 8cdoz6m6cwuN20+oG0Ph+IFqRCgh8cQPiUtSa9IpZ6P3jZQoejHJSf5fMXa/iAfCW4inDlqNYP4
 WSuZGeBjSnne1b8GqtJpM6JFRbjkyyMwtKVQKq1Tg5GWhKfr0pEeaV4ADAWN4n4+VV6dHGWZHDA
 u1r2vVtmBBSmGHX0uUiDGXpV3WcPtMmrR2hMgxcfDAKn5tLQSwoC849q+z0Drjfg7F/5fHxWTby
 sRrwU3V8MrCBkxdnkd5DrL7ytbxaZIAt3Qz4q8lWc1wwe0WAfg3ykGKXddlOC/EVyrV6IgHLzXO
 BmEiazG4tGx+tiA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Nov 2025 15:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8169

Use the layerindex to generate the recipe upgrades between Walnascar and
Whinlatter.

This is also using a patch to layerindex that is not merged[1]. It
allows formatting the output of the layerindex branch comparison tool to
an rST table.

[1]: https://lore.kernel.org/r/20251127-branch-compare-rst-v1-1-4eaf3a66e=
a91@bootlin.com

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.3.rst         | 1145 ++++++++++++++=
+++++-
 1 file changed, 1140 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/release-notes-5.3.rst b/docum=
entation/migration-guides/release-notes-5.3.rst
index f6722fe15..f36104770 100644
--- a/documentation/migration-guides/release-notes-5.3.rst
+++ b/documentation/migration-guides/release-notes-5.3.rst
@@ -1012,6 +1012,10 @@ The following CVEs have been fixed:
 Recipe Upgrades in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=20
+..
+   Generated with https://layers.openembedded.org/layerindex/branch_comp=
arison
+   With "rST" output selected
+
 The following recipes have been upgraded:
=20
 .. list-table::
@@ -1019,11 +1023,1142 @@ The following recipes have been upgraded:
    :header-rows: 1
=20
    * - Recipe
-     - Previous version
-     - New version
-   * - ``recipe name``
-     - Previous version
-     - New version
+     - Previous version(s)
+     - New version(s)
+   * - ``acpica``
+     - 20240827
+     - 20250807
+   * - ``alsa-lib``
+     - 1.2.13
+     - 1.2.14
+   * - ``alsa-tools``
+     - 1.2.11
+     - 1.2.14
+   * - ``alsa-ucm-conf``
+     - 1.2.13
+     - 1.2.14
+   * - ``alsa-utils``
+     - 1.2.13
+     - 1.2.14
+   * - ``appstream``
+     - 1.0.4
+     - 1.0.6
+   * - ``apr``
+     - 1.7.5
+     - 1.7.6
+   * - ``apt``
+     - 2.6.1
+     - 3.0.3
+   * - ``at-spi2-core``
+     - 2.56.0
+     - 2.56.4
+   * - ``autoconf``
+     - 2.72e
+     - 2.72
+   * - ``automake``
+     - 1.17
+     - 1.18.1
+   * - ``babeltrace2``
+     - 2.1.0
+     - 2.1.2
+   * - ``barebox``
+     - 2025.02.0
+     - 2025.11.0
+   * - ``barebox-tools``
+     - 2025.02.0
+     - 2025.11.0
+   * - ``base-passwd``
+     - 3.6.6
+     - 3.6.7
+   * - ``bash``
+     - 5.2.37
+     - 5.3
+   * - ``bc``
+     - 1.08.1
+     - 1.08.2
+   * - ``bind``
+     - 9.20.11
+     - 9.20.15
+   * - ``binutils``
+     - 2.44
+     - 2.45
+   * - ``binutils-cross``
+     - 2.44
+     - 2.45
+   * - ``binutils-cross-canadian``
+     - 2.44
+     - 2.45
+   * - ``binutils-crosssdk``
+     - 2.44
+     - 2.45
+   * - ``binutils-testsuite``
+     - 2.44
+     - 2.45
+   * - ``blktrace``
+     - 1.3.0+git
+     - 1.3.0
+   * - ``bluez5``
+     - 5.79
+     - 5.85
+   * - ``bmaptool``
+     - 3.8.0+git
+     - 3.9.0+git
+   * - ``boost``
+     - 1.87.0
+     - 1.89.0
+   * - ``boost-build-native``
+     - 1.87.0
+     - 1.89.0
+   * - ``btrfs-tools``
+     - 6.13
+     - 6.17
+   * - ``build-appliance-image``
+     - 15.0.0 (316baad50b45=E2=80=A6)
+     - 15.0.0
+   * - ``ca-certificates``
+     - 20241223
+     - 20250419
+   * - ``cargo``
+     - 1.84.1
+     - 1.90.0
+   * - ``cargo-c``
+     - 0.10.5+cargo-0.83.0
+     - 0.10.16+cargo-0.91.0
+   * - ``ccache``
+     - 4.11
+     - 4.12.1
+   * - ``cmake``
+     - 3.31.6
+     - 4.2.0
+   * - ``cmake-native``
+     - 3.31.6
+     - 4.2.0
+   * - ``connman``
+     - 1.43
+     - 1.45
+   * - ``coreutils``
+     - 9.6
+     - 9.7
+   * - ``createrepo-c``
+     - 1.2.0
+     - 1.2.1
+   * - ``cross-localedef-native``
+     - 2.41+git
+     - 2.42+git
+   * - ``cups``
+     - 2.4.11
+     - 2.4.14
+   * - ``curl``
+     - 8.12.1
+     - 8.17.0
+   * - ``debianutils``
+     - 5.21
+     - 5.23.2
+   * - ``debugedit``
+     - 5.1
+     - 5.2
+   * - ``dhcpcd``
+     - 10.2.2
+     - 10.2.4
+   * - ``diffoscope``
+     - 289
+     - 306
+   * - ``diffstat``
+     - 1.67
+     - 1.68
+   * - ``diffutils``
+     - 3.11
+     - 3.12
+   * - ``dnf``
+     - 4.22.0
+     - 4.24.0
+   * - ``dos2unix``
+     - 7.5.2
+     - 7.5.3
+   * - ``dpkg``
+     - 1.22.11
+     - 1.22.21
+   * - ``dropbear``
+     - 2024.86
+     - 2025.88
+   * - ``e2fsprogs``
+     - 1.47.1
+     - 1.47.3
+   * - ``ed``
+     - 1.21
+     - 1.22.2
+   * - ``elfutils``
+     - 0.192
+     - 0.194
+   * - ``ell``
+     - 0.74
+     - 0.80
+   * - ``enchant2``
+     - 2.8.2
+     - 2.8.12
+   * - ``epiphany``
+     - 48.3
+     - 48.5
+   * - ``erofs-utils``
+     - 1.8.5
+     - 1.8.10
+   * - ``ethtool``
+     - 6.11
+     - 6.15
+   * - ``expat``
+     - 2.7.2
+     - 2.7.3
+   * - ``fastfloat``
+     - 8.0.2
+     - 8.1.0
+   * - ``ffmpeg``
+     - 7.1.2
+     - 8.0
+   * - ``flac``
+     - 1.4.3
+     - 1.5.0
+   * - ``fmt``
+     - 11.1.4
+     - 12.1.0
+   * - ``fontconfig``
+     - 2.15.0
+     - 2.17.1
+   * - ``gawk``
+     - 5.3.1
+     - 5.3.2
+   * - ``gcc``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-cross``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-cross-canadian``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-crosssdk``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-runtime``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-sanitizers``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcc-source``
+     - 14.3.0
+     - 15.2.0
+   * - ``gcr``
+     - 4.3.1
+     - 4.4.0.1
+   * - ``gdb``
+     - 16.2
+     - 16.3
+   * - ``gdb-cross``
+     - 16.2
+     - 16.3
+   * - ``gdb-cross-canadian``
+     - 16.2
+     - 16.3
+   * - ``gdbm``
+     - 1.24
+     - 1.26
+   * - ``gettext``
+     - 0.23.1
+     - 0.26
+   * - ``gettext-minimal-native``
+     - 0.23.1
+     - 0.26
+   * - ``ghostscript``
+     - 10.05.1
+     - 10.06.0
+   * - ``gi-docgen``
+     - 2025.3
+     - 2025.5
+   * - ``git``
+     - 2.49.1
+     - 2.51.2
+   * - ``glib-2.0``
+     - 2.84.4
+     - 2.86.1
+   * - ``glib-2.0-initial``
+     - 2.84.4
+     - 2.86.1
+   * - ``glib-networking``
+     - 2.80.0
+     - 2.80.1
+   * - ``glibc``
+     - 2.41+git
+     - 2.42+git
+   * - ``glibc-locale``
+     - 2.41+git
+     - 2.42+git
+   * - ``glibc-mtrace``
+     - 2.41+git
+     - 2.42+git
+   * - ``glibc-scripts``
+     - 2.41+git
+     - 2.42+git
+   * - ``glibc-testsuite``
+     - 2.41+git
+     - 2.42+git
+   * - ``glslang``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``gnu-config``
+     - 20240823+git
+     - 20250709+git
+   * - ``gnu-efi``
+     - 4.0.0
+     - 4.0.2
+   * - ``gnupg``
+     - 2.5.5
+     - 2.5.11
+   * - ``go``
+     - 1.24.6
+     - 1.25.4
+   * - ``go-binary-native``
+     - 1.24.6
+     - 1.25.4
+   * - ``go-cross-canadian``
+     - 1.24.6
+     - 1.25.4
+   * - ``go-cross-core2-32``
+     - 1.24.6
+     - 1.25.4
+   * - ``go-crosssdk``
+     - 1.24.6
+     - 1.25.4
+   * - ``go-helloworld``
+     - 0.1 (d7b0ac127859=E2=80=A6)
+     - 0.1 (8b405629c4a5=E2=80=A6)
+   * - ``go-runtime``
+     - 1.24.6
+     - 1.25.4
+   * - ``gperf``
+     - 3.1
+     - 3.3
+   * - ``gpgme``
+     - 1.24.2
+     - 2.0.1
+   * - ``grep``
+     - 3.11
+     - 3.12
+   * - ``gsettings-desktop-schemas``
+     - 48.0
+     - 49.1
+   * - ``gst-devtools``
+     - 1.24.13
+     - 1.26.7
+   * - ``gst-examples``
+     - 1.18.6
+     - 1.26.7
+   * - ``gstreamer1.0``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-libav``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-plugins-bad``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-plugins-base``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-plugins-good``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-plugins-ugly``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-python``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-rtsp-server``
+     - 1.24.13
+     - 1.26.7
+   * - ``gstreamer1.0-vaapi``
+     - 1.24.13
+     - 1.26.7
+   * - ``gtk+3``
+     - 3.24.43
+     - 3.24.51
+   * - ``gtk4``
+     - 4.18.1
+     - 4.18.6
+   * - ``gzip``
+     - 1.13
+     - 1.14
+   * - ``harfbuzz``
+     - 10.4.0
+     - 11.5.1
+   * - ``hwdata``
+     - 0.393
+     - 0.399
+   * - ``hwlatdetect``
+     - 2.8
+     - 2.9
+   * - ``icu``
+     - 76-1
+     - 77-1
+   * - ``igt-gpu-tools``
+     - 1.30
+     - 2.1
+   * - ``init-system-helpers``
+     - 1.68
+     - 1.69
+   * - ``iproute2``
+     - 6.13.0
+     - 6.17.0
+   * - ``iputils``
+     - 20240905
+     - 20250605
+   * - ``iso-codes``
+     - 4.17.0
+     - 4.18.0
+   * - ``iw``
+     - 6.9
+     - 6.17
+   * - ``json-glib``
+     - 1.10.6
+     - 1.10.8
+   * - ``kbd``
+     - 2.7.1
+     - 2.8.0
+   * - ``kea``
+     - 2.6.3
+     - 3.0.1
+   * - ``kern-tools-native``
+     - 0.3+git (c8c1f17867d0=E2=80=A6)
+     - 0.3+git (f589e1df2325=E2=80=A6)
+   * - ``kexec-tools``
+     - 2.0.30
+     - 2.0.31
+   * - ``kmod``
+     - 34.1
+     - 34.2
+   * - ``kmscube``
+     - 0.0.1+git (311eaaaa473d=E2=80=A6)
+     - 0.0.1+git (f60e50e887d3=E2=80=A6)
+   * - ``less``
+     - 668
+     - 685
+   * - ``libadwaita``
+     - 1.7.0
+     - 1.7.6
+   * - ``libarchive``
+     - 3.7.9
+     - 3.8.3
+   * - ``libatomic-ops``
+     - 7.8.2
+     - 7.8.4
+   * - ``libc-test``
+     - 0+git (18e28496adee=E2=80=A6)
+     - 0+git (f2bac7711bec=E2=80=A6)
+   * - ``libcap``
+     - 2.75
+     - 2.77
+   * - ``libcgroup``
+     - 3.1.0
+     - 3.2.0
+   * - ``libcomps``
+     - 0.1.21
+     - 0.1.23
+   * - ``libdnf``
+     - 0.73.4
+     - 0.75.0
+   * - ``libdrm``
+     - 2.4.124
+     - 2.4.128
+   * - ``libedit``
+     - 20250104-3.1
+     - 20251016-3.1
+   * - ``libevdev``
+     - 1.13.3
+     - 1.13.5
+   * - ``libffi``
+     - 3.4.7
+     - 3.5.2
+   * - ``libgcc``
+     - 14.3.0
+     - 15.2.0
+   * - ``libgcc-initial``
+     - 14.3.0
+     - 15.2.0
+   * - ``libgcrypt``
+     - 1.11.0
+     - 1.11.2
+   * - ``libgfortran``
+     - 14.3.0
+     - 15.2.0
+   * - ``libgit2``
+     - 1.9.0
+     - 1.9.1
+   * - ``libgloss``
+     - 4.4.0+git
+     - 4.5.0+git
+   * - ``libgpg-error``
+     - 1.51
+     - 1.56
+   * - ``libinput``
+     - 1.27.1
+     - 1.29.1
+   * - ``libjitterentropy``
+     - 3.6.2
+     - 3.6.3
+   * - ``libjpeg-turbo``
+     - 3.0.1
+     - 3.1.2
+   * - ``libmicrohttpd``
+     - 1.0.1
+     - 1.0.2
+   * - ``libmodulemd``
+     - 2.15.0
+     - 2.15.2
+   * - ``libnotify``
+     - 0.8.4
+     - 0.8.6
+   * - ``libnss-nis``
+     - 3.2
+     - 3.4
+   * - ``libogg``
+     - 1.3.5
+     - 1.3.6
+   * - ``libpng``
+     - 1.6.47
+     - 1.6.50
+   * - ``libproxy``
+     - 0.5.9
+     - 0.5.10
+   * - ``librepo``
+     - 1.19.0
+     - 1.20.0
+   * - ``librsvg``
+     - 2.59.2
+     - 2.61.0
+   * - ``libsdl2``
+     - 2.32.2
+     - 2.32.10
+   * - ``libsecret``
+     - 0.21.6
+     - 0.21.7
+   * - ``libslirp``
+     - 4.9.0
+     - 4.9.1
+   * - ``libsolv``
+     - 0.7.31
+     - 0.7.35
+   * - ``libstd-rs``
+     - 1.84.1
+     - 1.90.0
+   * - ``libtheora``
+     - 1.1.1
+     - 1.2.0
+   * - ``libucontext``
+     - 1.2
+     - 1.3.2
+   * - ``libunistring``
+     - 1.3
+     - 1.4.1
+   * - ``libunwind``
+     - 1.6.2
+     - 1.8.3
+   * - ``liburcu``
+     - 0.15.1
+     - 0.15.3
+   * - ``libusb1``
+     - 1.0.27
+     - 1.0.29
+   * - ``libuv``
+     - 1.50.0
+     - 1.51.0
+   * - ``libwebp``
+     - 1.5.0
+     - 1.6.0
+   * - ``libwpe``
+     - 1.16.2
+     - 1.16.3
+   * - ``libxfixes``
+     - 6.0.1
+     - 6.0.2
+   * - ``libxft``
+     - 2.3.8
+     - 2.3.9
+   * - ``libxkbcommon``
+     - 1.8.1
+     - 1.11.0
+   * - ``libxml2``
+     - 2.13.8
+     - 2.14.6
+   * - ``libxmlb``
+     - 0.3.22
+     - 0.3.23
+   * - ``libxres``
+     - 1.2.2
+     - 1.2.3
+   * - ``libxscrnsaver``
+     - 1.2.4
+     - 1.2.5
+   * - ``lighttpd``
+     - 1.4.77
+     - 1.4.81
+   * - ``linux-firmware``
+     - 20250311
+     - 20251111
+   * - ``linux-libc-headers``
+     - 6.12
+     - 6.17
+   * - ``linux-yocto``
+     - 6.12.47+git
+     - 6.12.55+git, 6.16.11+git, 6.17.6+git
+   * - ``linux-yocto-dev``
+     - 6.14+git
+     - 6.18+git
+   * - ``linux-yocto-rt``
+     - 6.12.47+git
+     - 6.12.55+git, 6.16.11+git, 6.17.6+git
+   * - ``linux-yocto-tiny``
+     - 6.12.47+git
+     - 6.12.55+git, 6.16.11+git, 6.17.6+git
+   * - ``llvm``
+     - 20.1.0
+     - 21.1.6
+   * - ``lsof``
+     - 4.99.4
+     - 4.99.5
+   * - ``ltp``
+     - 20250130
+     - 20250930
+   * - ``lttng-modules``
+     - 2.13.17
+     - 2.14.3
+   * - ``lttng-tools``
+     - 2.13.14
+     - 2.14.0
+   * - ``lttng-ust``
+     - 2.13.8
+     - 2.14.0
+   * - ``lua``
+     - 5.4.7
+     - 5.4.8
+   * - ``m4``
+     - 1.4.19
+     - 1.4.20
+   * - ``m4-native``
+     - 1.4.19
+     - 1.4.20
+   * - ``man-db``
+     - 2.13.0
+     - 2.13.1
+   * - ``man-pages``
+     - 6.13
+     - 6.15
+   * - ``mdadm``
+     - 4.3
+     - 4.4
+   * - ``mesa``
+     - 24.0.7
+     - 25.2.5
+   * - ``mesa-gl``
+     - 24.0.7
+     - 25.2.5
+   * - ``meson``
+     - 1.7.0
+     - 1.9.1
+   * - ``mmc-utils``
+     - 0.1+git
+     - 1.0
+   * - ``mobile-broadband-provider-info``
+     - 20240407
+     - 20250613
+   * - ``mpfr``
+     - 4.2.1
+     - 4.2.2
+   * - ``mpg123``
+     - 1.32.10
+     - 1.33.2
+   * - ``msmtp``
+     - 1.8.28
+     - 1.8.31
+   * - ``musl``
+     - 1.2.5+git (c47ad25ea3b4=E2=80=A6)
+     - 1.2.5+git (0ccaf0572e9c=E2=80=A6)
+   * - ``nettle``
+     - 3.10.1
+     - 3.10.2
+   * - ``newlib``
+     - 4.4.0+git
+     - 4.5.0+git
+   * - ``nfs-utils``
+     - 2.8.2
+     - 2.8.4
+   * - ``nghttp2``
+     - 1.65.0
+     - 1.68.0
+   * - ``ninja``
+     - 1.12.1
+     - 1.13.1
+   * - ``ofono``
+     - 2.15
+     - 2.18
+   * - ``opensbi``
+     - 1.6
+     - 1.7
+   * - ``openssh``
+     - 9.9p2
+     - 10.2p1
+   * - ``openssl``
+     - 3.4.2
+     - 3.5.4
+   * - ``opkg``
+     - 0.7.0
+     - 0.9.0
+   * - ``ovmf``
+     - edk2-stable202411
+     - edk2-stable202508
+   * - ``pango``
+     - 1.56.2
+     - 1.57.0
+   * - ``patch``
+     - 2.7.6
+     - 2.8
+   * - ``patchelf``
+     - 0.18.0
+     - 0.18.0+git
+   * - ``pciutils``
+     - 3.13.0
+     - 3.14.0
+   * - ``piglit``
+     - 1.0+gitr (fc8179d31904=E2=80=A6)
+     - 1.0+gitr (a0a27e528f64=E2=80=A6)
+   * - ``pinentry``
+     - 1.3.1
+     - 1.3.2
+   * - ``pixman``
+     - 0.44.2
+     - 0.46.4
+   * - ``pkgconf``
+     - 2.4.3
+     - 2.5.1
+   * - ``pseudo``
+     - 1.9.0+git
+     - 1.9.2+git
+   * - ``psplash``
+     - 0.1+git (1f64c654129f=E2=80=A6)
+     - 0.1+git (53ae74a36bf1=E2=80=A6)
+   * - ``puzzles``
+     - 0.0+git (7da464122232=E2=80=A6)
+     - 0.0+git (a7c7826bce5c=E2=80=A6)
+   * - ``python3``
+     - 3.13.4
+     - 3.13.9
+   * - ``python3-beartype``
+     - 0.20.0
+     - 0.21.0
+   * - ``python3-booleanpy``
+     - 4.0
+     - 5.0
+   * - ``python3-build``
+     - 1.2.2
+     - 1.3.0
+   * - ``python3-calver``
+     - 2022.6.26
+     - 2025.04.17
+   * - ``python3-certifi``
+     - 2025.1.31
+     - 2025.8.3
+   * - ``python3-click``
+     - 8.1.8
+     - 8.2.2
+   * - ``python3-cryptography``
+     - 44.0.2
+     - 45.0.7
+   * - ``python3-cryptography-vectors``
+     - 44.0.2
+     - 45.0.7
+   * - ``python3-cython``
+     - 3.0.12
+     - 3.1.3
+   * - ``python3-dbusmock``
+     - 0.33.0
+     - 0.37.0
+   * - ``python3-docutils``
+     - 0.21.2
+     - 0.22
+   * - ``python3-dtschema``
+     - 2025.2
+     - 2025.8
+   * - ``python3-flit-core``
+     - 3.11.0
+     - 3.12.0
+   * - ``python3-hatch-fancy-pypi-readme``
+     - 24.1.0
+     - 25.1.0
+   * - ``python3-hatch-vcs``
+     - 0.4.0
+     - 0.5.0
+   * - ``python3-hypothesis``
+     - 6.129.2
+     - 6.142.2
+   * - ``python3-idna``
+     - 3.10
+     - 3.11
+   * - ``python3-iniconfig``
+     - 2.0.0
+     - 2.1.0
+   * - ``python3-jsonschema``
+     - 4.23.0
+     - 4.25.1
+   * - ``python3-jsonschema-specifications``
+     - 2024.10.1
+     - 2025.9.1
+   * - ``python3-license-expression``
+     - 30.4.1
+     - 30.4.4
+   * - ``python3-lxml``
+     - 5.3.1
+     - 6.0.2
+   * - ``python3-mako``
+     - 1.3.9
+     - 1.3.10
+   * - ``python3-markdown``
+     - 3.7
+     - 3.9
+   * - ``python3-maturin``
+     - 1.8.3
+     - 1.9.4
+   * - ``python3-meson-python``
+     - 0.17.1
+     - 0.18.0
+   * - ``python3-numpy``
+     - 2.2.3
+     - 2.3.4
+   * - ``python3-packaging``
+     - 24.2
+     - 25.0
+   * - ``python3-pbr``
+     - 6.1.0
+     - 7.0.1
+   * - ``python3-pip``
+     - 25.0.1
+     - 25.2
+   * - ``python3-pluggy``
+     - 1.5.0
+     - 1.6.0
+   * - ``python3-poetry-core``
+     - 2.1.1
+     - 2.1.3
+   * - ``python3-pycairo``
+     - 1.27.0
+     - 1.28.0
+   * - ``python3-pycryptodome``
+     - 3.22.0
+     - 3.23.0
+   * - ``python3-pycryptodomex``
+     - 3.22.0
+     - 3.23.0
+   * - ``python3-pygments``
+     - 2.19.1
+     - 2.19.2
+   * - ``python3-pygobject``
+     - 3.52.2
+     - 3.54.5
+   * - ``python3-pyopenssl``
+     - 25.0.0
+     - 25.1.0
+   * - ``python3-pyparsing``
+     - 3.2.1
+     - 3.2.4
+   * - ``python3-pytest``
+     - 8.3.5
+     - 8.4.2
+   * - ``python3-pytest-subtests``
+     - 0.14.1
+     - 0.14.2
+   * - ``python3-pytz``
+     - 2025.1
+     - 2025.2
+   * - ``python3-rdflib``
+     - 7.1.3
+     - 7.1.4
+   * - ``python3-referencing``
+     - 0.36.2
+     - 0.37.0
+   * - ``python3-requests``
+     - 2.32.4
+     - 2.32.5
+   * - ``python3-rpds-py``
+     - 0.22.3
+     - 0.27.1
+   * - ``python3-ruamel-yaml``
+     - 0.18.10
+     - 0.18.15
+   * - ``python3-scons``
+     - 4.9.0
+     - 4.9.1
+   * - ``python3-setuptools``
+     - 76.0.0
+     - 80.9.0
+   * - ``python3-setuptools-rust``
+     - 1.11.0
+     - 1.12.0
+   * - ``python3-setuptools-scm``
+     - 8.2.0
+     - 8.3.1
+   * - ``python3-smartypants``
+     - 2.0.0
+     - 2.0.2
+   * - ``python3-snowballstemmer``
+     - 2.2.0
+     - 3.0.1
+   * - ``python3-trove-classifiers``
+     - 2025.3.13.13
+     - 2025.9.11.17
+   * - ``python3-typing-extensions``
+     - 4.12.2
+     - 4.15.0
+   * - ``python3-unittest-automake-output``
+     - 0.2
+     - 0.3
+   * - ``python3-uritools``
+     - 4.0.3
+     - 5.0.0
+   * - ``python3-urllib3``
+     - 2.3.0
+     - 2.5.0
+   * - ``python3-webcolors``
+     - 24.8.0
+     - 24.11.1
+   * - ``python3-wheel``
+     - 0.45.1
+     - 0.46.1
+   * - ``python3-xmltodict``
+     - 0.14.2
+     - 0.15.1
+   * - ``python3-yamllint``
+     - 1.36.0
+     - 1.37.1
+   * - ``python3-zipp``
+     - 3.21.0
+     - 3.23.0
+   * - ``qemu``
+     - 9.2.0
+     - 10.0.6
+   * - ``qemu-native``
+     - 9.2.0
+     - 10.0.6
+   * - ``qemu-system-native``
+     - 9.2.0
+     - 10.0.6
+   * - ``quilt``
+     - 0.68
+     - 0.69
+   * - ``quilt-native``
+     - 0.68
+     - 0.69
+   * - ``quota``
+     - 4.09
+     - 4.10
+   * - ``re2c``
+     - 4.1
+     - 4.3
+   * - ``readline``
+     - 8.2.13
+     - 8.3
+   * - ``repo``
+     - 2.52
+     - 2.58
+   * - ``resolvconf``
+     - 1.92
+     - 1.94
+   * - ``rpcbind``
+     - 1.2.7
+     - 1.2.8
+   * - ``rpm``
+     - 4.20.0
+     - 4.20.1
+   * - ``rpm-sequoia``
+     - 1.7.0
+     - 1.9.0
+   * - ``rpm-sequoia-crypto-policy``
+     - git (032b418a6db8=E2=80=A6)
+     - git (ae1df75b1155=E2=80=A6)
+   * - ``rt-tests``
+     - 2.8
+     - 2.9
+   * - ``ruby``
+     - 3.4.4
+     - 3.4.5
+   * - ``rust``
+     - 1.84.1
+     - 1.90.0
+   * - ``rust-cross-canadian``
+     - 1.84.1
+     - 1.90.0
+   * - ``sbc``
+     - 2.0
+     - 2.1
+   * - ``scdoc``
+     - 1.11.3
+     - 1.11.4
+   * - ``screen``
+     - 5.0.0
+     - 5.0.1
+   * - ``shaderc``
+     - 2024.3
+     - 2025.3
+   * - ``shadow``
+     - 4.17.3
+     - 4.18.0
+   * - ``spirv-headers``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``spirv-tools``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``squashfs-tools``
+     - 4.6.1
+     - 4.7.4
+   * - ``strace``
+     - 6.12
+     - 6.17
+   * - ``stress-ng``
+     - 0.18.11
+     - 0.19.04
+   * - ``sudo``
+     - 1.9.17p1
+     - 1.9.17p2
+   * - ``swig``
+     - 4.3.0
+     - 4.3.1
+   * - ``sysklogd``
+     - 2.7.1
+     - 2.7.2
+   * - ``sysstat``
+     - 12.7.7
+     - 12.7.8
+   * - ``systemd``
+     - 257.6
+     - 257.8
+   * - ``systemd-boot``
+     - 257.6
+     - 257.8
+   * - ``systemd-boot-native``
+     - 257.6
+     - 257.8
+   * - ``systemd-systemctl-native``
+     - 257.6
+     - 257.8
+   * - ``systemtap``
+     - 5.2
+     - 5.3
+   * - ``systemtap-native``
+     - 5.2
+     - 5.3
+   * - ``taglib``
+     - 2.0.2
+     - 2.1.1
+   * - ``tcf-agent``
+     - 1.8.0+git
+     - 1.9.0
+   * - ``tcl``
+     - 9.0.1
+     - 9.0.2
+   * - ``tcl8``
+     - 8.6.16
+     - 8.6.17
+   * - ``tiff``
+     - 4.7.0
+     - 4.7.1
+   * - ``ttyrun``
+     - 2.37.0
+     - 2.38.0
+   * - ``u-boot``
+     - 2025.01
+     - 2025.10
+   * - ``u-boot-tools``
+     - 2025.01
+     - 2025.10
+   * - ``unfs3``
+     - 0.10.0
+     - 0.11.0
+   * - ``usbutils``
+     - 018
+     - 019
+   * - ``util-linux``
+     - 2.40.4
+     - 2.41.1
+   * - ``util-linux-libuuid``
+     - 2.40.4
+     - 2.41.1
+   * - ``valgrind``
+     - 3.24.0
+     - 3.25.1
+   * - ``vim``
+     - 9.1.1652
+     - 9.1.1683
+   * - ``vim-tiny``
+     - 9.1.1652
+     - 9.1.1683
+   * - ``virglrenderer``
+     - 1.1.0
+     - 1.1.1
+   * - ``vte``
+     - 0.78.2
+     - 0.82.1
+   * - ``vulkan-headers``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``vulkan-loader``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``vulkan-samples``
+     - git (8547ce1022a1=E2=80=A6)
+     - git (d27205d14d01=E2=80=A6)
+   * - ``vulkan-tools``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``vulkan-utility-libraries``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``vulkan-validation-layers``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``vulkan-volk``
+     - 1.4.309.0
+     - 1.4.328.1
+   * - ``wayland``
+     - 1.23.1
+     - 1.24.0
+   * - ``wayland-protocols``
+     - 1.41
+     - 1.45
+   * - ``webkitgtk``
+     - 2.48.2
+     - 2.50.0
+   * - ``weston``
+     - 14.0.1
+     - 14.0.2
+   * - ``which``
+     - 2.21
+     - 2.23
+   * - ``wireless-regdb``
+     - 2025.02.20
+     - 2025.10.07
+   * - ``xdpyinfo``
+     - 1.3.4
+     - 1.4.0
+   * - ``xinput-calibrator``
+     - 0.7.5+git
+     - 0.8.0
+   * - ``xkeyboard-config``
+     - 2.44
+     - 2.45
+   * - ``xwayland``
+     - 24.1.6
+     - 24.1.8
+   * - ``xz``
+     - 5.6.4
+     - 5.8.1
=20
 Contributors to |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~

--=20
2.51.0


