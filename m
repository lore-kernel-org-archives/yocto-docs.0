Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B519E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:45:23 +0000 (UTC)
Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
 by mx.groups.io with SMTP id smtpd.web10.11130.1733309116790916046
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=ftQzUfL4;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.167, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 436D18A3C07
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:45:16 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-11.trex.outbound.svc.cluster.local [100.122.94.224])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7CB248A3C8C
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:45:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733309115; a=rsa-sha256;
	cv=none;
	b=Fer2I9qPZLCh3+497lYgtviFx8ZE3ac9CIX7Bn8zdC0dG2ZzIIS7U4eBE7ZeGkQdE2niCU
	ZgZ54Jd6P48NMrwq5wOsFh4o2CmNKl4KsYAKkOE8AUi3oLrczHPQVDV5JrYlM9x+SgVJh3
	95Lt6Bq3JBUBk5kiFz4OZvOjn4Uw4RqJzNNBX/n0atWIHMxwPPHIoz1H/iK0+aAuHYU41k
	ii50K2GL4Xazkf/G7Q8UezcMXc+t5fDHXgMgNgtPg85DNSy7P1U2ur9mj17M2VSkD4t/q4
	YguqEANcbtx690TfWBixrYAUunwjXDztVfrO4Yojj6g3i5RAhVhXZLASTHKS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733309115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=bZZvhwhvfDzQ7p2VXk7mQlF1QcxVbR6RN29pcbzKdZE=;
	b=A9FRXTAGGkrP6EAC/Cu4X12m88wcMw1G09CBObGmwzBVlH5n713hW2f9zkDz2qUb3E6ZEl
	3MweD8LKAuL16mXMfizFGN0PYKgCDBolRvXo2l+r07OyicTFXwBOSEttYJUCEOdl19G1Et
	oRSQXiWEPK6JdPkMLyTb+CxcY7hhPN2OMTB5Yh7t+WrCScmh66qDcBvWAHs0OfQFJo/5cb
	XjCgbdYq4+TfFbfSfsVZ4j9bx1/Dg2lDyVN9Ko4r6ww+d7p0pMAb8S+Lh5IZDJBQQrYCqK
	UvJBrkzTAGbcrtv4K3UGLVRuDgL4NlLV53XgMAVGOYTgldF5l87CGcZj7vpEVg==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-qcw6v;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Minister-Squirrel: 58ec386836e8147c_1733309116047_245046235
X-MC-Loop-Signature: 1733309116047:802047336
X-MC-Ingress-Time: 1733309116047
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.94.224 (trex/7.0.2);
	Wed, 04 Dec 2024 10:45:16 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733309096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZZvhwhvfDzQ7p2VXk7mQlF1QcxVbR6RN29pcbzKdZE=;
	b=ftQzUfL45PND6QGaSCJH9rt41mp7vzxvJ0Rm37v51EPS1WGyl9ZEfKAze6Gwe5Zot2sJUD
	N+fEfr6MbbENwsugygoIuTJkp1FBk5na+MyLaQWen1aFrAM0BHqDODG+Vp/9XhhyZO6dyB
	7nnSMQ0R6/NaY5w5YILyFeVQLGu8KMtOaJFEs0Qj85CBsPpROj64wbmaH1GgliOfAFJpAM
	3V0mNLc91kQ/4OY6ZjSK7k9qNLPkq1QUTUOApnxTebD8t5bTrr4RkKm7tk+L/r0uUfxisn
	Pw1kB1rDnngqWEuIKPWv9EDQF/fA85T1GWRKcRa91aPWp2IutYXo0hlwCcSAfQ==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 3/3] dev-manual/bmaptool.rst: simplify and fix instructions
Message-ID: <20241204104432.2094236-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 10:44:56 +0000 (UTC)
X-CM-Envelope: MS4xfNabmKnaCRPmv4rq/tOjbWwfpJOud8kn6DCiuEgJU/ZVel2spMsRjTUhVhXeebFZaX8zVpx0ZJaEsmQKArynhOQLwqqS5mOV1Sf6CfY3ggi/TZV94SMa NMKuTkn31ubpDo9vF8hnnOMliwd037GBhDgCw+TnT8iUivjsmDbucAtcS07xbkFN7S58PBl5tLp8Sgbx7589jeLyXjJbeOrONo5RtgD30vLE+YenC8N120wu 1cW7GBPz3Fgtb10x0+snKFRey4Z9PcsfrjziibRW0e4wwvUODmbOidwtzZ9xHioKkPrEFr5b0wVa2YgPOrV3QWlhqzwlEoMpcSJbpHaL9sg=
X-CM-Analysis: v=2.4 cv=dOX0m/Zb c=1 sm=1 tr=0 ts=675032a8 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=K0np5UDMr5CNkJvIeKUA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5879

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

- Remove duplicate instructions

- Detail how to run bmaptool directly if you installed it on your host
  instead of building it through the ``bmaptool-native`` recipe,
  as running "oe-run-native bmaptool-native bmaptool ..." won't work
  in this case.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 37083c9c64..93c8d3a45e 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -43,14 +43,16 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
=20
-   -  If you have write access to the media, use this command form::
+   -  If needed, set permissions to get write access to the media::
=20
-         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
+         $ sudo chmod 666 /dev/sdX
=20
-   -  If you do not have write access to the media, set your permissions
-      first and then use the same command form::
+   -  If you installed the package for `bmaptool`, you can directly run:=
:
+
+         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
+
+   -  Otherwise, if you built `bmaptool` with BitBake, run::
=20
-         $ sudo chmod 666 /dev/sdX
          $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
=20
 For help on the ``bmaptool`` command, use the following command::

