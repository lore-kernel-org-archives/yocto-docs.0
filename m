Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186BFC982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 13:54:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11778.1789739663777069166
 for <docs@lists.yoctoproject.org>;
 Fri, 18 Sep 2026 06:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Bd60aU/1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 01B91C58477
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:55:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25A4B60649
	for <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2875410329019;
	Fri, 18 Sep 2026 15:54:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789739661; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0WQUFzRaF1qODTwZTB4gk4CuiJlNfbu36z9N4GK5jMo=;
	b=Bd60aU/1WsOCWhKo8vdUG65b2wWf2blOvIH01BpscHmWYLbC2DmbW940q6ftcnbpnJBlj+
	kHTwVMZipjcc6IdRwdDGTulMhPYI5VukQHKEls+r1igST8yj59Wf8BiyOlEJNjZI6h14WG
	hWiULyY6zTuRXJU7QgYhTVGLrVwyN44IA3xlXZE3P/8TJXKW6Y07SWOriwU42FPPkfjUKp
	kthejn+oMqXF9DPuRuNXnq4PXIGuGLqbF9LC1wllu2WFmVw66ISinrZmdtDxprQJY5RrK4
	3OyXYrfiGkMqUNDzRLTQVdUCCN1YQexquu69zAvJEggUWkj8hZc6lwvpQaFuYQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 18 Sep 2026 15:53:49 +0200
Subject: [PATCH 19/20] migration-guides/release-notes-6.1.rst: add recipe
 upgrades
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260918-releases-notes-6-1-v1-19-2d0fceffa242@bootlin.com>
References: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
In-Reply-To: <20260918-releases-notes-6-1-v1-0-2d0fceffa242@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21322;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=QB+KHke1h/i7fUwIPtLMOLUSeBBHL8zlbAdLNIwf0zE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqrUJmsiwWt4TBtJHXj5OowsZMnjjmISS5Evufv
 cXgbvDoCXWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaq1CZgAKCRDRgEFAKaOo
 Ni61D/40WMM3cED3dP2C2jWmPl94+cpZzmyrtpsbq1IaGD1QVE7Yfl8+XgXtjSq/7zOvfX6l1Os
 ULdIgLkHOVv+QQtATsGsrg3d6Ell8+HCwdGAlQ3M/ET0RXMjZ3fgs+lEKkWYnXwE09bVHtmrEuc
 hbfx5cetumK10s+fVUZZrMqT3ckU7+WSGL21al2YkEt5Oc0lV2PCZg5jKofPDl+gQ9N2JjQo7n4
 y9EzdWRmdgGJOwuRsFyjDhtQPmr7QX/EVlgrjYZNrNatfHNDKgvQthctchyueBNb6LsLym8p6Gd
 gX5vNBxBP/0SjPKgUlDQ2zIt55S8sMnnoPZWynt0yK5YO3trEGWjU4rAWIEM4zZVLriKuMhOetW
 hg3EuJrIfCGXrzRM1DjDTpaFWqKXOovu23w+KpRZHe7TlHfLrWF+2N4/sQ6KZv9dYJ/ChPy9do7
 dtdRc0EUI+K3PmV7i3plYheSsBvJuQemSe+A6bb1eNYI0fnOgJ49OvvRgYPM7240rOuzQcHLem0
 UudiPNGS8ZqiSIzQXjiWa5cMJ0Mh0RgOf6Osf5mxpXX3NyKH2nvtBh81VOYNAJQlNdsh/2jkX4S
 KM80PFWTPzGuGsTKh0lGKpOxtEl5ZAysXfBB7yNzyBuTwuxfmWxRekpBRWguX5DbZRCjMaDX5Dg
 5uWQS7eQU8p2ELQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 18 Sep 2026 13:54:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10551

Using https://layers.openembedded.org/layerindex/branch_comparison.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-6.1.rst         | 1081 ++++++++++++++=
++++++
 1 file changed, 1081 insertions(+)

diff --git a/documentation/migration-guides/release-notes-6.1.rst b/docum=
entation/migration-guides/release-notes-6.1.rst
index 16b5c34d1..6fac0513f 100644
--- a/documentation/migration-guides/release-notes-6.1.rst
+++ b/documentation/migration-guides/release-notes-6.1.rst
@@ -915,6 +915,1087 @@ Recipe Upgrades in |yocto-ver|
    Generated with https://layers.openembedded.org/layerindex/branch_comp=
arison
    With "rST" output selected
=20
+The following recipes have been upgraded:
+
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous version(s)
+     - New version(s)
+   * - ``acl``
+     - 2.3.2
+     - 2.4.0
+   * - ``acpica``
+     - 20251212
+     - 20260408
+   * - ``adwaita-icon-theme``
+     - 49.0
+     - 50.0
+   * - ``alsa-lib``
+     - 1.2.15.3
+     - 1.2.16.1
+   * - ``alsa-ucm-conf``
+     - 1.2.15.3
+     - 1.2.16.1
+   * - ``alsa-utils``
+     - 1.2.15.2
+     - 1.2.16
+   * - ``appstream``
+     - 1.1.2
+     - 1.2.0
+   * - ``apr-util``
+     - 1.6.3
+     - 1.6.5
+   * - ``at-spi2-core``
+     - 2.60.0
+     - 2.60.6
+   * - ``attr``
+     - 2.5.2
+     - 2.6.0
+   * - ``avahi``
+     - 0.8
+     - 0.9~rc5
+   * - ``barebox``
+     - 2026.04.0
+     - 2026.08.0
+   * - ``barebox-tools``
+     - 2026.04.0
+     - 2026.08.0
+   * - ``bash-completion``
+     - 2.17.0
+     - 2.18.0
+   * - ``bind``
+     - 9.20.26
+     - 9.20.27
+   * - ``binutils``
+     - 2.46.1
+     - 2.47
+   * - ``binutils-cross``
+     - 2.46.1
+     - 2.47
+   * - ``binutils-cross-canadian``
+     - 2.46.1
+     - 2.47
+   * - ``binutils-crosssdk``
+     - 2.46.1
+     - 2.47
+   * - ``binutils-testsuite``
+     - 2.46.1
+     - 2.47
+   * - ``bluez5``
+     - 5.86
+     - 5.87
+   * - ``boost``
+     - 1.90.0
+     - 1.92.0
+   * - ``boost-build-native``
+     - 1.90.0
+     - 1.92.0
+   * - ``btrfs-tools``
+     - 6.19.1
+     - 7.1
+   * - ``busybox``
+     - 1.37.0
+     - 1.38.0
+   * - ``busybox-inittab``
+     - 1.37.0
+     - 1.38.0
+   * - ``ca-certificates``
+     - 20260601
+     - 20260816
+   * - ``cargo``
+     - 1.94.1
+     - 1.98.1
+   * - ``cargo-c``
+     - 0.10.21+cargo-0.95.0
+     - 0.10.25+cargo-0.99.0
+   * - ``ccache``
+     - 4.13.3
+     - 4.14
+   * - ``clang``
+     - 22.1.8
+     - 23.1.0
+   * - ``cmake``
+     - 4.3.1
+     - 4.4.3
+   * - ``cmake-native``
+     - 4.3.1
+     - 4.4.3
+   * - ``compiler-rt``
+     - 22.1.8
+     - 23.1.0
+   * - ``compiler-rt-sanitizers``
+     - 22.1.8
+     - 23.1.0
+   * - ``coreutils``
+     - 9.10
+     - 9.11
+   * - ``createrepo-c``
+     - 1.2.3
+     - 1.2.4
+   * - ``cross-localedef-native``
+     - 2.43+git
+     - 2.44+git
+   * - ``cryptodev-linux``
+     - 1.14
+     - 1.14+git
+   * - ``cryptodev-module``
+     - 1.14
+     - 1.14+git
+   * - ``cryptodev-tests``
+     - 1.14
+     - 1.14+git
+   * - ``cups``
+     - 2.4.16
+     - 2.4.19
+   * - ``curl``
+     - 8.19.0
+     - 8.22.0
+   * - ``debianutils``
+     - 5.23.2
+     - 5.24
+   * - ``debugedit``
+     - 5.2
+     - 5.3
+   * - ``dhcpcd``
+     - 10.3.1
+     - 10.5.2
+   * - ``diffoscope``
+     - 314
+     - 329
+   * - ``diffstat``
+     - 1.68
+     - 1.69
+   * - ``dos2unix``
+     - 7.5.4
+     - 7.5.7
+   * - ``dropbear``
+     - 2025.89
+     - 2026.94
+   * - ``dtc``
+     - 1.7.2
+     - 1.8.1
+   * - ``ed``
+     - 1.22.5
+     - 1.22.6
+   * - ``elfutils``
+     - 0.194
+     - 0.196
+   * - ``enchant2``
+     - 2.8.15
+     - 2.8.21
+   * - ``epiphany``
+     - 49.7
+     - 50.6
+   * - ``erofs-utils``
+     - 1.9.1
+     - 1.9.4
+   * - ``ethtool``
+     - 6.19
+     - 7.1
+   * - ``expat``
+     - 2.7.5
+     - 2.8.4
+   * - ``fastfloat``
+     - 8.2.4
+     - 8.2.10
+   * - ``ffmpeg``
+     - 8.0.3
+     - 8.1.2
+   * - ``file``
+     - 5.47
+     - 5.48
+   * - ``findutils``
+     - 4.10.0
+     - 4.11.0
+   * - ``fmt``
+     - 12.1.0
+     - 12.2.0
+   * - ``font-util``
+     - 1.4.1
+     - 1.4.2
+   * - ``fontconfig``
+     - 2.17.1
+     - 2.18.3
+   * - ``gawk``
+     - 5.4.0
+     - 5.4.1
+   * - ``gcc``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-cross``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-cross-canadian``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-crosssdk``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-runtime``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-sanitizers``
+     - 15.3.0
+     - 16.2.0
+   * - ``gcc-source``
+     - 15.3.0
+     - 16.2.0
+   * - ``gdk-pixbuf``
+     - 2.44.5
+     - 2.44.8
+   * - ``ghostscript``
+     - 10.06.0
+     - 10.07.1
+   * - ``git``
+     - 2.53.0
+     - 2.55.0
+   * - ``glib-2.0``
+     - 2.88.2
+     - 2.88.3
+   * - ``glib-2.0-initial``
+     - 2.88.2
+     - 2.88.3
+   * - ``glibc``
+     - 2.43+git
+     - 2.44+git
+   * - ``glibc-locale``
+     - 2.43+git
+     - 2.44+git
+   * - ``glibc-mtrace``
+     - 2.43+git
+     - 2.44+git
+   * - ``glibc-scripts``
+     - 2.43+git
+     - 2.44+git
+   * - ``glibc-testsuite``
+     - 2.43+git
+     - 2.44+git
+   * - ``glslang``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``gn``
+     - 0+git (9d19a7870add=E2=80=A6)
+     - 0+git (17b0057970fa=E2=80=A6)
+   * - ``gnu-config``
+     - 20250709+git
+     - 20260629+git
+   * - ``gnupg``
+     - 2.5.17
+     - 2.5.22
+   * - ``gnutls``
+     - 3.8.12
+     - 3.8.13
+   * - ``go``
+     - 1.26.5
+     - 1.27.1
+   * - ``go-binary-native``
+     - 1.26.5
+     - 1.27.1
+   * - ``go-cross-canadian``
+     - 1.26.5
+     - 1.27.1
+   * - ``go-cross-core2-32``
+     - 1.26.5
+     - 1.27.1
+   * - ``go-crosssdk``
+     - 1.26.5
+     - 1.27.1
+   * - ``go-runtime``
+     - 1.26.5
+     - 1.27.1
+   * - ``gpgme``
+     - 2.0.1
+     - 2.1.2
+   * - ``gst-devtools``
+     - 1.28.5
+     - 1.28.6
+   * - ``gst-examples``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-libav``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-plugins-bad``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-plugins-base``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-plugins-good``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-plugins-ugly``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-python``
+     - 1.28.5
+     - 1.28.6
+   * - ``gstreamer1.0-rtsp-server``
+     - 1.28.5
+     - 1.28.6
+   * - ``gtk-doc``
+     - 1.35.1
+     - 1.36.1
+   * - ``gtk4``
+     - 4.22.2
+     - 4.22.4
+   * - ``harfbuzz``
+     - 12.3.2
+     - 14.4.0
+   * - ``hwdata``
+     - 0.406
+     - 0.410
+   * - ``igt-gpu-tools``
+     - 2.3
+     - 2.5
+   * - ``inetutils``
+     - 2.7
+     - 2.8
+   * - ``iproute2``
+     - 6.19.0
+     - 7.2.0
+   * - ``json-c``
+     - 0.18
+     - 0.19
+   * - ``kbd``
+     - 2.9.0
+     - 2.10.0
+   * - ``kea``
+     - 3.0.3
+     - 3.2.0
+   * - ``less``
+     - 692
+     - 704
+   * - ``libadwaita``
+     - 1.8.4
+     - 1.9.3
+   * - ``libarchive``
+     - 3.8.7
+     - 3.8.9
+   * - ``libcap``
+     - 2.77
+     - 2.78
+   * - ``libcap-ng``
+     - 0.9.1
+     - 0.9.5
+   * - ``libcap-ng-python``
+     - 0.9.1
+     - 0.9.5
+   * - ``libcxx``
+     - 22.1.8
+     - 23.1.0
+   * - ``libdisplay-info``
+     - 0.3.0
+     - 0.4.0
+   * - ``libdrm``
+     - 2.4.131
+     - 2.4.134
+   * - ``libedit``
+     - 20251016-3.1
+     - 20260512-3.1
+   * - ``libevdev``
+     - 1.13.6
+     - 1.13.7
+   * - ``libevent``
+     - 2.1.12
+     - 2.1.13
+   * - ``libffi``
+     - 3.5.2
+     - 3.8.0
+   * - ``libfyaml``
+     - 0.9.4
+     - 0.9.6
+   * - ``libgcc``
+     - 15.3.0
+     - 16.2.0
+   * - ``libgcc-initial``
+     - 15.3.0
+     - 16.2.0
+   * - ``libgcrypt``
+     - 1.12.1
+     - 1.12.3
+   * - ``libgfortran``
+     - 15.3.0
+     - 16.2.0
+   * - ``libgit2``
+     - 1.9.2
+     - 1.9.7
+   * - ``libgpg-error``
+     - 1.59
+     - 1.61
+   * - ``libical``
+     - 3.0.20
+     - 4.0.5
+   * - ``libinput``
+     - 1.30.2
+     - 1.31.3
+   * - ``libjpeg-turbo``
+     - 3.1.3
+     - 3.2.0
+   * - ``libksba``
+     - 1.6.8
+     - 1.8.1
+   * - ``libmd``
+     - 1.1.0
+     - 1.2.0
+   * - ``libmicrohttpd``
+     - 1.0.2
+     - 1.0.10
+   * - ``libmodulemd``
+     - 2.15.2
+     - 2.15.3
+   * - ``libmpc``
+     - 1.3.1
+     - 1.4.1
+   * - ``libpcre2``
+     - 10.47
+     - 10.48
+   * - ``libpng``
+     - 1.6.56
+     - 1.6.58
+   * - ``libportal``
+     - 0.9.1
+     - 0.10.0
+   * - ``libpsl``
+     - 0.21.5
+     - 0.23.3
+   * - ``librepo``
+     - 1.20.0
+     - 1.21.0
+   * - ``librsvg``
+     - 2.61.3
+     - 2.62.3
+   * - ``libseccomp``
+     - 2.6.0
+     - 2.6.1
+   * - ``libslirp``
+     - 4.9.1
+     - 4.9.4
+   * - ``libsolv``
+     - 0.7.36
+     - 0.7.39
+   * - ``libstd-rs``
+     - 1.94.1
+     - 1.98.1
+   * - ``libtool``
+     - 2.5.4
+     - 2.6.2
+   * - ``libtool-cross``
+     - 2.5.4
+     - 2.6.2
+   * - ``libtool-native``
+     - 2.5.4
+     - 2.6.2
+   * - ``libusb1``
+     - 1.0.29
+     - 1.0.30
+   * - ``libva``
+     - 2.23.0
+     - 2.24.1
+   * - ``libva-initial``
+     - 2.23.0
+     - 2.24.1
+   * - ``libva-utils``
+     - 2.23.0
+     - 2.24.0
+   * - ``libxfont2``
+     - 2.0.7
+     - 2.0.9
+   * - ``libxi``
+     - 1.8.2
+     - 1.8.3
+   * - ``libxkbcommon``
+     - 1.13.1
+     - 1.13.2
+   * - ``libxmlb``
+     - 0.3.25
+     - 0.3.29
+   * - ``lighttpd``
+     - 1.4.82
+     - 1.4.85
+   * - ``linux-firmware``
+     - 20260410
+     - 20260810
+   * - ``linux-libc-headers``
+     - 6.18
+     - 7.2
+   * - ``linux-yocto``
+     - 6.18.39+git
+     - 6.18.48+git, 7.2.2+git
+   * - ``linux-yocto-dev``
+     - 7.0+git
+     - 7.2+git
+   * - ``linux-yocto-rt``
+     - 6.18.39+git
+     - 6.18.48+git, 7.2.2+git
+   * - ``linux-yocto-tiny``
+     - 6.18.39+git
+     - 6.18.48+git, 7.2.2+git
+   * - ``lld``
+     - 22.1.8
+     - 23.1.0
+   * - ``lldb``
+     - 22.1.8
+     - 23.1.0
+   * - ``llvm``
+     - 22.1.8
+     - 23.1.0
+   * - ``llvm-tblgen-native``
+     - 22.1.8
+     - 23.1.0
+   * - ``log4cplus``
+     - 2.1.2
+     - 2.2.0.1
+   * - ``lsof``
+     - 4.99.6
+     - 4.99.7
+   * - ``ltp``
+     - 20260130
+     - 20260529
+   * - ``lttng-modules``
+     - 2.14.4
+     - 2.16.0
+   * - ``lttng-tools``
+     - 2.14.1
+     - 2.16.0
+   * - ``lttng-ust``
+     - 2.14.0
+     - 2.16.0
+   * - ``lua``
+     - 5.5.0
+     - 5.5.1
+   * - ``lzip``
+     - 1.25
+     - 1.26
+   * - ``makedumpfile``
+     - 1.7.8
+     - 1.7.9
+   * - ``man-pages``
+     - 6.17
+     - 6.19
+   * - ``mesa``
+     - 26.0.5
+     - 26.2.2
+   * - ``mesa-demos``
+     - 9.0.0
+     - 9.0.0+git
+   * - ``mesa-gl``
+     - 26.0.5
+     - 26.2.2
+   * - ``mesa-tools-native``
+     - 26.0.5
+     - 26.2.2
+   * - ``meson``
+     - 1.10.2
+     - 1.12.0
+   * - ``minicom``
+     - 2.10
+     - 2.11.1
+   * - ``mkfontscale``
+     - 1.2.3
+     - 1.2.4
+   * - ``mpg123``
+     - 1.33.4
+     - 1.33.7
+   * - ``msmtp``
+     - 1.8.32
+     - 1.8.34
+   * - ``nasm``
+     - 3.01
+     - 3.02
+   * - ``nativesdk-libtool``
+     - 2.5.4
+     - 2.6.2
+   * - ``neard``
+     - 0.19
+     - 0.20
+   * - ``netbase``
+     - 6.5
+     - 6.6
+   * - ``nettle``
+     - 3.10.2
+     - 4.0
+   * - ``nfs-utils``
+     - 2.8.7
+     - 2.9.2
+   * - ``nghttp2``
+     - 1.68.1
+     - 1.70.0
+   * - ``openmp``
+     - 22.1.8
+     - 23.1.0
+   * - ``opensbi``
+     - 1.8.1
+     - 1.9
+   * - ``openssh``
+     - 10.3p1
+     - 10.5p1
+   * - ``openssl``
+     - 3.5.7
+     - 4.0.2
+   * - ``opkg``
+     - 0.9.0
+     - 0.10.0
+   * - ``orc``
+     - 0.4.42
+     - 0.4.43
+   * - ``ovmf``
+     - edk2-stable202511
+     - edk2-stable202605
+   * - ``p11-kit``
+     - 0.26.4
+     - 0.26.5
+   * - ``pango``
+     - 1.57.0
+     - 1.58.2
+   * - ``parted``
+     - 3.6
+     - 3.7
+   * - ``patchelf``
+     - 0.18.0+git
+     - 0.19.1
+   * - ``pciutils``
+     - 3.14.0
+     - 3.15.0
+   * - ``perl``
+     - 5.42.0
+     - 5.44.0
+   * - ``piglit``
+     - 1.0+gitr (a0a27e528f64=E2=80=A6)
+     - 1.0+gitr (56f237be32ed=E2=80=A6)
+   * - ``pinentry``
+     - 1.3.2
+     - 1.3.3
+   * - ``pkgconf``
+     - 2.5.1
+     - 3.0.6
+   * - ``powertop``
+     - 2.15
+     - 2.16
+   * - ``ppp``
+     - 2.5.2
+     - 2.5.3
+   * - ``procps``
+     - 4.0.6
+     - 4.0.7
+   * - ``puzzles``
+     - 0.0+git (ecb576fb2a0a=E2=80=A6)
+     - 0.0+git (3c3632259d29=E2=80=A6)
+   * - ``python3``
+     - 3.14.6
+     - 3.14.7
+   * - ``python3-attrs``
+     - 25.4.0
+     - 26.1.0
+   * - ``python3-build``
+     - 1.4.0
+     - 1.6.0
+   * - ``python3-certifi``
+     - 2026.2.25
+     - 2026.7.22
+   * - ``python3-cffi``
+     - 2.0.0
+     - 2.1.1
+   * - ``python3-click``
+     - 8.3.1
+     - 8.5.0
+   * - ``python3-cryptography``
+     - 46.0.7
+     - 50.0.1
+   * - ``python3-cryptography-vectors``
+     - 46.0.7
+     - 50.0.1
+   * - ``python3-cython``
+     - 3.2.4
+     - 3.2.9
+   * - ``python3-docutils``
+     - 0.22.4
+     - 0.23
+   * - ``python3-dtc``
+     - 1.7.2
+     - 1.8.1
+   * - ``python3-dtschema``
+     - 2025.12
+     - 2026.6
+   * - ``python3-editables``
+     - 0.5
+     - 0.6
+   * - ``python3-git``
+     - 3.1.43
+     - 3.1.61
+   * - ``python3-hatchling``
+     - 1.29.0
+     - 1.31.0
+   * - ``python3-hypothesis``
+     - 6.151.9
+     - 6.167.0
+   * - ``python3-idna``
+     - 3.11
+     - 3.19
+   * - ``python3-imagesize``
+     - 2.0.0
+     - 2.0.1
+   * - ``python3-installer``
+     - 0.7.0
+     - 1.0.1
+   * - ``python3-jsonpointer``
+     - 3.0.0
+     - 3.1.1
+   * - ``python3-lxml``
+     - 6.0.2
+     - 6.1.2
+   * - ``python3-mako``
+     - 1.3.10
+     - 1.4.1
+   * - ``python3-markdown``
+     - 3.10.2
+     - 3.10.3
+   * - ``python3-maturin``
+     - 1.12.4
+     - 1.15.0
+   * - ``python3-meson-python``
+     - 0.19.0
+     - 0.20.0
+   * - ``python3-numpy``
+     - 2.4.3
+     - 2.5.2
+   * - ``python3-packaging``
+     - 26.0
+     - 26.3
+   * - ``python3-pathspec``
+     - 1.0.4
+     - 1.1.1
+   * - ``python3-pbr``
+     - 7.0.3
+     - 7.1.0
+   * - ``python3-pdm``
+     - 2.26.6
+     - 2.29.0
+   * - ``python3-pdm-backend``
+     - 2.4.7
+     - 2.4.9
+   * - ``python3-pip``
+     - 26.0.1
+     - 26.2.1
+   * - ``python3-poetry-core``
+     - 2.3.1
+     - 2.4.1
+   * - ``python3-pycairo``
+     - 1.29.0
+     - 1.29.1
+   * - ``python3-pyelftools``
+     - 0.32
+     - 0.33
+   * - ``python3-pygments``
+     - 2.19.2
+     - 2.21.0
+   * - ``python3-pygobject``
+     - 3.56.1
+     - 3.58.0
+   * - ``python3-pyopenssl``
+     - 26.0.0
+     - 26.4.0
+   * - ``python3-pyproject-metadata``
+     - 0.11.0
+     - 0.12.1
+   * - ``python3-pytest``
+     - 9.0.2
+     - 9.1.1
+   * - ``python3-pytz``
+     - 2026.1
+     - 2026.3
+   * - ``python3-requests``
+     - 2.32.5
+     - 2.34.2
+   * - ``python3-rpds-py``
+     - 0.30.0
+     - 2026.6.3
+   * - ``python3-sbom-cve-check``
+     - 1.3.1
+     - 1.3.3
+   * - ``python3-scons``
+     - 4.10.1
+     - 4.11.1
+   * - ``python3-setuptools``
+     - 82.0.1
+     - 84.0.0
+   * - ``python3-setuptools-rust``
+     - 1.12.0
+     - 1.13.0
+   * - ``python3-setuptools-scm``
+     - 9.2.2
+     - 10.2.3
+   * - ``python3-shacl2code``
+     - 1.0.1
+     - 1.1.0
+   * - ``python3-snowballstemmer``
+     - 3.0.1
+     - 3.1.1
+   * - ``python3-spdx-python-model``
+     - 0.0.5
+     - 0.0.6
+   * - ``python3-sphinx-argparse``
+     - 0.5.2
+     - 0.6.1
+   * - ``python3-testtools``
+     - 2.8.7
+     - 2.9.1
+   * - ``python3-trove-classifiers``
+     - 2026.1.14.14
+     - 2026.6.1.19
+   * - ``python3-typing-extensions``
+     - 4.15.0
+     - 4.16.0
+   * - ``python3-uritools``
+     - 6.0.1
+     - 6.1.3
+   * - ``python3-urllib3``
+     - 2.6.3
+     - 2.7.0
+   * - ``python3-uv-build``
+     - 0.10.10
+     - 0.12.9
+   * - ``python3-wcwidth``
+     - 0.6.0
+     - 0.8.3
+   * - ``python3-websockets``
+     - 16.0
+     - 17.1
+   * - ``python3-wheel``
+     - 0.46.3
+     - 0.48.0
+   * - ``python3-zipp``
+     - 3.23.0
+     - 4.1.0
+   * - ``qemu``
+     - 10.2.0
+     - 11.1.1
+   * - ``qemu-native``
+     - 10.2.0
+     - 11.1.1
+   * - ``qemu-system-native``
+     - 10.2.0
+     - 11.1.1
+   * - ``re2c``
+     - 4.4
+     - 4.6
+   * - ``repo``
+     - 2.61.1
+     - 2.66.1
+   * - ``resolvconf``
+     - 1.94
+     - 1.95
+   * - ``rpm``
+     - 4.20.1
+     - 6.0.2
+   * - ``rpm-sequoia``
+     - 1.10.1
+     - 1.10.2
+   * - ``rpm-sequoia-crypto-policy``
+     - git (f3f5fa454345=E2=80=A6)
+     - git (359ab169da6a=E2=80=A6)
+   * - ``rsync``
+     - 3.4.1
+     - 3.5.0
+   * - ``ruby``
+     - 4.0.5
+     - 4.0.6
+   * - ``rust``
+     - 1.94.1
+     - 1.98.1
+   * - ``rust-cross-canadian``
+     - 1.94.1
+     - 1.98.1
+   * - ``sbom-cve-check-update-cvelist-native``
+     - 2026-05-07
+     - 2026-08-25
+   * - ``sbom-cve-check-update-nvd-native``
+     - 2026.05.07-000006
+     - 2026.08.25-000009
+   * - ``scdoc``
+     - 1.11.4
+     - 1.11.5
+   * - ``screen``
+     - 5.0.1
+     - 5.0.2
+   * - ``shaderc``
+     - 2026.1
+     - 2026.3
+   * - ``shadow``
+     - 4.19.4
+     - 4.20.2
+   * - ``shared-mime-info``
+     - 2.4
+     - 2.5.1
+   * - ``spirv-headers``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``spirv-llvm-translator``
+     - 22.1.1
+     - 23.1.1
+   * - ``spirv-tools``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``sqlite3``
+     - 3.51.3
+     - 3.53.4
+   * - ``strace``
+     - 6.19
+     - 7.2
+   * - ``stress-ng``
+     - 0.20.01
+     - 0.22.00
+   * - ``swig``
+     - 4.4.1
+     - 4.5.0
+   * - ``sysstat``
+     - 12.7.9
+     - 12.8.0
+   * - ``systemd``
+     - 259.5
+     - 261.2
+   * - ``systemd-boot``
+     - 259.5
+     - 261.2
+   * - ``systemd-boot-native``
+     - 259.5
+     - 261.2
+   * - ``systemtap``
+     - 5.4
+     - 5.5
+   * - ``systemtap-native``
+     - 5.4
+     - 5.5
+   * - ``taglib``
+     - 2.2.1
+     - 2.3.1
+   * - ``tcf-agent``
+     - 1.9.0
+     - 1.11.0
+   * - ``tcl``
+     - 9.0.3
+     - 9.0.4
+   * - ``tcl8``
+     - 8.6.17
+     - 8.6.18
+   * - ``tiff``
+     - 4.7.1
+     - 4.7.2
+   * - ``time``
+     - 1.9
+     - 1.10
+   * - ``ttyrun``
+     - 2.41.0
+     - 2.44.0
+   * - ``u-boot``
+     - 2026.01
+     - 2026.07
+   * - ``u-boot-tools``
+     - 2026.01
+     - 2026.07
+   * - ``utfcpp``
+     - 4.0.9
+     - 4.2.0
+   * - ``util-linux``
+     - 2.41.5
+     - 2.42.3
+   * - ``util-linux-libuuid``
+     - 2.41.5
+     - 2.42.3
+   * - ``vala``
+     - 0.56.18
+     - 0.56.19
+   * - ``valgrind``
+     - 3.26.0
+     - 3.27.1
+   * - ``vim``
+     - 9.2.0340
+     - 9.2.0993
+   * - ``vim-tiny``
+     - 9.2.0340
+     - 9.2.0993
+   * - ``virglrenderer``
+     - 1.2.0
+     - 1.3.0
+   * - ``vte``
+     - 0.82.2
+     - 0.84.1
+   * - ``vulkan-headers``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``vulkan-loader``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``vulkan-samples``
+     - git (fa2cf45adde0=E2=80=A6)
+     - git (383471195757=E2=80=A6)
+   * - ``vulkan-tools``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``vulkan-utility-libraries``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``vulkan-validation-layers``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``vulkan-volk``
+     - 1.4.341.0
+     - 1.4.357.0
+   * - ``waffle``
+     - 1.8.1
+     - 1.8.3
+   * - ``wayland``
+     - 1.24.0
+     - 1.26.0
+   * - ``wayland-protocols``
+     - 1.47
+     - 1.49
+   * - ``webkitgtk``
+     - 2.50.6
+     - 2.52.6
+   * - ``weston``
+     - 15.0.0
+     - 16.0.0
+   * - ``which``
+     - 2.23
+     - 2.25
+   * - ``wireless-regdb``
+     - 2026.05.30
+     - 2026.09.03
+   * - ``wpa-supplicant``
+     - 2.11
+     - 2.12
+   * - ``xev``
+     - 1.2.6
+     - 1.2.7
+   * - ``xkeyboard-config``
+     - 2.47
+     - 2.48
+   * - ``xmodmap``
+     - 1.0.11
+     - 1.0.12
+   * - ``xrandr``
+     - 1.5.3
+     - 1.5.4
+   * - ``xset``
+     - 1.2.5
+     - 1.2.6
+   * - ``xvinfo``
+     - 1.1.5
+     - 1.1.6
+   * - ``xwininfo``
+     - 1.1.6
+     - 1.1.7
+   * - ``xz``
+     - 5.8.2
+     - 5.8.3
+
 Contributors to |yocto-ver|
 ---------------------------
=20

--=20
2.55.0


