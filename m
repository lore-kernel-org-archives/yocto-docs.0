Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F7DF9EDED
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 14:23:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83719.1776867785755530805
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 07:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MzV7qRm+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A26B8C5C3C8
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEB7F5FA8F
	for <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B51E410460BE4;
	Wed, 22 Apr 2026 16:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776867782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I4DZBD8hE/g5bpX6yScIHZCyH6DlG7pbNM9+0Dqiiu8=;
	b=MzV7qRm+dP3VsZ8dq4ZZx65BpNtIkyWZAjGZO3Rmu/Dyc6Evky8VzqyBoXfvTUah2nL+u4
	cPGXRhdar1wyq4+MFBT4BT/ljikA2d6o7TVxMmmlSWqYeSp2kIwTSZujUgik420UaGblyk
	umoNkvdfFXXaLqQ71HssuxAqHrEw6L3YZgbWzFk1oyMrstSpUoI0fMqb7krqQHt/zuxDHM
	yZ+6U74aNyRZjJvX/GTw5OkQ6v7M1iDSfSBYGAGxx6swFU8za3O3Q7JGARD8SzaL/or73B
	uv7P6gM3GBXr77SGbIE85YQ/FSeqVtoLOJdZDDEztdW39BJyKDvr7Kj2CWFU1A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Apr 2026 16:22:47 +0200
Subject: [PATCH 14/16] migration-guides/release-notes-6.0.rst: add recipe
 version changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260422-third-release-notes-6-0-v1-14-06635e8648d1@bootlin.com>
References: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
In-Reply-To: <20260422-third-release-notes-6-0-v1-0-06635e8648d1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22602;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QNx+pVva8hUwLEI0BSLVYnnQ9rBXKnv2GwANeHVjBgY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBp6Nm6QFm7ouYuqPq4o2mdDHXLDuGRYMzZpwaI/
 448q7DtQ9eJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaejZugAKCRDRgEFAKaOo
 NmVOEACzoo/LZYSxxxgr76JgZwrUjZAbtJIoUBWF8GlFlt2HDI8TEIgerHqWQkwMxqtOeRJ+pLf
 lGH6tUofmq1y0EI49V8+4WEAiLIiBVEE5m2njUMIt2wgSp4p34HUaCFElw1ZHxrn2F8mHf8z3TY
 P8dn5R1/xUG35DEGT3mKK8WnWXRqa6AzwzZlf9YXmvBrGJ8Jh5sIv52BFfyDj702nThVEYoNBAI
 3NQdtUgCFk2q3bTGDbw46Yp+1Yi8JwP6qutn+C8GxoQ7zhMB9Zt5lUHdkM9sqi6MRsAw9drJpbj
 GnArKVp1H/cfy/gt9bFCqEF+FLQv4HHWS+jSvc7pciI++E+9WJ1AcvszrdLl6B95jCW8/eDQGSY
 usvxGBp1QjNU4GS0KAL7Dl46cCwyUHZ35TYrITpT2LVf7mMLJ/k4v5E5/o4F0z+RL4Q9C7CyHK1
 d9dJyvwUaywUHeVy5/KTPedfft7TiNuUoex0MT0DHkGCAROfwlCQz4mqNjMlDnPuHw+GrstgN5D
 WCI8eFI6pMTnz7kDhjYTwFy0XM1Dls7xwvZ9XH7oDEBHVHOgBAGeRJTOPwHNwouNc6U+gT/5Ne1
 mDp7pKt/dz/E15j4HlPE5Kl9/KnWGVCfKa4IIuxWVsZWkR7UeOYGFZ3drYB5Z+WR/LpNKC5/MRJ
 jqYREdUGoYVIVvw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Apr 2026 14:23:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9323

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.0.rst         | 1130 ++++++++++++++=
+++++-
 1 file changed, 1125 insertions(+), 5 deletions(-)

diff --git a/documentation/migration-guides/release-notes-6.0.rst b/docum=
entation/migration-guides/release-notes-6.0.rst
index a37beb30b..395694583 100644
--- a/documentation/migration-guides/release-notes-6.0.rst
+++ b/documentation/migration-guides/release-notes-6.0.rst
@@ -865,6 +865,10 @@ The following CVEs have been fixed:
 Recipe Upgrades in |yocto-ver|
 ------------------------------
=20
+..
+   Generated with https://layers.openembedded.org/layerindex/branch_comp=
arison
+   With "rST" output selected
+
 The following recipes have been upgraded:
=20
 .. list-table::
@@ -872,11 +876,1127 @@ The following recipes have been upgraded:
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
+     - 20250807
+     - 20251212
+   * - ``adwaita-icon-theme``
+     - 48.0
+     - 49.0
+   * - ``alsa-lib``
+     - 1.2.14
+     - 1.2.15.3
+   * - ``alsa-tools``
+     - 1.2.14
+     - 1.2.15
+   * - ``alsa-ucm-conf``
+     - 1.2.14
+     - 1.2.15.3
+   * - ``alsa-utils``
+     - 1.2.14
+     - 1.2.15.2
+   * - ``appstream``
+     - 1.0.6
+     - 1.1.2
+   * - ``aspell``
+     - 0.60.8.1
+     - 0.60.8.2
+   * - ``at-spi2-core``
+     - 2.56.4
+     - 2.60.0
+   * - ``autoconf``
+     - 2.72
+     - 2.73
+   * - ``barebox``
+     - 2025.09.3
+     - 2026.03.1
+   * - ``barebox-tools``
+     - 2025.09.3
+     - 2026.03.1
+   * - ``base-passwd``
+     - 3.6.7
+     - 3.6.8
+   * - ``bash-completion``
+     - 2.16.0
+     - 2.17.0
+   * - ``bind``
+     - 9.20.15
+     - 9.20.22
+   * - ``binutils``
+     - 2.45.1+git
+     - 2.46
+   * - ``binutils-cross``
+     - 2.45.1+git
+     - 2.46
+   * - ``binutils-cross-canadian``
+     - 2.45.1+git
+     - 2.46
+   * - ``binutils-crosssdk``
+     - 2.45.1+git
+     - 2.46
+   * - ``binutils-testsuite``
+     - 2.45.1+git
+     - 2.46
+   * - ``bluez5``
+     - 5.84
+     - 5.86
+   * - ``boost``
+     - 1.89.0
+     - 1.90.0
+   * - ``boost-build-native``
+     - 1.89.0
+     - 1.90.0
+   * - ``btrfs-tools``
+     - 6.16
+     - 6.19.1
+   * - ``cargo``
+     - 1.90.0
+     - 1.94.1
+   * - ``cargo-c``
+     - 0.10.16+cargo-0.91.0
+     - 0.10.21+cargo-0.95.0
+   * - ``ccache``
+     - 4.12.3
+     - 4.13.2
+   * - ``clang``
+     - 21.1.7
+     - 22.1.3
+   * - ``cmake``
+     - 4.1.2
+     - 4.3.1
+   * - ``cmake-native``
+     - 4.1.2
+     - 4.3.1
+   * - ``compiler-rt``
+     - 21.1.7
+     - 22.1.3
+   * - ``compiler-rt-sanitizers``
+     - 21.1.7
+     - 22.1.3
+   * - ``connman``
+     - 1.45
+     - 2.0
+   * - ``coreutils``
+     - 9.7
+     - 9.10
+   * - ``createrepo-c``
+     - 1.2.1
+     - 1.2.3
+   * - ``cross-localedef-native``
+     - 2.42+git
+     - 2.43+git
+   * - ``cryptodev-linux``
+     - 1.14 (135cbff90af2=E2=80=A6)
+     - 1.14 (08644db02d43=E2=80=A6)
+   * - ``cryptodev-module``
+     - 1.14 (135cbff90af2=E2=80=A6)
+     - 1.14 (08644db02d43=E2=80=A6)
+   * - ``cryptodev-tests``
+     - 1.14 (135cbff90af2=E2=80=A6)
+     - 1.14 (08644db02d43=E2=80=A6)
+   * - ``cups``
+     - 2.4.15
+     - 2.4.16
+   * - ``curl``
+     - 8.17.0
+     - 8.19.0
+   * - ``dhcpcd``
+     - 10.2.4
+     - 10.3.0
+   * - ``diffoscope``
+     - 306
+     - 314
+   * - ``dmidecode``
+     - 3.6
+     - 3.7
+   * - ``dnf``
+     - 4.23.0
+     - 4.24.0
+   * - ``dos2unix``
+     - 7.5.2
+     - 7.5.4
+   * - ``dpkg``
+     - 1.22.21
+     - 1.23.7
+   * - ``dropbear``
+     - 2025.88
+     - 2025.89
+   * - ``e2fsprogs``
+     - 1.47.3
+     - 1.47.4
+   * - ``ed``
+     - 1.22.2
+     - 1.22.5
+   * - ``elfutils``
+     - 0.193
+     - 0.194
+   * - ``ell``
+     - 0.80
+     - 0.83
+   * - ``enchant2``
+     - 2.8.14
+     - 2.8.15
+   * - ``epiphany``
+     - 48.5
+     - 49.7
+   * - ``erofs-utils``
+     - 1.8.10
+     - 1.9.1
+   * - ``ethtool``
+     - 6.15
+     - 6.19
+   * - ``expat``
+     - 2.7.4
+     - 2.7.5
+   * - ``fastfloat``
+     - 8.0.2
+     - 8.2.4
+   * - ``ffmpeg``
+     - 8.0
+     - 8.0.1
+   * - ``file``
+     - 5.46
+     - 5.47
+   * - ``fmt``
+     - 11.2.0
+     - 12.1.0
+   * - ``font-alias``
+     - 1.0.5
+     - 1.0.6
+   * - ``freetype``
+     - 2.13.3
+     - 2.14.3
+   * - ``gawk``
+     - 5.3.2
+     - 5.4.0
+   * - ``gdb``
+     - 16.3
+     - 17.1
+   * - ``gdb-cross``
+     - 16.3
+     - 17.1
+   * - ``gdb-cross-canadian``
+     - 16.3
+     - 17.1
+   * - ``gdk-pixbuf``
+     - 2.42.12
+     - 2.44.5
+   * - ``gettext``
+     - 0.26
+     - 1.0
+   * - ``gettext-minimal-native``
+     - 0.26
+     - 1.0
+   * - ``gi-docgen``
+     - 2025.4
+     - 2026.1
+   * - ``git``
+     - 2.51.0
+     - 2.53.0
+   * - ``glew``
+     - 2.2.0
+     - 2.3.1
+   * - ``glib-2.0``
+     - 2.86.4
+     - 2.88.0
+   * - ``glib-2.0-initial``
+     - 2.86.4
+     - 2.88.0
+   * - ``glibc``
+     - 2.42+git
+     - 2.43+git
+   * - ``glibc-locale``
+     - 2.42+git
+     - 2.43+git
+   * - ``glibc-mtrace``
+     - 2.42+git
+     - 2.43+git
+   * - ``glibc-scripts``
+     - 2.42+git
+     - 2.43+git
+   * - ``glibc-testsuite``
+     - 2.42+git
+     - 2.43+git
+   * - ``glslang``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``gn``
+     - 0+git (81b24e01531e=E2=80=A6)
+     - 0+git (9d19a7870add=E2=80=A6)
+   * - ``gnu-efi``
+     - 4.0.2
+     - 4.0.4
+   * - ``gnupg``
+     - 2.5.11
+     - 2.5.17
+   * - ``gnutls``
+     - 3.8.10
+     - 3.8.12
+   * - ``go``
+     - 1.25.9
+     - 1.26.2
+   * - ``go-binary-native``
+     - 1.25.9
+     - 1.26.2
+   * - ``go-cross-canadian``
+     - 1.25.9
+     - 1.26.2
+   * - ``go-cross-core2-32``
+     - 1.25.9
+     - 1.26.2
+   * - ``go-crosssdk``
+     - 1.25.9
+     - 1.26.2
+   * - ``go-helloworld``
+     - 0.1 (8b405629c4a5=E2=80=A6)
+     - 0.1 (7f05d217867b=E2=80=A6)
+   * - ``go-runtime``
+     - 1.25.9
+     - 1.26.2
+   * - ``gobject-introspection``
+     - 1.84.0
+     - 1.86.0
+   * - ``groff``
+     - 1.23.0
+     - 1.24.0
+   * - ``grub``
+     - 2.12
+     - 2.14
+   * - ``grub-efi``
+     - 2.12
+     - 2.14
+   * - ``gsettings-desktop-schemas``
+     - 48.0
+     - 50.0
+   * - ``gst-devtools``
+     - 1.26.7
+     - 1.28.2
+   * - ``gst-examples``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-libav``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-plugins-bad``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-plugins-base``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-plugins-good``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-plugins-ugly``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-python``
+     - 1.26.7
+     - 1.28.2
+   * - ``gstreamer1.0-rtsp-server``
+     - 1.26.7
+     - 1.28.2
+   * - ``gtk-doc``
+     - 1.34.0
+     - 1.35.1
+   * - ``gtk4``
+     - 4.18.6
+     - 4.22.1
+   * - ``harfbuzz``
+     - 11.4.5
+     - 12.3.2
+   * - ``hwdata``
+     - 0.399
+     - 0.405
+   * - ``hwlatdetect``
+     - 2.9
+     - 2.10
+   * - ``icu``
+     - 77-1
+     - 78.3
+   * - ``ifupdown``
+     - 0.8.44
+     - 0.8.45
+   * - ``igt-gpu-tools``
+     - 2.1
+     - 2.3
+   * - ``inetutils``
+     - 2.6
+     - 2.7
+   * - ``iproute2``
+     - 6.16.0
+     - 6.19.0
+   * - ``iptables``
+     - 1.8.11
+     - 1.8.13
+   * - ``iso-codes``
+     - 4.18.0
+     - 4.20.1
+   * - ``kbd``
+     - 2.8.0
+     - 2.9.0
+   * - ``kea``
+     - 3.0.1
+     - 3.0.3
+   * - ``kern-tools-native``
+     - 0.3+git (f589e1df2325=E2=80=A6)
+     - 0.3+git (a4a362d9f4f0=E2=80=A6)
+   * - ``kexec-tools``
+     - 2.0.31
+     - 2.0.32
+   * - ``kmscube``
+     - 0.0.1+git (2c1f2646c5e5=E2=80=A6)
+     - 0.0.1+git (f60e50e887d3=E2=80=A6)
+   * - ``less``
+     - 679
+     - 692
+   * - ``libadwaita``
+     - 1.7.6
+     - 1.8.4
+   * - ``libarchive``
+     - 3.8.6
+     - 3.8.7
+   * - ``libatomic-ops``
+     - 7.8.4
+     - 7.10.0
+   * - ``libcap``
+     - 2.76
+     - 2.77
+   * - ``libcap-ng``
+     - 0.8.5
+     - 0.9.1
+   * - ``libcap-ng-python``
+     - 0.8.5
+     - 0.9.1
+   * - ``libclc``
+     - 21.1.7
+     - 22.1.3
+   * - ``libcomps``
+     - 0.1.22
+     - 0.1.24
+   * - ``libcxx``
+     - 21.1.7
+     - 22.1.3
+   * - ``libdisplay-info``
+     - 0.2.0
+     - 0.3.0
+   * - ``libdnf``
+     - 0.74.0
+     - 0.75.0
+   * - ``libdrm``
+     - 2.4.125
+     - 2.4.131
+   * - ``libedit``
+     - 20250104-3.1
+     - 20251016-3.1
+   * - ``libevdev``
+     - 1.13.5
+     - 1.13.6
+   * - ``libexif``
+     - 0.6.25
+     - 0.6.26
+   * - ``libfontenc``
+     - 1.1.8
+     - 1.1.9
+   * - ``libgcrypt``
+     - 1.11.2
+     - 1.12.1
+   * - ``libgit2``
+     - 1.9.1
+     - 1.9.2
+   * - ``libgloss``
+     - 4.5.0+git
+     - 4.6.0+git
+   * - ``libgpg-error``
+     - 1.56
+     - 1.59
+   * - ``libinput``
+     - 1.29.1
+     - 1.30.2
+   * - ``libjpeg-turbo``
+     - 3.1.2
+     - 3.1.3
+   * - ``libksba``
+     - 1.6.7
+     - 1.6.8
+   * - ``libnl``
+     - 3.11.0
+     - 3.12.0
+   * - ``libnotify``
+     - 0.8.6
+     - 0.8.8
+   * - ``libpam``
+     - 1.7.1
+     - 1.7.2
+   * - ``libpciaccess``
+     - 0.18.1
+     - 0.19
+   * - ``libpcre2``
+     - 10.46
+     - 10.47
+   * - ``libproxy``
+     - 0.5.10
+     - 0.5.12
+   * - ``librsvg``
+     - 2.61.0
+     - 2.61.3
+   * - ``libsolv``
+     - 0.7.35
+     - 0.7.36
+   * - ``libstd-rs``
+     - 1.90.0
+     - 1.94.1
+   * - ``libtasn1``
+     - 4.20.0
+     - 4.21.0
+   * - ``libtest-fatal-perl``
+     - 0.017
+     - 0.018
+   * - ``libtirpc``
+     - 1.3.6
+     - 1.3.7
+   * - ``libtraceevent``
+     - 1.8.4
+     - 1.9.0
+   * - ``libubootenv``
+     - 0.3.6
+     - 0.3.7
+   * - ``libunistring``
+     - 1.3
+     - 1.4.2
+   * - ``liburcu``
+     - 0.15.3
+     - 0.15.6
+   * - ``libuv``
+     - 1.51.0
+     - 1.52.1
+   * - ``libva``
+     - 2.22.0
+     - 2.23.0
+   * - ``libva-initial``
+     - 2.22.0
+     - 2.23.0
+   * - ``libva-utils``
+     - 2.22.0
+     - 2.23.0
+   * - ``libx11``
+     - 1.8.12
+     - 1.8.13
+   * - ``libx11-compose-data``
+     - 1.8.4
+     - 1.8.12
+   * - ``libxcomposite``
+     - 0.4.6
+     - 0.4.7
+   * - ``libxcrypt``
+     - 4.4.38
+     - 4.5.2
+   * - ``libxcrypt-compat``
+     - 4.4.38
+     - 4.5.2
+   * - ``libxdamage``
+     - 1.1.6
+     - 1.1.7
+   * - ``libxext``
+     - 1.3.6
+     - 1.3.7
+   * - ``libxinerama``
+     - 1.1.5
+     - 1.1.6
+   * - ``libxkbcommon``
+     - 1.11.0
+     - 1.13.1
+   * - ``libxkbfile``
+     - 1.1.3
+     - 1.2.0
+   * - ``libxml2``
+     - 2.14.6
+     - 2.15.2
+   * - ``libxmu``
+     - 1.2.1
+     - 1.3.1
+   * - ``libxpm``
+     - 3.5.17
+     - 3.5.18
+   * - ``libxrandr``
+     - 1.5.4
+     - 1.5.5
+   * - ``libxslt``
+     - 1.1.43
+     - 1.1.45
+   * - ``libxvmc``
+     - 1.0.14
+     - 1.0.15
+   * - ``libxxf86vm``
+     - 1.1.6
+     - 1.1.7
+   * - ``lighttpd``
+     - 1.4.81
+     - 1.4.82
+   * - ``linux-firmware``
+     - 20251111
+     - 20260410
+   * - ``linux-libc-headers``
+     - 6.17
+     - 6.18
+   * - ``linux-yocto``
+     - 6.12.69+git, 6.16.11+git
+     - 6.18.19+git
+   * - ``linux-yocto-dev``
+     - 6.18+git
+     - 7.0+git
+   * - ``linux-yocto-rt``
+     - 6.12.69+git, 6.16.11+git
+     - 6.18.19+git
+   * - ``linux-yocto-tiny``
+     - 6.12.69+git, 6.16.11+git
+     - 6.18.19+git
+   * - ``lld``
+     - 21.1.7
+     - 22.1.3
+   * - ``lldb``
+     - 21.1.7
+     - 22.1.3
+   * - ``llvm``
+     - 21.1.7
+     - 22.1.3
+   * - ``llvm-tblgen-native``
+     - 21.1.7
+     - 22.1.3
+   * - ``lsof``
+     - 4.99.5
+     - 4.99.6
+   * - ``ltp``
+     - 20250930
+     - 20260130
+   * - ``lttng-modules``
+     - 2.14.3
+     - 2.14.4
+   * - ``lttng-tools``
+     - 2.14.0
+     - 2.14.1
+   * - ``lua``
+     - 5.4.8
+     - 5.5.0
+   * - ``lzlib``
+     - 1.15
+     - 1.16
+   * - ``m4``
+     - 1.4.20
+     - 1.4.21
+   * - ``m4-native``
+     - 1.4.20
+     - 1.4.21
+   * - ``makedumpfile``
+     - 1.7.7
+     - 1.7.8
+   * - ``man-pages``
+     - 6.15
+     - 6.17
+   * - ``mdadm``
+     - 4.4
+     - 4.6
+   * - ``mesa``
+     - 25.2.8
+     - 26.0.3
+   * - ``mesa-gl``
+     - 25.2.8
+     - 26.0.3
+   * - ``meson``
+     - 1.9.1
+     - 1.10.2
+   * - ``mpg123``
+     - 1.33.2
+     - 1.33.4
+   * - ``msmtp``
+     - 1.8.31
+     - 1.8.32
+   * - ``mtd-utils``
+     - 2.3.0
+     - 2.3.1
+   * - ``musl``
+     - 1.2.5+git
+     - 1.2.6+git
+   * - ``nasm``
+     - 2.16.03
+     - 3.01
+   * - ``ncurses``
+     - 6.5
+     - 6.6
+   * - ``newlib``
+     - 4.5.0+git
+     - 4.6.0+git
+   * - ``nfs-utils``
+     - 2.8.4
+     - 2.8.7
+   * - ``nghttp2``
+     - 1.66.0
+     - 1.68.1
+   * - ``ninja``
+     - 1.13.1
+     - 1.13.2
+   * - ``ofono``
+     - 2.18
+     - 2.19
+   * - ``openmp``
+     - 21.1.7
+     - 22.1.3
+   * - ``opensbi``
+     - 1.7
+     - 1.8.1
+   * - ``openssh``
+     - 10.2p1
+     - 10.3p1
+   * - ``opkg``
+     - 0.8.0
+     - 0.9.0
+   * - ``orc``
+     - 0.4.41
+     - 0.4.42
+   * - ``ovmf``
+     - edk2-stable202508
+     - edk2-stable202511
+   * - ``p11-kit``
+     - 0.25.5
+     - 0.26.2
+   * - ``perl``
+     - 5.40.2
+     - 5.42.0
+   * - ``perlcross``
+     - 1.6.2
+     - 1.6.4
+   * - ``picolibc``
+     - 1.8.6+git
+     - 1.8.11+git
+   * - ``picolibc-helloworld``
+     - 1.8.6+git
+     - 1.8.11+git
+   * - ``procps``
+     - 4.0.5
+     - 4.0.6
+   * - ``puzzles``
+     - 0.0+git (a7c7826bce5c=E2=80=A6)
+     - 0.0+git (ecb576fb2a0a=E2=80=A6)
+   * - ``python3``
+     - 3.13.12
+     - 3.14.4
+   * - ``python3-attrs``
+     - 25.3.0
+     - 25.4.0
+   * - ``python3-babel``
+     - 2.17.0
+     - 2.18.0
+   * - ``python3-bcrypt``
+     - 4.3.0
+     - 5.0.0
+   * - ``python3-beartype``
+     - 0.21.0
+     - 0.22.9
+   * - ``python3-build``
+     - 1.3.0
+     - 1.4.0
+   * - ``python3-calver``
+     - 2025.04.17
+     - 2025.10.20
+   * - ``python3-certifi``
+     - 2025.8.3
+     - 2026.2.25
+   * - ``python3-cffi``
+     - 1.17.1
+     - 2.0.0
+   * - ``python3-chardet``
+     - 5.2.0
+     - 6.0.0.post1
+   * - ``python3-click``
+     - 8.2.2
+     - 8.3.1
+   * - ``python3-cryptography``
+     - 45.0.7
+     - 46.0.5
+   * - ``python3-cryptography-vectors``
+     - 45.0.7
+     - 46.0.5
+   * - ``python3-cython``
+     - 3.1.3
+     - 3.2.4
+   * - ``python3-dbusmock``
+     - 0.37.0
+     - 0.38.1
+   * - ``python3-docutils``
+     - 0.22
+     - 0.22.4
+   * - ``python3-dtschema``
+     - 2025.8
+     - 2025.12
+   * - ``python3-hatchling``
+     - 1.27.0
+     - 1.29.0
+   * - ``python3-hypothesis``
+     - 6.142.2
+     - 6.151.9
+   * - ``python3-imagesize``
+     - 1.4.1
+     - 2.0.0
+   * - ``python3-iniconfig``
+     - 2.1.0
+     - 2.3.0
+   * - ``python3-jsonschema``
+     - 4.25.1
+     - 4.26.0
+   * - ``python3-markdown``
+     - 3.9
+     - 3.10.2
+   * - ``python3-markupsafe``
+     - 3.0.2
+     - 3.0.3
+   * - ``python3-maturin``
+     - 1.9.4
+     - 1.12.4
+   * - ``python3-meson-python``
+     - 0.18.0
+     - 0.19.0
+   * - ``python3-numpy``
+     - 2.3.4
+     - 2.4.3
+   * - ``python3-packaging``
+     - 25.0
+     - 26.0
+   * - ``python3-pathspec``
+     - 0.12.1
+     - 1.0.4
+   * - ``python3-pbr``
+     - 7.0.1
+     - 7.0.3
+   * - ``python3-pdm``
+     - 2.25.9
+     - 2.26.6
+   * - ``python3-pdm-backend``
+     - 2.4.5
+     - 2.4.7
+   * - ``python3-pdm-build-locked``
+     - 0.3.5
+     - 0.3.7
+   * - ``python3-pip``
+     - 25.2
+     - 26.0.1
+   * - ``python3-poetry-core``
+     - 2.1.3
+     - 2.3.1
+   * - ``python3-psutil``
+     - 7.0.0
+     - 7.2.2
+   * - ``python3-pyasn1``
+     - 0.6.1
+     - 0.6.2
+   * - ``python3-pycairo``
+     - 1.28.0
+     - 1.29.0
+   * - ``python3-pycparser``
+     - 2.22
+     - 3.0
+   * - ``python3-pygobject``
+     - 3.52.3
+     - 3.56.1
+   * - ``python3-pyopenssl``
+     - 25.1.0
+     - 26.0.0
+   * - ``python3-pyparsing``
+     - 3.2.4
+     - 3.3.2
+   * - ``python3-pyproject-metadata``
+     - 0.9.1
+     - 0.11.0
+   * - ``python3-pytest``
+     - 8.4.2
+     - 9.0.2
+   * - ``python3-pytest-subtests``
+     - 0.14.2
+     - 0.15.0
+   * - ``python3-pytz``
+     - 2025.2
+     - 2026.1
+   * - ``python3-pyyaml``
+     - 6.0.2
+     - 6.0.3
+   * - ``python3-rdflib``
+     - 7.1.4
+     - 7.6.0
+   * - ``python3-rpds-py``
+     - 0.27.1
+     - 0.30.0
+   * - ``python3-ruamel-yaml``
+     - 0.18.15
+     - 0.19.1
+   * - ``python3-scons``
+     - 4.9.1
+     - 4.10.1
+   * - ``python3-setuptools``
+     - 80.9.0
+     - 82.0.1
+   * - ``python3-setuptools-scm``
+     - 8.3.1
+     - 9.2.2
+   * - ``python3-sphinx``
+     - 8.2.1
+     - 9.1.0
+   * - ``python3-sphinx-rtd-theme``
+     - 3.0.2
+     - 3.1.0
+   * - ``python3-testtools``
+     - 2.7.2
+     - 2.8.7
+   * - ``python3-trove-classifiers``
+     - 2025.9.11.17
+     - 2026.1.14.14
+   * - ``python3-unittest-automake-output``
+     - 0.3
+     - 0.4
+   * - ``python3-uritools``
+     - 5.0.0
+     - 6.0.1
+   * - ``python3-urllib3``
+     - 2.5.0
+     - 2.6.3
+   * - ``python3-wcwidth``
+     - 0.2.13
+     - 0.6.0
+   * - ``python3-webcolors``
+     - 24.11.1
+     - 25.10.0
+   * - ``python3-websockets``
+     - 15.0.1
+     - 16.0
+   * - ``python3-wheel``
+     - 0.46.1
+     - 0.46.3
+   * - ``python3-xmltodict``
+     - 0.15.1
+     - 1.0.4
+   * - ``python3-yamllint``
+     - 1.37.1
+     - 1.38.0
+   * - ``qemu``
+     - 10.0.6
+     - 10.2.0
+   * - ``qemu-native``
+     - 10.0.6
+     - 10.2.0
+   * - ``qemu-system-native``
+     - 10.0.6
+     - 10.2.0
+   * - ``quota``
+     - 4.10
+     - 4.11
+   * - ``re2c``
+     - 4.3
+     - 4.4
+   * - ``repo``
+     - 2.58
+     - 2.61.1
+   * - ``resolvconf``
+     - 1.93
+     - 1.94
+   * - ``rgb``
+     - 1.1.0
+     - 1.1.1
+   * - ``rpm-sequoia``
+     - 1.9.0
+     - 1.10.1
+   * - ``rpm-sequoia-crypto-policy``
+     - git (ae1df75b1155=E2=80=A6)
+     - git (f3f5fa454345=E2=80=A6)
+   * - ``rt-tests``
+     - 2.9
+     - 2.10
+   * - ``ruby``
+     - 3.4.5
+     - 4.0.2
+   * - ``rust``
+     - 1.90.0
+     - 1.94.1
+   * - ``rust-cross-canadian``
+     - 1.90.0
+     - 1.94.1
+   * - ``sbc``
+     - 2.1
+     - 2.2
+   * - ``scdoc``
+     - 1.11.3
+     - 1.11.4
+   * - ``seatd``
+     - 0.9.1
+     - 0.9.3
+   * - ``shaderc``
+     - 2025.3
+     - 2026.1
+   * - ``shadow``
+     - 4.18.0
+     - 4.19.4
+   * - ``socat``
+     - 1.8.0.3
+     - 1.8.1.1
+   * - ``spirv-headers``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``spirv-llvm-translator``
+     - 21.1.1
+     - 22.1.1
+   * - ``spirv-tools``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``sqlite3``
+     - 3.48.0
+     - 3.51.3
+   * - ``squashfs-tools``
+     - 4.7.2
+     - 4.7.5
+   * - ``strace``
+     - 6.16
+     - 6.19
+   * - ``stress-ng``
+     - 0.19.04
+     - 0.20.01
+   * - ``swig``
+     - 4.3.1
+     - 4.4.1
+   * - ``sysstat``
+     - 12.7.8
+     - 12.7.9
+   * - ``systemd``
+     - 257.8
+     - 259.5
+   * - ``systemd-boot``
+     - 257.8
+     - 259.5
+   * - ``systemd-boot-native``
+     - 257.8
+     - 259.5
+   * - ``systemd-systemctl-native``
+     - 257.8
+     - 259.5
+   * - ``systemtap``
+     - 5.3
+     - 5.4
+   * - ``systemtap-native``
+     - 5.3
+     - 5.4
+   * - ``taglib``
+     - 2.1.1
+     - 2.2.1
+   * - ``tcl``
+     - 9.0.2
+     - 9.0.3
+   * - ``texinfo``
+     - 7.2
+     - 7.3
+   * - ``ttyrun``
+     - 2.38.0
+     - 2.41.0
+   * - ``u-boot``
+     - 2025.10
+     - 2026.01
+   * - ``u-boot-tools``
+     - 2025.10
+     - 2026.01
+   * - ``usbutils``
+     - 018
+     - 019
+   * - ``utfcpp``
+     - 4.0.6
+     - 4.0.9
+   * - ``util-linux``
+     - 2.41.1
+     - 2.41.3
+   * - ``util-linux-libuuid``
+     - 2.41.1
+     - 2.41.3
+   * - ``valgrind``
+     - 3.25.1
+     - 3.26.0
+   * - ``vim``
+     - 9.1.1683
+     - 9.2.0340
+   * - ``vim-tiny``
+     - 9.1.1683
+     - 9.2.0340
+   * - ``virglrenderer``
+     - 1.1.1
+     - 1.2.0
+   * - ``vte``
+     - 0.82.1
+     - 0.82.2
+   * - ``vulkan-headers``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``vulkan-loader``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``vulkan-samples``
+     - git (d27205d14d01=E2=80=A6)
+     - git (fa2cf45adde0=E2=80=A6)
+   * - ``vulkan-tools``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``vulkan-utility-libraries``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``vulkan-validation-layers``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``vulkan-volk``
+     - 1.4.328.1
+     - 1.4.341.0
+   * - ``wayland-protocols``
+     - 1.45
+     - 1.47
+   * - ``wayland-utils``
+     - 1.2.0
+     - 1.3.0
+   * - ``webkitgtk``
+     - 2.50.4
+     - 2.50.6
+   * - ``weston``
+     - 14.0.2
+     - 15.0.0
+   * - ``wpebackend-fdo``
+     - 1.16.0
+     - 1.16.1
+   * - ``x264``
+     - r3039+git (31e19f92f00c=E2=80=A6)
+     - r3039+git (0480cb05fa18=E2=80=A6)
+   * - ``xauth``
+     - 1.1.4
+     - 1.1.5
+   * - ``xcb-util-cursor``
+     - 0.1.5
+     - 0.1.6
+   * - ``xeyes``
+     - 1.3.0
+     - 1.3.1
+   * - ``xkbcomp``
+     - 1.4.7
+     - 1.5.0
+   * - ``xkeyboard-config``
+     - 2.45
+     - 2.47
+   * - ``xorgproto``
+     - 2024.1
+     - 2025.1
+   * - ``xserver-xorg``
+     - 21.1.18
+     - 21.1.21
+   * - ``xwayland``
+     - 24.1.8
+     - 24.1.9
+   * - ``xz``
+     - 5.8.1
+     - 5.8.2
+   * - ``zlib``
+     - 1.3.1
+     - 1.3.2
=20
 Contributors to |yocto-ver|
 ---------------------------

--=20
2.53.0


