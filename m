Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6729DD4977C
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 17:38:13 +0000 (UTC)
Received: from buffalo.birch.relay.mailchannels.net (buffalo.birch.relay.mailchannels.net [23.83.209.24])
 by mx.groups.io with SMTP id smtpd.web11.156374.1733074690737535727
 for <docs@lists.yoctoproject.org>;
 Sun, 01 Dec 2024 09:38:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=EJ6UCSte;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.24, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E61072C128A
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:09 +0000 (UTC)
Received: from fr-int-smtpout2.hostinger.io (100-121-72-110.trex-nlb.outbound.svc.cluster.local [100.121.72.110])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 14BCE2C25CF
	for <docs@lists.yoctoproject.org>; Sun,  1 Dec 2024 17:38:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733074689; a=rsa-sha256;
	cv=none;
	b=Ib4Fu6d1Z3CNExSh4YKnq2OO7CRpcqkp8EB1Y1DyEPXi808URVMHiiiy1i4DwH5vNrT1H3
	83kq63qZj/LIdPR3O7Oot7VOME3cD7h6SlUnbQGCa8ExzfvRruxmL4YGJdsSitLncVxUFg
	4nNGCgVzK4oAYJItPspfv713tkmM3AKKNpnMWhuf8JH7pzWbOccO3tDHM7jmASeE31JYhU
	b+DJk8qJeXNvtYenVgGECDXw/5WsZ93whFY55SnU/UEfPKge35HjgmfKqstRjALTi9AT4S
	ncIvkMow+ElNqecJNFcjO+Noz8jQmDCu5TtNg+7CJRN9Dux3eAnDMooVeily/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733074689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=+RNJ5VDexsjvec3dakn1p1/R1b3mPAJJnBxE0+hdR3TYaqU+ZA9vWWIGv6f01hXWQ6fmne
	a219L8SFCjQrbZFtQ0/HkFMVyreP3xknvMZWdNFzueZ6uEPDUcGXMeWpSJ6A6XbZCkGeMW
	eaINWsrEbihrTaQJGRea5a/vd+xlqIVTD2cgYmWp7KEIS/HedQLQt9jGOcTmpARJwk7R/E
	UFe6kh3CHLEPjxpCgk6qQuvJSY+wbc8qLhMLJqvS6Kc8USpuIStRJkGM9TDaoV9AIgJ2p5
	j5R0c9DYqEJBsOKieFkBJAz8KabESis91bKVwUlSKP+Ylxy5WkcOY66BGhRDvg==
ARC-Authentication-Results: i=1;
	rspamd-fc7fd4597-nz5rb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Celery-Abortive: 66f9808d78ba4725_1733074689585_1731694822
X-MC-Loop-Signature: 1733074689585:4162474094
X-MC-Ingress-Time: 1733074689585
Received: from fr-int-smtpout2.hostinger.io (fr-int-smtpout2.hostinger.io
 [89.116.146.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.72.110 (trex/7.0.2);
	Sun, 01 Dec 2024 17:38:09 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733074687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=EJ6UCSteKm9u2mvZ7P6dw4+sk+TOQPGBqaFMOt+D6t78GIpu2E7GXpmmedWWLjGqmJp3v9
	gZx5MUSI9LwEQ0ENS7P03EjUxm0vAVAMgo6Vlv4+MDuV/L5ODbZr1czpBIfeqyeIFY6OyL
	sDCD+Zve3U7ry4g7YlKjxhvK+gUxZNISg1ecZp3X4N+w6Nhin+0T7xpeI+JnEkU+GCR8JS
	K89itgsK9Q/K1rtutd0JL3XY8Dtf+r0aZgU+EeR3R/rdC7fZGf4Gvz7MCyZszEvT3XWwjL
	eI303uJCBtNPGCTVdKedOSm7pExI6iXYJ70MXlCUU+HSZswf5WjpnBk5uwBK0Q==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 1/3] dev-manual: fix styling of references to bmaptool
Message-ID: <20241201173801.3290796-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 17:38:06 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=HfJGTTE8 c=1 sm=1 tr=0 ts=674c9eff a=uS5QZ7/yp/8NfNiMt4lERQ==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=lk4ATzALKvHUNUYlx5wA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfJ1Yw0wIcjQCVYc8hbkB6G2riM/ATufLTJDYf5ppqBTJWW6nnBQpcrYFYGoFq5tTtp3V5VEn+g3T1c3xEfRQ+xw9rDq49Xw5jvHM+BgcIZQ/Eqeh2XX0 z/pWUn1N9Pripspv5Ue/RF5hRPKjyaxJPBbtZGi9t820+YQa4m2TG9r0jrYgyn0Ja9TS1VtBHtQDQbAAz0ZScwCRL1JfloNwWlzM6LH/eFW5k9nXpYAsIjHn 8vQpRi7qsSp2M1dmIOmmZqL/ZBTP5ddRPfyP9FPSULe+dDiAquM9rn5SuGTXwkqcLtMEQ4K1oc+UpScZWau/PA==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 01 Dec 2024 17:38:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5858

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

