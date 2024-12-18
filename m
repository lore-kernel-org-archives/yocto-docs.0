Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283C4E7718B
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:06 +0000 (UTC)
Received: from cheetah.ash.relay.mailchannels.net (cheetah.ash.relay.mailchannels.net [23.83.222.34])
 by mx.groups.io with SMTP id smtpd.web10.107010.1734533224608264009
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:47:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=f7hM9vIM;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.34, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C4B7D4E3775
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:03 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (trex-5.trex.outbound.svc.cluster.local [100.106.32.31])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 291814E3781
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:03 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1734533223; a=rsa-sha256;
	cv=none;
	b=aInuLfKA6TrDZtnDcbMPq4TcNEewjpnSlwSdBMZ1wbOcTWu1kennI5rTbP7vrGtSn7E9XH
	boZPMFqJKm5jNx8xBn4cVzknQtZFZnvNE8MLJ1Mxay76XhgkbfJNYujoZKkgOdTz0tHqcc
	Cb9J39/CHZQuIphUlzzw5PRGHEq0PeYe+hhCPwyAN8S9GacEweE0PLk6WYbuNozhPwjfnK
	bgLO7b+gOUsXJbTRmxQBCxrix1w9Sf0RNsh/JH3RtFx6Di/a/5lNAYNWowI+rUlb+ZmPEG
	aIncjeI8chKDIDjlNYVExTi9fnlTwwExxbHAUbzf/1XnB1pt9Vv5Orq+drW4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1734533223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=CUsqylXtdj2bH7R5mx1qlKecERrMBkgbCt7Mj3yUV8aS28vT8bsBQJTe0M8wUrD5pJr8BX
	RBzO46/hm08fBkk5KSG7C3lQPrat0BhqjVETzLcQwqXwU+xtlBh4FqrKNx0BGzKwDFUNAr
	R74YArI00iMigZy6iV69CcQL6dIej6Sokw1aT8McSKPC7664PCWFQeexSVABwd3qryCh3M
	TQ/jeXnwix3AcT7OPZ9J/GuQwSkrLBjJlnXx5jIrw+irUjwmRZUNYZmdn5mOELarxiOm+L
	OCLTYE7XBzNfegO8w7pc68gYWMTEqT/S3JbJgmdNpXmO6baK/lsqP8rgAfbrZw==
ARC-Authentication-Results: i=1;
	rspamd-65b7488cc6-w8n9b;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Fearful-Quick: 58de20731df41b5b_1734533223678_1107655055
X-MC-Loop-Signature: 1734533223678:2589807859
X-MC-Ingress-Time: 1734533223677
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.106.32.31 (trex/7.0.2);
	Wed, 18 Dec 2024 14:47:03 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1734533221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=f7hM9vIMF3ozSVol+8ws/X6NVz6jJZ3Ztfif9SBsV9uGF2C9RIROWMPLa8z2vfxpb4LUWC
	Ls37XQjJlxnZsOgwpHpZ/SycXN3jrDGwkz2TCZGPFAK/0Cvm9C8yCYtj7zxUoyynvtXyC0
	EV7pA5FyrycimxOPOWwtM5OMApnGc/NqccQBzMTS+FvJhrxg0h/unsMORWVuLuPIih2Fgr
	54FN65iMwqyVZIQQnbAK0WLdB+h2whykOyxvDdL2oevIHiWH2LEe9n/cjf26cnoPrzfKfY
	b2R61u5uXgdy6rEGPG82XL8dgLmpMBbABeSjEu8D4XAG3pAmhfCmOQ0eBi4SLg==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 1/3] dev-manual: fix styling of references to bmaptool
Message-ID: <20241218144654.852310-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
References: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 14:47:00 +0000 (UTC)
X-CM-Envelope: MS4xfKYLYXCYaLoXnbTaRIR15kLikeyoQvED5b8GHr5msp7m2LXR74AFL4cg4pJgqWSoysJggw/0may7JuV6vzyPMKIMirHWedGNYYIiVP1xgzNi5LW2uj5p Ycb3bSxXjypjhsL8d5kjU+JC2Mc9GMI/uPL+32qgSS7mIus3eBT4MU+jNq31rwyJOX4o/ZWBx5mQOhO8ssLF2dJBzjBs+PLgDhBFotgByXE9LOeZw1cNMqDz g+4aQpfkkcd0n/YMW6X/SczCCLpijIRbdUbbHaTKmpKFiAFlS83rm33Yam6M+WIBuRI/v/wouuwMN8vdzME9Iw==
X-CM-Analysis: v=2.4 cv=c/P5Qg9l c=1 sm=1 tr=0 ts=6762e065 a=gK8Kn/iQ+cr19mtFy27wxg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=lk4ATzALKvHUNUYlx5wA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5978

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

To follow the styling conventions when we are
refering to the name of a tool instead of the command itself
(documentation/standards.md).

This also improves the HTML rendering of the bmaptools subsection.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 18 +++++++++---------
 documentation/dev-manual/wic.rst      |  4 ++--
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index f6f0e6afaf..493abf7607 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -1,13 +1,13 @@
 .. SPDX-License-Identifier: CC-BY-SA-2.0-UK
=20
-Flashing Images Using ``bmaptool``
-**********************************
+Flashing Images Using `bmaptool`
+********************************
=20
 A fast and easy way to flash an image to a bootable device is to use
-bmaptool, which is integrated into the OpenEmbedded build system.
-bmaptool is a generic tool that creates a file's block map (bmap) and
+`bmaptool`, which is integrated into the OpenEmbedded build system.
+`bmaptool` is a generic tool that creates a file's block map (bmap) and
 then uses that map to copy the file. As compared to traditional tools
-such as dd or cp, bmaptool can copy (or flash) large files like raw
+such as `dd` or `cp`, `bmaptool` can copy (or flash) large files like ra=
w
 system image files much faster.
=20
 .. note::
@@ -20,13 +20,13 @@ system image files much faster.
          $ sudo apt install bmap-tools
=20
    -  If you are unable to install the ``bmap-tools`` package, you will
-      need to build bmaptool before using it. Use the following command:=
:
+      need to build `bmaptool` before using it. Use the following comman=
d::
=20
          $ bitbake bmaptool-native
=20
 Following, is an example that shows how to flash a Wic image. Realize
-that while this example uses a Wic image, you can use bmaptool to flash
-any type of image. Use these steps to flash an image using bmaptool:
+that while this example uses a Wic image, you can use `bmaptool` to flas=
h
+any type of image. Use these steps to flash an image using `bmaptool`:
=20
 #. *Update your local.conf File:* You need to have the following set
    in your ``local.conf`` file before building your image::
@@ -39,7 +39,7 @@ any type of image. Use these steps to flash an image us=
ing bmaptool:
=20
       $ bitbake image
=20
-#. *Flash the Device:* Flash the device with the image by using bmaptool
+#. *Flash the Device:* Flash the device with the image by using `bmaptoo=
l`
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
=20
diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manual/=
wic.rst
index a3880f3a1c..fced0e170c 100644
--- a/documentation/dev-manual/wic.rst
+++ b/documentation/dev-manual/wic.rst
@@ -513,7 +513,7 @@ or ::
=20
    For more information on how to use the ``bmaptool``
    to flash a device with an image, see the
-   ":ref:`dev-manual/bmaptool:flashing images using \`\`bmaptool\`\``"
+   ":ref:`dev-manual/bmaptool:flashing images using \`bmaptool\``"
    section.
=20
 Using a Modified Kickstart File
@@ -721,7 +721,7 @@ the existing kernel, and then inserts a new kernel:
=20
    Once the new kernel is added back into the image, you can use the
    ``dd`` command or :ref:`bmaptool
-   <dev-manual/bmaptool:flashing images using \`\`bmaptool\`\`>`
+   <dev-manual/bmaptool:flashing images using \`bmaptool\`>` commands
    to flash your wic image onto an SD card or USB stick and test your
    target.
=20

