Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAFCE77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 10:45:23 +0000 (UTC)
Received: from fly.ash.relay.mailchannels.net (fly.ash.relay.mailchannels.net [23.83.222.61])
 by mx.groups.io with SMTP id smtpd.web10.11129.1733309115019486320
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 02:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=gJyoKACB;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.61, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3BC0B2C4286
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:45:14 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-4.trex.outbound.svc.cluster.local [100.122.114.114])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7CD9A2C4BF3
	for <docs@lists.yoctoproject.org>; Wed,  4 Dec 2024 10:45:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1733309113; a=rsa-sha256;
	cv=none;
	b=B+J12OyDuXP/XexQfEv414wTKFOm257FwoNIL2hsjUb8DbkSzTA6UcFfNx88lcOfNODmzN
	nssTc6fR3w6uW1uqOY/5LhD6Ie24vQfa0yff5s+tEXd6cJzpRLiFJDbgxNhoTRwJ5TgUma
	2SWeYm+JWzD3Sd3RViLPma1Q+Zhzs+/Tmj8OLzjVCCVqsFpm3DjTI2gZuih6xT4gr4WONN
	ZjNZktpugbDBujrevKBfvFTYE8SX10iTsZ/r3tGEI03lqllgfFNJjLHb83O0p5i9+qRFso
	8R2LaBUrCA+WxQ6c8l9Pvbgfx8nVWeYtU81Zz/w8j9dOLiWdHmdPtLhpsbuYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1733309113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=DWBh/o7JwRzXE787Ccd4WPFFCi3kbF3CyzQerGOVQNk=;
	b=bS0wEZqT5Hey+A9839uezXxJxGRwPasoB+VdMzfOP9L8JTFcTB5hzsipV2yJXHVSeHx6BA
	tnnQJ1vYTOOiDRlK7+gZDgVWkIhFETLqYT+Xs9E7qrO+xZtkQKYLgNbc/6+yAnehiKXvfO
	JDReAaT+qEqrFGhzdPCoEfTZZorbiIolh5bGnJx+nYmHnqA8eu0aPEuG7GdRwHjoruFB6/
	Nf9NHnM/vTN6CY3Ev1ob1o4bowldcTuOCggu20YoLh3UGAEOkKFs64aU8LOFQ0NarXpx5j
	Dxd7zb8jbit94qdq1CtRV7CVgMS4fNjh8luFWtG2B3SmsGqzCZ79fJxmhZe26w==
ARC-Authentication-Results: i=1;
	rspamd-5d9d86ff64-mpgqg;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Duck-Gusty: 7b134a2e4a971549_1733309114061_2229850244
X-MC-Loop-Signature: 1733309114061:1094663191
X-MC-Ingress-Time: 1733309114061
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.114.114 (trex/7.0.2);
	Wed, 04 Dec 2024 10:45:14 +0000
From: michael.opdenacker@rootcommit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1733309092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWBh/o7JwRzXE787Ccd4WPFFCi3kbF3CyzQerGOVQNk=;
	b=gJyoKACBp7x95oxQMDjIXNc/wrTvpDxcDLyv75muBRJJp11fhDr+lxkuZggnN0vNu/RkXc
	j83IcNrRcOje3YNF1RoPOdwmn41ahg7kV0nTT0ktlPDeq0+tm/MDTeYSLMibwsiAWtCGnE
	IDHNLgUCCltV1SFVC6aluppcepQp3newjGT7jLG1QHC/qjJf7KzkMG1Qi13m7ryhZDOCBp
	5j80TEW/3o8H7rlYBCSWh10KQ1ZKcMhrFX2gFX6wISLrfq3ManhEXSiQleDeXRSsGl7+5Q
	ClaxLFPcU/tgSO9QGseHwvUhaB9uaZv6KFw+Wy0Rfz42E7FHMMw71HvGqvd0IA==
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v2 2/3] dev-manual/bmaptool.rst: correct command for bmaptool-native
Message-ID: <20241204104432.2094236-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
References: <20241204104432.2094236-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Wed, 04 Dec 2024 10:44:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=dOX0m/Zb c=1 sm=1 tr=0 ts=675032a4 a=3JjwsiTUxCxireyYQgRi/g==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=rJ4S2n_EE8Q4mpNx-akA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfO+Ssk4bHQDIVU/ucLhSUD8ZF1uxFeXgUXHGDPR7ysGlPJ+ZndDxfeaUlgHZVmG5P628MjcwpEa+a+7Z53p0JGcJjkIn4sFfYoZbHfBI8m31yyyzDnXM JxQmoGyucbo8D9e3iB+XU5KuoOJH7TlVUK5wgdrarCH+4rca/LKAr1J4ve5BTwFkZJHiDA6lPYp4oS/m8uCFfgc4YcREhQYup4H6LBwjU59L7oRzM3dfI3I4 L9i3Mn7XeR2KTNi+ueHYdZhxzLYgAs7gXEiIAcXJnTMldYxSq+6y1gE9iuMGkMAmK/cmFCO2wwWKfGtfRsXoAOSy4PbKGoP6/6jL/Latp+s=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 10:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5878

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Using only "bitbake bmaptool-native", running "oe-run-native bmaptool-nat=
ive bmaptool ..."
fails as follows:

Error: Have you run 'bitbake bmaptool-native -caddto_recipe_sysroot'?

Running the "bitbake bmaptool-native -caddto_recipe_sysroot" target
is actually sufficient.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/dev-manual/bmaptool.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/bmaptool.rst b/documentation/dev-ma=
nual/bmaptool.rst
index 493abf7607..37083c9c64 100644
--- a/documentation/dev-manual/bmaptool.rst
+++ b/documentation/dev-manual/bmaptool.rst
@@ -22,7 +22,7 @@ system image files much faster.
    -  If you are unable to install the ``bmap-tools`` package, you will
       need to build `bmaptool` before using it. Use the following comman=
d::
=20
-         $ bitbake bmaptool-native
+         $ bitbake bmaptool-native -caddto_recipe_sysroot
=20
 Following, is an example that shows how to flash a Wic image. Realize
 that while this example uses a Wic image, you can use `bmaptool` to flas=
h

