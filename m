Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE914C36016
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 13:07:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10702.1743167256529910231
 for <docs@lists.yoctoproject.org>;
 Fri, 28 Mar 2025 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WcWAmz2w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85779441A7;
	Fri, 28 Mar 2025 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743167254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5GuNZLATThRQzulN50+LRjfAr1/b259TB3QaO5KHfPY=;
	b=WcWAmz2wVRQ1Nn5EeqWiTSV3PQrTnqqdASw3SncQThO1S8HXiE34JXqGnbkdkOFN1qb8a3
	nMjPb1ujgNq+VFEZBQhnRS2m/1wlX4imKzuI2MZe+EWyJyKVWcOupiKgO5+CiC5JaAOcWM
	uQ9jm8znRc/70RKZQsxkVmN+3i9aTRQfLZH9crpRIrzarS99xmwwWiq+U6fKqOM/yp8oMk
	SqS+ubEz5aEeoMEH69aqaE1Bc3ZeWa8c40/5omstgKb8vmruppX7gHeEfSq9AgKz4cLJx0
	kT0uuY1eepdxRfXIkPyaOnemtxHmf9Ns5LDB6P5Ni0qFTiFxIqOcEoM4RTEvzA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 28 Mar 2025 14:07:05 +0100
Subject: [PATCH 02/11] migration-guides/release-notes-5.2.rst: add recipe
 upgrades
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-release-note-5-2-updates-2-v1-2-c913513e9140@bootlin.com>
References: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
In-Reply-To: <20250328-release-note-5-2-updates-2-v1-0-c913513e9140@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=22991;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Kjv1JGtxbtp5QsgsP+cAu1cSt3cbd2Ng+JAjQGWVgqA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn5p8USBpJtUl7mP7mR5NhgHfel/5ZPF5ssY/GO
 sJ7n8nh5imJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ+afFAAKCRDRgEFAKaOo
 NjccEACydXs9pwVGo0mYJ71l5mnoRim4eye1QMCdXZb0A3DI1pHUD7tXRKiylkd2AFY5hU+sMsT
 2q9KtkUerssAVZXE735cpSj/FBUJhvt6s+lEQkm6IJaGAH9bl/Mg2Pi7Zk3B3MIeYH9SiDpRX0E
 dnvTZh+/XFfMOtxtKuXc7bzSZwx4aEfLBtlaNN12paG4fWPKUzTzaUkBZDh9LzhJ+pU58WQ+qdF
 e+wkY3vAKKz6YroiF7xmXs/wSrvVXFCwcyj4sGESxrlLPB/WlzOmtINFTkbyrN9Lmb4UHv4r9DG
 gofgaKjv0AKor7DaNDgmEedAw+4A0ZsG6wi8PEEBK6NxTklEofinjFVdFEVDp3j5h/zyI7+AF8I
 TQIzW+0oRH8vvmeQLipQw+ANF4IUIKkR40EdkmSdsQVJvD9puPxkP0Vjb1xKHXP5CGJGEMtYyNI
 uMQEb3XN3iUUtCIKkg88yHD24rHRkzgLsX8V4P44nluyAa8FlkVGYJXaUGDr1HTcNyJI4qB6BV4
 EPhqTa4hgXLusJeZblOWRXedJHaukVtB3OtQ9rwtSp5KlwJ22bOh/NvwYqk7XjV1JF28ghqmp5p
 O4gNTvjk2pZwMaeL54reP9gAOEeBg8b9kOSRbhkjlIWTeNDJK2D4eXdPuPoATG1UM5JH86smPmE
 LmJ+KUeYRqO05aA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekueetueeitdekteeuuefhjeeugfejtdduudduueduudffffejgeevvdejlefgleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepughotghssehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrghdpr
 hgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 28 Mar 2025 13:07:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6660

Extracted from layers.openembedded.org branch comparison tool.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../migration-guides/release-notes-5.2.rst         | 1170 ++++++++++++++++++++
 1 file changed, 1170 insertions(+)

diff --git a/documentation/migration-guides/release-notes-5.2.rst b/documentation/migration-guides/release-notes-5.2.rst
index 923d3809a..081100870 100644
--- a/documentation/migration-guides/release-notes-5.2.rst
+++ b/documentation/migration-guides/release-notes-5.2.rst
@@ -712,6 +712,1176 @@ Security Fixes in |yocto-ver|
 Recipe Upgrades in |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
+.. list-table::
+   :widths: 20 40 40
+   :header-rows: 1
+
+   * - Recipe
+     - Previous version
+     - New version
+   * - ``adwaita-icon-theme``
+     - 46.2
+     - 48.0
+   * - ``alsa-lib``
+     - 1.2.12
+     - 1.2.13
+   * - ``alsa-ucm-conf``
+     - 1.2.12
+     - 1.2.13
+   * - ``alsa-utils``
+     - 1.2.12
+     - 1.2.13
+   * - ``appstream``
+     - 1.0.3
+     - 1.0.4
+   * - ``at-spi2-core``
+     - 2.52.0
+     - 2.56.0
+   * - ``autoconf-archive``
+     - 2023.02.20
+     - 2024.10.16
+   * - ``babeltrace2``
+     - 2.0.6
+     - 2.1.0
+   * - ``base-passwd``
+     - 3.6.4
+     - 3.6.6
+   * - ``bash``
+     - 5.2.32
+     - 5.2.37
+   * - ``bash-completion``
+     - 2.14.0
+     - 2.16.0
+   * - ``bc``
+     - 1.07.1
+     - 1.08.1
+   * - ``bind``
+     - 9.20.1
+     - 9.20.6
+   * - ``binutils``
+     - 2.43.1
+     - 2.44
+   * - ``binutils-cross``
+     - 2.43.1
+     - 2.44
+   * - ``binutils-cross-canadian``
+     - 2.43.1
+     - 2.44
+   * - ``binutils-crosssdk``
+     - 2.43.1
+     - 2.44
+   * - ``binutils-testsuite``
+     - 2.43.1
+     - 2.44
+   * - ``bluez5``
+     - 5.78
+     - 5.79
+   * - ``boost``
+     - 1.86.0
+     - 1.87.0
+   * - ``boost-build-native``
+     - 1.86.0
+     - 1.87.0
+   * - ``btrfs-tools``
+     - 6.10.1
+     - 6.13
+   * - ``build-appliance-image``
+     - 15.0.0 (6a5ba188b79e…)
+     - 15.0.0 (2fe7f46e1779…)
+   * - ``busybox``
+     - 1.36.1
+     - 1.37.0
+   * - ``busybox-inittab``
+     - 1.36.1
+     - 1.37.0
+   * - ``ca-certificates``
+     - 20240203
+     - 20241223
+   * - ``cairo``
+     - 1.18.2
+     - 1.18.4
+   * - ``cargo``
+     - 1.79.0
+     - 1.84.1
+   * - ``ccache``
+     - 4.10.2
+     - 4.11
+   * - ``chrpath``
+     - 0.16
+     - 0.18
+   * - ``cmake``
+     - 3.30.2
+     - 3.31.6
+   * - ``cmake-native``
+     - 3.30.2
+     - 3.31.6
+   * - ``connman``
+     - 1.42
+     - 1.43
+   * - ``coreutils``
+     - 9.5
+     - 9.6
+   * - ``cracklib``
+     - 2.10.2
+     - 2.10.3
+   * - ``createrepo-c``
+     - 1.1.4
+     - 1.2.0
+   * - ``cross-localedef-native``
+     - 2.40+git
+     - 2.41+git
+   * - ``cups``
+     - 2.4.10
+     - 2.4.11
+   * - ``curl``
+     - 8.9.1
+     - 8.12.1
+   * - ``dbus``
+     - 1.14.10
+     - 1.16.2
+   * - ``dbus-glib``
+     - 0.112
+     - 0.114
+   * - ``debianutils``
+     - 5.20
+     - 5.21
+   * - ``debugedit``
+     - 5.0
+     - 5.1
+   * - ``desktop-file-utils``
+     - 0.27
+     - 0.28
+   * - ``dhcpcd``
+     - 10.0.10
+     - 10.2.2
+   * - ``diffoscope``
+     - 277
+     - 289
+   * - ``diffstat``
+     - 1.66
+     - 1.67
+   * - ``diffutils``
+     - 3.10
+     - 3.11
+   * - ``dnf``
+     - 4.21.1
+     - 4.22.0
+   * - ``dropbear``
+     - 2024.85
+     - 2024.86
+   * - ``dtc``
+     - 1.7.0
+     - 1.7.2
+   * - ``ed``
+     - 1.20.2
+     - 1.21
+   * - ``efivar``
+     - 39+39+git
+     - 39
+   * - ``elfutils``
+     - 0.191
+     - 0.192
+   * - ``ell``
+     - 0.68
+     - 0.74
+   * - ``epiphany``
+     - 46.3
+     - 48.0
+   * - ``erofs-utils``
+     - 1.8.1
+     - 1.8.5
+   * - ``ethtool``
+     - 6.10
+     - 6.11
+   * - ``expat``
+     - 2.6.4
+     - 2.7.0
+   * - ``ffmpeg``
+     - 7.0.2
+     - 7.1.1
+   * - ``file``
+     - 5.45
+     - 5.46
+   * - ``fmt``
+     - 11.0.2
+     - 11.1.4
+   * - ``fribidi``
+     - 1.0.15
+     - 1.0.16
+   * - ``gawk``
+     - 5.3.0
+     - 5.3.1
+   * - ``gcr``
+     - 4.3.0
+     - 4.3.1
+   * - ``gdb``
+     - 15.1
+     - 16.2
+   * - ``gdb-cross``
+     - 15.1
+     - 16.2
+   * - ``gdb-cross-canadian``
+     - 15.1
+     - 16.2
+   * - ``gettext``
+     - 0.22.5
+     - 0.23.1
+   * - ``gettext-minimal-native``
+     - 0.22.5
+     - 0.23.1
+   * - ``ghostscript``
+     - 10.04.0
+     - 10.05.0
+   * - ``gi-docgen``
+     - 2024.1
+     - 2025.3
+   * - ``git``
+     - 2.46.1
+     - 2.49.0
+   * - ``glib-2``
+     - .0 2.80.4
+     - 2.84.0
+   * - ``glib-2``
+     - .0-initial 2.80.4
+     - 2.84.0
+   * - ``glibc``
+     - 2.40+git
+     - 2.41+git
+   * - ``glibc-locale``
+     - 2.40+git
+     - 2.41+git
+   * - ``glibc-mtrace``
+     - 2.40+git
+     - 2.41+git
+   * - ``glibc-scripts``
+     - 2.40+git
+     - 2.41+git
+   * - ``glibc-testsuite``
+     - 2.40+git
+     - 2.41+git
+   * - ``glibc-y2038-tests``
+     - 2.40+git
+     - 2.41+git
+   * - ``glslang``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``gnu-efi``
+     - 3.0.18
+     - 4.0.0
+   * - ``gnupg``
+     - 2.5.0
+     - 2.5.5
+   * - ``gnutls``
+     - 3.8.6
+     - 3.8.9
+   * - ``go``
+     - 1.22.12
+     - 1.24.1
+   * - ``go-binary-native``
+     - 1.22.12
+     - 1.24.1
+   * - ``go-cross-canadian``
+     - 1.22.12
+     - 1.24.1
+   * - ``go-cross-core2-32``
+     - 1.22.12
+     - 1.24.1
+   * - ``go-crosssdk``
+     - 1.22.12
+     - 1.24.1
+   * - ``go-helloworld``
+     - 0.1 (39e772fc2670…)
+     - 0.1 (d7b0ac127859…)
+   * - ``go-runtime``
+     - 1.22.12
+     - 1.24.1
+   * - ``gobject-introspection``
+     - 1.80.1
+     - 1.84.0
+   * - ``gpgme``
+     - 1.23.2
+     - 1.24.2
+   * - ``gsettings-desktop-schemas``
+     - 46.1
+     - 48.0
+   * - ``gst-devtools``
+     - 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-libav 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-plugins-bad 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-plugins-base 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-plugins-good 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-plugins-ugly 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-python 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-rtsp-server 1.24.10
+     - 1.24.12
+   * - ``gstreamer1``
+     - .0-vaapi 1.24.10
+     - 1.24.12
+   * - ``gtk4``
+     - 4.14.5
+     - 4.18.1
+   * - ``harfbuzz``
+     - 9.0.0
+     - 10.4.0
+   * - ``hwlatdetect``
+     - 2.7
+     - 2.8
+   * - ``i2c-tools``
+     - 4.3
+     - 4.4
+   * - ``icu``
+     - 75-1
+     - 76-1
+   * - ``ifupdown``
+     - 0.8.43
+     - 0.8.44
+   * - ``igt-gpu-tools``
+     - 1.28
+     - 1.30
+   * - ``inetutils``
+     - 2.5
+     - 2.6
+   * - ``init-system-helpers``
+     - 1.66
+     - 1.68
+   * - ``iproute2``
+     - 6.10.0
+     - 6.13.0
+   * - ``iptables``
+     - 1.8.10
+     - 1.8.11
+   * - ``iputils``
+     - 20240117
+     - 20240905
+   * - ``iso-codes``
+     - 4.16.0
+     - 4.17.0
+   * - ``json-c``
+     - 0.17
+     - 0.18
+   * - ``json-glib``
+     - 1.8.0
+     - 1.10.6
+   * - ``kbd``
+     - 2.6.4
+     - 2.7.1
+   * - ``kern-tools-native``
+     - 0.3+git (7160ebe8b865…)
+     - 0.3+git (bfca22a52ec5…)
+   * - ``kexec-tools``
+     - 2.0.29
+     - 2.0.30
+   * - ``kmod``
+     - 33
+     - 34.1
+   * - ``kmscube``
+     - 0.0.1+git (b2f97f53e01e…)
+     - 0.0.1+git (311eaaaa473d…)
+   * - ``less``
+     - 661
+     - 668
+   * - ``libadwaita``
+     - 1.5.3
+     - 1.7.0
+   * - ``libarchive``
+     - 3.7.4
+     - 3.7.8
+   * - ``libassuan``
+     - 3.0.1
+     - 3.0.2
+   * - ``libcap``
+     - 2.70
+     - 2.75
+   * - ``libdnf``
+     - 0.73.3
+     - 0.73.4
+   * - ``libdrm``
+     - 2.4.123
+     - 2.4.124
+   * - ``libedit``
+     - 20240808-3.1
+     - 20250104-3.1
+   * - ``libexif``
+     - 0.6.24
+     - 0.6.25
+   * - ``libffi``
+     - 3.4.6
+     - 3.4.7
+   * - ``libgit2``
+     - 1.8.1
+     - 1.9.0
+   * - ``libgpg-error``
+     - 1.50
+     - 1.51
+   * - ``libical``
+     - 3.0.18
+     - 3.0.20
+   * - ``libice``
+     - 1.1.1
+     - 1.1.2
+   * - ``libidn2``
+     - 2.3.7
+     - 2.3.8
+   * - ``libinput``
+     - 1.26.1
+     - 1.27.1
+   * - ``libjitterentropy``
+     - 3.5.0
+     - 3.6.2
+   * - ``libmatchbox``
+     - 1.12
+     - 1.13
+   * - ``libnl``
+     - 3.10.0
+     - 3.11.0
+   * - ``libnotify``
+     - 0.8.3
+     - 0.8.4
+   * - ``libpam``
+     - 1.6.1
+     - 1.7.0
+   * - ``libpcre2``
+     - 10.44
+     - 10.45
+   * - ``libpipeline``
+     - 1.5.7
+     - 1.5.8
+   * - ``libpng``
+     - 1.6.43
+     - 1.6.47
+   * - ``libportal``
+     - 0.7.1
+     - 0.9.1
+   * - ``libproxy``
+     - 0.5.8
+     - 0.5.9
+   * - ``librepo``
+     - 1.18.1
+     - 1.19.0
+   * - ``librsvg``
+     - 2.58.2
+     - 2.59.2
+   * - ``libsdl2``
+     - 2.30.7
+     - 2.32.2
+   * - ``libseccomp``
+     - 2.5.5
+     - 2.6.0
+   * - ``libsecret``
+     - 0.21.4
+     - 0.21.6
+   * - ``libslirp``
+     - 4.8.0
+     - 4.9.0
+   * - ``libsm``
+     - 1.2.4
+     - 1.2.6
+   * - ``libsolv``
+     - 0.7.30
+     - 0.7.31
+   * - ``libsoup``
+     - 3.6.0
+     - 3.6.4
+   * - ``libssh2``
+     - 1.11.0
+     - 1.11.1
+   * - ``libstd-rs``
+     - 1.79.0
+     - 1.84.1
+   * - ``libtest-warnings-perl``
+     - 0.033
+     - 0.038
+   * - ``libtirpc``
+     - 1.3.5
+     - 1.3.6
+   * - ``libtool``
+     - 2.5.2
+     - 2.5.4
+   * - ``libtool-cross``
+     - 2.5.2
+     - 2.5.4
+   * - ``libtool-native``
+     - 2.5.2
+     - 2.5.4
+   * - ``libtraceevent``
+     - 1.8.3
+     - 1.8.4
+   * - ``libtry-tiny-perl``
+     - 0.31
+     - 0.32
+   * - ``libubootenv``
+     - 0.3.5
+     - 0.3.6
+   * - ``libunistring``
+     - 1.2
+     - 1.3
+   * - ``liburcu``
+     - 0.14.1
+     - 0.15.1
+   * - ``libuv``
+     - 1.48.0
+     - 1.50.0
+   * - ``libwebp``
+     - 1.4.0
+     - 1.5.0
+   * - ``libwpe``
+     - 1.16.0
+     - 1.16.2
+   * - ``libx11``
+     - 1.8.10
+     - 1.8.12
+   * - ``libxau``
+     - 1.0.11
+     - 1.0.12
+   * - ``libxcrypt``
+     - 4.4.36
+     - 4.4.38
+   * - ``libxcrypt-compat``
+     - 4.4.36
+     - 4.4.38
+   * - ``libxcursor``
+     - 1.2.2
+     - 1.2.3
+   * - ``libxcvt``
+     - 0.1.2
+     - 0.1.3
+   * - ``libxi``
+     - 1.8.1
+     - 1.8.2
+   * - ``libxkbcommon``
+     - 1.7.0
+     - 1.8.1
+   * - ``libxmlb``
+     - 0.3.19
+     - 0.3.22
+   * - ``libxrender``
+     - 0.9.11
+     - 0.9.12
+   * - ``libxshmfence``
+     - 1.3.2
+     - 1.3.3
+   * - ``libxslt``
+     - 1.1.42
+     - 1.1.43
+   * - ``libxt``
+     - 1.3.0
+     - 1.3.1
+   * - ``libxv``
+     - 1.0.12
+     - 1.0.13
+   * - ``libxxf86vm``
+     - 1.1.5
+     - 1.1.6
+   * - ``lighttpd``
+     - 1.4.76
+     - 1.4.77
+   * - ``linux-firmware``
+     - 20240909
+     - 20250311
+   * - ``linux-libc-headers``
+     - 6.10
+     - 6.12
+   * - ``linux-yocto``
+     - 6.6.75+git, 6.10.14+git
+     - 6.12.19+git
+   * - ``linux-yocto-dev``
+     - 6.11+git
+     - 6.14+git
+   * - ``linux-yocto-rt``
+     - 6.6.75+git, 6.10.14+git
+     - 6.12.19+git
+   * - ``linux-yocto-tiny``
+     - 6.6.75+git, 6.10.14+git
+     - 6.12.19+git
+   * - ``llvm``
+     - 18.1.8
+     - 20.1.0
+   * - ``log4cplus``
+     - 2.1.1
+     - 2.1.2
+   * - ``lsof``
+     - 4.99.3
+     - 4.99.4
+   * - ``ltp``
+     - 20240524
+     - 20250130
+   * - ``lttng-modules``
+     - 2.13.14
+     - 2.13.17
+   * - ``lzip``
+     - 1.24.1
+     - 1.25
+   * - ``lzlib``
+     - 1.14
+     - 1.15
+   * - ``man-db``
+     - 2.12.1
+     - 2.13.0
+   * - ``man-pages``
+     - 6.9.1
+     - 6.13
+   * - ``mc``
+     - 4.8.32
+     - 4.8.33
+   * - ``mesa-demos``
+     - 8.5.0
+     - 9.0.0
+   * - ``meson``
+     - 1.5.1
+     - 1.7.0
+   * - ``minicom``
+     - 2.9
+     - 2.10
+   * - ``mmc-utils``
+     - 0.1+git (123fd8b2ac39…)
+     - 0.1+git (2aef4cd9a84d…)
+   * - ``mpg123``
+     - 1.32.7
+     - 1.32.10
+   * - ``msmtp``
+     - 1.8.26
+     - 1.8.28
+   * - ``mtd-utils``
+     - 2.2.0
+     - 2.3.0
+   * - ``mtools``
+     - 4.0.44
+     - 4.0.48
+   * - ``musl``
+     - 1.2.5+git (dd1e63c3638d…)
+     - 1.2.5+git (c47ad25ea3b4…)
+   * - ``nativesdk-libtool``
+     - 2.5.2
+     - 2.5.4
+   * - ``netbase``
+     - 6.4
+     - 6.5
+   * - ``nettle``
+     - 3.10
+     - 3.10.1
+   * - ``nfs-utils``
+     - 2.6.4
+     - 2.8.2
+   * - ``nghttp2``
+     - 1.63.0
+     - 1.65.0
+   * - ``npth``
+     - 1.7
+     - 1.8
+   * - ``numactl``
+     - 2.0.18
+     - 2.0.19
+   * - ``ofono``
+     - 2.10
+     - 2.15
+   * - ``opensbi``
+     - 1.5.1
+     - 1.6
+   * - ``openssh``
+     - 9.8p1
+     - 9.9p2
+   * - ``openssl``
+     - 3.3.1
+     - 3.4.1
+   * - ``orc``
+     - 0.4.40
+     - 0.4.41
+   * - ``ovmf``
+     - edk2-stable202402
+     - edk2-stable202411
+   * - ``pango``
+     - 1.54.0
+     - 1.56.2
+   * - ``piglit``
+     - 1.0+gitr (c11c9374c144…)
+     - 1.0+gitr (fc8179d31904…)
+   * - ``pixman``
+     - 0.42.2
+     - 0.44.2
+   * - ``pkgconf``
+     - 2.3.0
+     - 2.4.3
+   * - ``ppp``
+     - 2.5.0
+     - 2.5.2
+   * - ``procps``
+     - 4.0.4
+     - 4.0.5
+   * - ``psplash``
+     - 0.1+git (ecc191375669…)
+     - 0.1+git (1f64c654129f…)
+   * - ``ptest-runner``
+     - 2.4.5+git
+     - 2.4.5.1
+   * - ``puzzles``
+     - 0.0+git (1c1899ee1c4e…)
+     - 0.0+git (7da464122232…)
+   * - ``python3``
+     - 3.12.9
+     - 3.13.2
+   * - ``python3-attrs``
+     - 24.2.0
+     - 25.3.0
+   * - ``python3-babel``
+     - 2.16.0
+     - 2.17.0
+   * - ``python3-bcrypt``
+     - 4.2.0
+     - 4.3.0
+   * - ``python3-beartype``
+     - 0.18.5
+     - 0.20.0
+   * - ``python3-build``
+     - 1.2.1
+     - 1.2.2
+   * - ``python3-certifi``
+     - 2024.8.30
+     - 2025.1.31
+   * - ``python3-cffi``
+     - 1.17.0
+     - 1.17.1
+   * - ``python3-click``
+     - 8.1.7
+     - 8.1.8
+   * - ``python3-cryptography``
+     - 42.0.8
+     - 44.0.2
+   * - ``python3-cryptography-vectors``
+     - 42.0.8
+     - 44.0.2
+   * - ``python3-cython``
+     - 3.0.11
+     - 3.0.12
+   * - ``python3-dbus``
+     - 1.3.2
+     - 1.4.0
+   * - ``python3-dbusmock``
+     - 0.32.1
+     - 0.33.0
+   * - ``python3-dtc``
+     - 1.7.0
+     - 1.7.2
+   * - ``python3-dtschema``
+     - 2024.5
+     - 2025.2
+   * - ``python3-flit-core``
+     - 3.9.0
+     - 3.11.0
+   * - ``python3-gitdb``
+     - 4.0.11
+     - 4.0.12
+   * - ``python3-hatchling``
+     - 1.25.0
+     - 1.27.0
+   * - ``python3-hypothesis``
+     - 6.111.2
+     - 6.129.2
+   * - ``python3-idna``
+     - 3.8
+     - 3.10
+   * - ``python3-jinja2``
+     - 3.1.4
+     - 3.1.6
+   * - ``python3-jsonschema-specifications``
+     - 2023.12.1
+     - 2024.10.1
+   * - ``python3-license-expression``
+     - 30.3.1
+     - 30.4.1
+   * - ``python3-lxml``
+     - 5.3.0
+     - 5.3.1
+   * - ``python3-mako``
+     - 1.3.5
+     - 1.3.9
+   * - ``python3-markdown``
+     - 3.6
+     - 3.7
+   * - ``python3-markupsafe``
+     - 2.1.5
+     - 3.0.2
+   * - ``python3-maturin``
+     - 1.7.1
+     - 1.8.3
+   * - ``python3-meson-python``
+     - 0.16.0
+     - 0.17.1
+   * - ``python3-more-itertools``
+     - 10.4.0
+     - 10.6.0
+   * - ``python3-numpy``
+     - 1.26.4
+     - 2.2.3
+   * - ``python3-packaging``
+     - 24.1
+     - 24.2
+   * - ``python3-pip``
+     - 24.2
+     - 25.0.1
+   * - ``python3-poetry-core``
+     - 1.9.0
+     - 2.1.1
+   * - ``python3-psutil``
+     - 6.0.0
+     - 7.0.0
+   * - ``python3-pyasn1``
+     - 0.6.0
+     - 0.6.1
+   * - ``python3-pycairo``
+     - 1.26.1
+     - 1.27.0
+   * - ``python3-pycryptodome``
+     - 3.20.0
+     - 3.22.0
+   * - ``python3-pycryptodomex``
+     - 3.20.0
+     - 3.22.0
+   * - ``python3-pyelftools``
+     - 0.31
+     - 0.32
+   * - ``python3-pygments``
+     - 2.18.0
+     - 2.19.1
+   * - ``python3-pygobject``
+     - 3.48.2
+     - 3.52.2
+   * - ``python3-pyopenssl``
+     - 24.2.1
+     - 25.0.0
+   * - ``python3-pyparsing``
+     - 3.1.4
+     - 3.2.1
+   * - ``python3-pyproject-hooks``
+     - 1.0.0
+     - 1.2.0
+   * - ``python3-pyproject-metadata``
+     - 0.8.0
+     - 0.9.1
+   * - ``python3-pytest``
+     - 8.3.2
+     - 8.3.5
+   * - ``python3-pytest-subtests``
+     - 0.13.1
+     - 0.14.1
+   * - ``python3-pytz``
+     - 2024.1
+     - 2025.1
+   * - ``python3-rdflib``
+     - 7.0.0
+     - 7.1.3
+   * - ``python3-referencing``
+     - 0.35.1
+     - 0.36.2
+   * - ``python3-rpds-py``
+     - 0.20.0
+     - 0.22.3
+   * - ``python3-ruamel-yaml``
+     - 0.18.6
+     - 0.18.10
+   * - ``python3-scons``
+     - 4.8.0
+     - 4.9.0
+   * - ``python3-setuptools``
+     - 72.1.0
+     - 76.0.0
+   * - ``python3-setuptools-rust``
+     - 1.10.1
+     - 1.11.0
+   * - ``python3-setuptools-scm``
+     - 8.1.0
+     - 8.2.0
+   * - ``python3-six``
+     - 1.16.0
+     - 1.17.0
+   * - ``python3-spdx-tools``
+     - 0.8.2
+     - 0.8.3
+   * - ``python3-sphinx``
+     - 8.0.2
+     - 8.2.1
+   * - ``python3-sphinx-rtd-theme``
+     - 2.0.0
+     - 3.0.2
+   * - ``python3-trove-classifiers``
+     - 2024.7.2
+     - 2025.3.13.13
+   * - ``python3-typogrify``
+     - 2.0.7
+     - 2.1.0
+   * - ``python3-urllib3``
+     - 2.2.2
+     - 2.3.0
+   * - ``python3-websockets``
+     - 13.0.1
+     - 15.0.1
+   * - ``python3-wheel``
+     - 0.44.0
+     - 0.45.1
+   * - ``python3-xmltodict``
+     - 0.13.0
+     - 0.14.2
+   * - ``python3-yamllint``
+     - 1.35.1
+     - 1.36.0
+   * - ``python3-zipp``
+     - 3.20.1
+     - 3.21.0
+   * - ``qemu``
+     - 9.0.2
+     - 9.2.0
+   * - ``qemu-native``
+     - 9.0.2
+     - 9.2.0
+   * - ``qemu-system-native``
+     - 9.0.2
+     - 9.2.0
+   * - ``re2c``
+     - 3.1
+     - 4.1
+   * - ``repo``
+     - 2.46
+     - 2.52
+   * - ``rpm``
+     - 4.19.1.1
+     - 4.20.0
+   * - ``rsync``
+     - 3.3.0
+     - 3.4.1
+   * - ``rt-tests``
+     - 2.7
+     - 2.8
+   * - ``ruby``
+     - 3.3.4
+     - 3.4.2
+   * - ``rust``
+     - 1.79.0
+     - 1.84.1
+   * - ``rust-cross-canadian``
+     - 1.79.0
+     - 1.84.1
+   * - ``rust-llvm``
+     - 1.79.0
+     - 1.84.1
+   * - ``screen``
+     - 4.9.1
+     - 5.0.0
+   * - ``seatd``
+     - 0.8.0
+     - 0.9.1
+   * - ``shaderc``
+     - 2024.1
+     - 2024.3
+   * - ``shadow``
+     - 4.16.0
+     - 4.17.3
+   * - ``socat``
+     - 1.8.0.0
+     - 1.8.0.3
+   * - ``spirv-headers``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``spirv-tools``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``sqlite3``
+     - 3.46.1
+     - 3.48.0
+   * - ``strace``
+     - 6.10
+     - 6.12
+   * - ``stress-ng``
+     - 0.18.02
+     - 0.18.11
+   * - ``subversion``
+     - 1.14.3
+     - 1.14.5
+   * - ``sudo``
+     - 1.9.15p5
+     - 1.9.16p2
+   * - ``swig``
+     - 4.2.1
+     - 4.3.0
+   * - ``sysklogd``
+     - 2.6.1
+     - 2.7.1
+   * - ``sysstat``
+     - 12.7.6
+     - 12.7.7
+   * - ``systemd``
+     - 256.5
+     - 257.4
+   * - ``systemd-boot``
+     - 256.5
+     - 257.4
+   * - ``systemd-boot-native``
+     - 256.5
+     - 257.4
+   * - ``systemd-systemctl-native``
+     - 1.0
+     - 257.4
+   * - ``systemtap``
+     - 5.1
+     - 5.2
+   * - ``systemtap-native``
+     - 5.1
+     - 5.2
+   * - ``sysvinit``
+     - 3.04
+     - 3.14
+   * - ``tcl``
+     - 8.6.14
+     - 9.0.1
+   * - ``texinfo``
+     - 7.1
+     - 7.2
+   * - ``tiff``
+     - 4.6.0
+     - 4.7.0
+   * - ``ttyrun``
+     - 2.34.0
+     - 2.37.0
+   * - ``u-boot``
+     - 2024.07
+     - 2025.01
+   * - ``u-boot-tools``
+     - 2024.07
+     - 2025.01
+   * - ``usbutils``
+     - 017
+     - 018
+   * - ``utfcpp``
+     - 4.0.5
+     - 4.0.6
+   * - ``util-linux``
+     - 2.40.2
+     - 2.40.4
+   * - ``util-linux-libuuid``
+     - 2.40.2
+     - 2.40.4
+   * - ``util-macros``
+     - 1.20.1
+     - 1.20.2
+   * - ``vala``
+     - 0.56.17
+     - 0.56.18
+   * - ``valgrind``
+     - 3.23.0
+     - 3.24.0
+   * - ``vim``
+     - 9.1.1043
+     - 9.1.1198
+   * - ``vim-tiny``
+     - 9.1.1043
+     - 9.1.1198
+   * - ``virglrenderer``
+     - 1.0.1
+     - 1.1.0
+   * - ``vte``
+     - 0.76.3
+     - 0.78.2
+   * - ``vulkan-headers``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``vulkan-loader``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``vulkan-samples``
+     - git (fdce530c0295…)
+     - git (8547ce1022a1…)
+   * - ``vulkan-tools``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``vulkan-utility-libraries``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``vulkan-validation-layers``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``vulkan-volk``
+     - 1.3.290.0
+     - 1.4.309.0
+   * - ``wayland-protocols``
+     - 1.37
+     - 1.41
+   * - ``webkitgtk``
+     - 2.44.3
+     - 2.48.0
+   * - ``weston``
+     - 13.0.3
+     - 14.0.1
+   * - ``wget``
+     - 1.24.5
+     - 1.25.0
+   * - ``wireless-regdb``
+     - 2024.10.07
+     - 2025.02.20
+   * - ``wpebackend-fdo``
+     - 1.14.2
+     - 1.16.0
+   * - ``xauth``
+     - 1.1.3
+     - 1.1.4
+   * - ``xcb-util-cursor``
+     - 0.1.4
+     - 0.1.5
+   * - ``xf86-input-evdev``
+     - 2.10.6
+     - 2.11.0
+   * - ``xf86-input-libinput``
+     - 1.4.0
+     - 1.5.0
+   * - ``xf86-input-synaptics``
+     - 1.9.2
+     - 1.10.0
+   * - ``xf86-video-fbdev``
+     - 0.5.0
+     - 0.5.1
+   * - ``xhost``
+     - 1.0.9
+     - 1.0.10
+   * - ``xinit``
+     - 1.4.2
+     - 1.4.4
+   * - ``xkeyboard-config``
+     - 2.42
+     - 2.44
+   * - ``xprop``
+     - 1.2.7
+     - 1.2.8
+   * - ``xrandr``
+     - 1.5.2
+     - 1.5.3
+   * - ``xtrans``
+     - 1.5.0
+     - 1.6.0
+   * - ``xxhash``
+     - 0.8.2
+     - 0.8.3
+   * - ``xz``
+     - 5.6.2
+     - 5.6.4
+   * - ``zstd``
+     - 1.5.6
+     - 1.5.
+       7
+
 Contributors to |yocto-ver|
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
 

-- 
2.47.0


