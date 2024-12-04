Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412DEE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:44:53 +0000 (UTC)
Received: from bird.elm.relay.mailchannels.net (bird.elm.relay.mailchannels.net [23.83.212.17])
 by mx.groups.io with SMTP id smtpd.web11.10998.1733309092082623393
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:44:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=rGl4i/fw;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.17, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 99B251A36C6
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:44:51 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (100-122-114-61.trex-nlb.outbound.svc.cluster.local [100.122.114.61])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E34A91A298B
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:44:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733309091; a=rsa-sha256;
	cv=none;
	b=m3jsPTuO01iIU26u8BCny0POimG1ZgddTwZm1LU2g1Cx0W+uqxzqpDap4Mb6nV9FUJMxea
	56wVeCTugQmzoEk4Q0pc2ToDLiIU1mBWkUEUsuALTkv+ZbrAS9ZkdzILnr5p5RWEcZleUh
	G+QjhSMjc68iSFvvTknsQkc5rZ64yGY/gVbQuTiB1+BrhehTibbczW/5gZulx3hGgdfcs4
	r2lGc2aT6kDw21u9L5JtbERXrC0+9VYqSaUrr4ORAoH6RtZfUh3SrycoVemG4JgUTIIC05
	1/pmEcmAK3uvPHIQgBaQTQJt2K2dvk0XXmrfOp6jyGKBaSzRtF5f+8fbBGzp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733309091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=2mRSCbzMKYqBS2/xzUpQgihBT9p4B7aK+7mA69N6pwXBE4Vfna0FAF+JQ4Fn0FKCv4s4QI
	K0DaJnTtJeRjMTJgJnB1D84UYWADFt+XVfzv5+h876JdROsZ4QdcnMFlI+4uS9uN3m6sFq
	21enPRK2h7w3U8UOFyEraBtrHpjLJK1EncCMV54G3Bd8hQzEqJWBPQBYzEKCf4l9dEEReP
	AyO74I3iP5hVIQR8R3j6kfB8mbxWDCZaL5yTYEiP+zDARsJzAyFE2eYxn2RwU8MGzkV+Gv
	G/X9yG4UtkNRVIFla6oRgR57By3qz8KRzRMZ9qIjk28OGhW97nRW7rqx28gxRw==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-njkxj;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Army-Ruddy: 00c3538666bda0a1_1733309091466_2774032485
X-MC-Loop-Signature: 1733309091466:3192398247
X-MC-Ingress-Time: 1733309091466
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.114.61 (trex/7.0.2);
	Wed, 04 Dec 2024 10:44:51 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733309088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuYbANDKHrRWjlNKYjvsZ01FXTJgnd2oY5gTaqqSZLU=;
	b=rGl4i/fwfwLbtsjBa93pjAyg1XeiQUdkCRddirJ+bIOCesVj3kpq7dRLNnpvIhZOdicm4n
	dG2AUtV+vGVhz9yN2RObgzLOXA/b9yJ19Z4zl+u32vF615MH8ERPUaSRVtxKFN8pNUX7WV
	3SdqO+0BX6DZkr2iRyz9Cto2yqDnRpJW9P/E9zGsMYBqxrCmg+S7v+m4GP7kytlmEKMuTS
	8kXWoEkz/+CXY9/Y8xwxQMM0GLyEI+ndZQw6EkX+uSal4/uQMF0mfOP5Jbd9ablOm6fiQY
	GYeG6KgdeB+HnSrzd8SMChn0ARZlGanKJnluoukMSh7u26jjw3Y84hRIeSa7yA==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 1/3] dev-manual: fix styling of references to bmaptool
Message-ID: <20241204104432.2094236-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 10:44:48 +0000 (UTC)
X-CM-Envelope: MS4xfEwYeLb2eKUhU4aNYHKJ3RXbsETCJdraS/Rbna3Z9JvMBU8ZopmGK1EZ6J5OsAhhualwy4tqmQ0zje7WFyqiE7dVZ1Xjf3PsOy5BVviWq5FoJRIt1Kon w38cojzT3twEAVRkdvvnnEd1D6vGiZBGItVglugSDbix3luSge4nNLmtM9TSj4uXNpX+p94lLGsJORVUbP9K4aPchfnpqYuxnwAFetf3qvJddqksKoU/r6wD FuNRRWM6RO05vEX7k/0RxJo8qd2URKA0TXZv+x8VWJZ5psUFj0jdGIupSkG8dlGJXth2eN1H79MkZcqGiE16fSOIgrmLRjtqKF9CxeT8rSc=
X-CM-Analysis: v=2.4 cv=dOX0m/Zb c=1 sm=1 tr=0 ts=675032a0 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=lk4ATzALKvHUNUYlx5wA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5877

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

