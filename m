Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40DAE7BD92
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:15:21 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17460.1771240513527684671
 for <docs@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 03:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=SosZvPCu;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3851C8C011A
	for <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:15:11 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (100-101-107-79.trex-nlb.outbound.svc.cluster.local [100.101.107.79])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 77F0D8C379F
	for <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1771240510;
	b=rilfIJYua2UyPTCsRJi1Pz2noGJuF6eEF9p/3aO3Q8ooJui5bNyHFp2MmUqXyyxjpXgKqd
	l4FeQSlSMQeUmChGk7quN8UtJTenqj84j4EVNgHkbICiquKJ7JobpgzA51VlcZec5yUHt3
	PacyEmwmzXXjMD9Y5/ua0lXLEcM+sYrROKGa7PfkwTOR54oLJUJk1hJFKBIjhQgmHj19x8
	0PgwuJhoVVGDHGb+4lT3QQUXOeU2VPFae/F9DE9Ou/6r28FuA5UXiMdA60HDsPqTW5xnxX
	EUHYYAeLwBAPzyj/yqucaaGlKFW9rf0to/S9bEfzjmta9qGDkRqRWDTio7wEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1771240510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=d14nCv8dGosPPGf56vS1QcDFHns5nqVg51GtpNyy7wY=;
	b=xWYoWcjIBWF0+dfFMUmDpBjSAMvYWsqs629eCQgB0vtOoZY4fxdHaJd/VW/ob3/mMbdRPg
	y3RyRMloQ8XfaXopUd2mat1jIdxnHUvPOhY8FE9ue7MetT8hoS+4P1Sp01CtTaMB8XBidJ
	14d16ruWib2W6MxNPUw7l3vYy4nU9NYVxpMp4Qsm0Yxu5d/9RjVjy8/g+Xhd7Vy9eqkVMc
	0X2ePn0zSNDvlK3fWzPXXHeKmVYU6L9YrLIZvEq/Xk8ya69BKMs35ewHAJSXqJtXO5IxKZ
	c6Q4Rdsur0YJvcf8v5n+5CC02kNP8eHOcyThpYvABP5VqLQ8JYQRC7tR5BjovA==
ARC-Authentication-Results: i=1;
	rspamd-845545c4df-mlcc9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Exultant-Glossy: 03c0c56e298d96e1_1771240511021_2713784229
X-MC-Loop-Signature: 1771240511021:176503956
X-MC-Ingress-Time: 1771240511021
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.101.107.79 (trex/7.1.3);
	Mon, 16 Feb 2026 11:15:11 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:88bb:7426:f742:ca3b])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4fF0YS3tv1z3xYS;
	Mon, 16 Feb 2026 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1771240508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d14nCv8dGosPPGf56vS1QcDFHns5nqVg51GtpNyy7wY=;
	b=SosZvPCumL+15977/pgj7DjrbO75mAh0BxfgyWlJYeSydyYj9lONXmfGNL6C6rqsjESUd/
	y+huPrgnnCBomQKH6pzPOCSOhZmA5mke7gxarkaoaxbBtN7AAr9Xxippanh2+p37IU2hpM
	T5CczpkH2T0PKl3K/mmp2vCb59SXThyVAR1+3IQyU3X+eHKT6Pbp9u/Bc7pIS9M057NQ+S
	dpDfJbQK79d9s2VPQr3MdcwiQLkN2LMmG+8UNN7difO9tdmNkVWbWl5jEzZ/QPCiJ8JTW6
	C4BZgs87du5jCYAKAFQUCK/9cpFrPXRTq093zaMAZrxwANio3idUKWNE51WzjQ==
From: michael.opdenacker@rootcommit.com
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH] ref-manual/classes.rst: fix broken links to U-Boot documentation
Message-ID: <20260216111502.1919905-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Date: Mon, 16 Feb 2026 11:15:08 +0000 (UTC)
X-CM-Envelope: MS4xfJM7JMs9sl3HAXt1ipN8Vi9YpmuAMuVN2815zobt/YAE0VEI7QTgVhN+DYPUdiOMxh7bkacPDGrgAzfHY5fnua45vclT/vp277Rf7tonJ333B+i5/jRi e3aQgThKnVKiUh2DZ/vfDHdOJF/oSjmlDvAyxFBy2jAtjKPTsqgf/UcIjGoZl3ZOpDPhHHgXzLJRW0csJG0NJKDFWb+GyQab5ZdKmCZidDdFeROuvK0UkrW4 NL2hjF9pBtQ6zfIW1sdzuTjxhBZ0DsnPSxPeM58OpKCxgxoQs4UxYN1Nx0wcXO9k7IaoRnPIipo8wE1ENJkUUQ==
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=6992fc3c a=6NaZJ6z84b9hhMsctVu9Qg==:617 a=xqWC_Br6kY4A:10 a=YfCOm-DyAAAA:8 a=XpE1AkgCAAAA:8 a=d70CFdQeAAAA:8 a=6qOJwBRp3pTs7iq6-4EA:9 a=0XyYxBCTqsMA:10 a=PXk_rZkl1wMA:10 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=dpZMgbseYPk84XhQl7oQ:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 16 Feb 2026 11:15:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8923

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

In the chapter describing the "uboot-sign" class

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 documentation/ref-manual/classes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index eb76c891691..dc131be9fb9 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -3468,9 +3468,9 @@ The variables used by this class are:
    to the ``loadables`` property of the configuration node.
=20
 See U-Boot's documentation for details about `verified boot
-<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/verif=
ied-boot.txt>`__
+<https://docs.u-boot.org/en/latest/usage/fit/verified-boot.html>`__
 and the `signature process
-<https://source.denx.de/u-boot/u-boot/-/blob/master/doc/uImage.FIT/signa=
ture.txt>`__.
+<https://docs.u-boot.org/en/latest/usage/fit/signature.html>`__.
=20
 See also the description of :ref:`ref-classes-kernel-fit-image` class, w=
hich this class
 imitates.

