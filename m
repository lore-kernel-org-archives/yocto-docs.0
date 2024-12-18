Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB4AE77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 14:47:16 +0000 (UTC)
Received: from toucan.tulip.relay.mailchannels.net (toucan.tulip.relay.mailchannels.net [23.83.218.254])
 by mx.groups.io with SMTP id smtpd.web10.107013.1734533226821557282
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Dec 2024 06:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=Nby65/j6;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.254, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5CA6724E8A
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:06 +0000 (UTC)
Received: from nl-srv-smtpout3.hostinger.io (trex-2.trex.outbound.svc.cluster.local [100.98.196.143])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B538A23072
	for <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1734533226; a=rsa-sha256;
	cv=none;
	b=wx1How6MvjiENyff9JimVaxcMvsj7kLIyGbEe0yBd4HFQL1xc/ECI1GmtBv86Ioa0z9MhQ
	NgZK8XE8u5t+hnfJFlNfT/irLFunOta+36IzwjOE22X4K5YhzkhqmJUmZH5NyrMaJfyEI1
	F9RecsYHD+QiQ5pujlCwY0a/cJAE21FzZ2QHMsvD5xq67hj/rQIZQbmJEXMykYZsNC60kN
	E56sKv1kw44VOcv/GsXxVxkdLrCtNNuPRYpmdX0wSiW8jzjhLP5nPsK3ygnVieHmFSwPN6
	TrdhTnqFcUnj8T4GoV5vw2sEAZCPkYUagfzJewS4LunfwUfdn1WjYyycpG5Uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1734533226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=3HAWkifi4EJI7oRLPjU4/Ca4RgpGGJOb04fx5ctlIXQ=;
	b=np9NOnVtLY8DyjcSyAf6Qk0P1QHziy3myPbWFwrnssrbOiZOQZxjD00jDIfkfcvvBDO8PC
	/dTaAyaKZ30w13h8t6wVJotbWlUOcrdf10+zUr+dkwguHJL3hmjFtLQewQoMR7xigUjbdS
	GGanGZwYiuk+du55tgk0R4F2tmas13eCjIlWqFwp4lxf8XqeiZTruibWuhzW1guqjC3BLl
	4Q9k+bz+q8wqhvF5wuHedNPdbEfdA+mS308vpSeW/8zRZ9ht/fvqe68pBW8434Y9572iPQ
	ic/dKSshRp9oJaYhDzlQicNL+Ldnb4nebIxN1XNpfOW/VKtn4uJjmwpFPz6WWw==
ARC-Authentication-Results: i=1;
	rspamd-65b7488cc6-blkm4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Abiding-Tank: 68b4623247c2c831_1734533226251_720600406
X-MC-Loop-Signature: 1734533226251:1144832522
X-MC-Ingress-Time: 1734533226250
Received: from nl-srv-smtpout3.hostinger.io (nl-srv-smtpout3.hostinger.io
 [145.14.159.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.196.143 (trex/7.0.2);
	Wed, 18 Dec 2024 14:47:06 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1734533223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HAWkifi4EJI7oRLPjU4/Ca4RgpGGJOb04fx5ctlIXQ=;
	b=Nby65/j6ZgEwYRABPhd/CxFKU31FpXyDExA7HRlMYTWWn8s9Ckc/5seP2Z+YTjLKN5c1cA
	8TENoC+kgM4sDD9S5RwndKoYaWswID36Y8kjIQE5mDF3hDk4KLHqzKBk33zvebDZ1LSNWq
	p0G8ER5H8Wn4H/qyL1IMjFn2flQzgv+oylbfCgu/dZawNPK85jX+AbT3Wvzr8fDeLkv9/8
	2CfCi5qD0ZPpyEeXXK3Fmner6O9a4siPeWXldALI3u1OhCgA0k28gQXdjP7PS8Kx7YOGnw
	5eHlaF8vp3eygEQm6yshxK23oh3hCyxUaQe2Lyj/ViyESEWknfZ7jRJPnJWxyA==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 3/3] dev-manual/bmaptool.rst: simplify and fix instructions
Message-ID: <20241218144654.852310-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
References: <20241218144654.852310-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 14:47:03 +0000 (UTC)
X-CM-Envelope: MS4xfMaOopHY+eU93ETr52ShORJtGIa/zztxon7w+j9sZPbyREPsMt8KkrmuXwVANgNjS7wg3oa60CmztZRUu8P32AyS19wSkLEwTANi8rDH+jacxtVF03hH cZahlJw1rTsAjhcC3IADel79DKcpgZq6ZSL6TbhjIC6JDQo4GIP0taeLGMYKMKWJyjfz+hOwGPFcepTukH0D6n4LN2ivB2ITuaCugRZIB9xET+rKpz8tPp29 bRaQ7VSakZewlUPW4yMx8S9OTrVtbJ4MzrXyhf+Q+nTjlFHXO3389u3iJ/7vegwIbPjZ/t5M/KEvmB30KTS8XQ==
X-CM-Analysis: v=2.4 cv=c/P5Qg9l c=1 sm=1 tr=0 ts=6762e067 a=gK8Kn/iQ+cr19mtFy27wxg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=K0np5UDMr5CNkJvIeKUA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 18 Dec 2024 14:47:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5980

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

- Remove duplicate instructions

- Detail how to run bmaptool directly if you installed it on your host
  instead of building it through the ``bmaptool-native`` recipe,
  as running "oe-run-native bmaptool-native bmaptool ..." won't work
  in this case.

- Use "chmod a+w" instead of "chmod 666", better advice,
  and only run "chmod" in the option that runs "oe-run-native"

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 37083c9c64..87162a49c9 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -43,14 +43,13 @@ any type of image. Use these steps to flash an image =
using `bmaptool`:
    depending on your particular setup. The following commands assume the
    image resides in the :term:`Build Directory`'s ``deploy/images/`` are=
a:
=20
-   -  If you have write access to the media, use this command form::
+   -  If you installed the package for `bmaptool`, you can directly run:=
:
=20
-         $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
+         $ sudo bmaptool copy build-directory/tmp/deploy/images/machine/=
image.wic /dev/sdX
=20
-   -  If you do not have write access to the media, set your permissions
-      first and then use the same command form::
+   -  Otherwise, if you built `bmaptool` with BitBake, run::
=20
-         $ sudo chmod 666 /dev/sdX
+         $ sudo chmod a+w /dev/sdX       # get write access to the media=
, needed only once after booting
          $ oe-run-native bmaptool-native bmaptool copy build-directory/t=
mp/deploy/images/machine/image.wic /dev/sdX
=20
 For help on the ``bmaptool`` command, use the following command::

