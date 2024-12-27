Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FB7E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 14:03:01 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.12891.1735308175962054092
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Dec 2024 06:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZligDzeF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EAD05E0003;
	Fri, 27 Dec 2024 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735308174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bYSU1pIUQO5joxhP9JtukoPPkdiCwZceRXLkCD7kv+4=;
	b=ZligDzeFyMIipoaPUP02bpMxeoNAG3zmXjFPlWl8auFrCZsEmUbEo/qTjRZCwmlKZxqZMG
	ccERaR+bp9sLJLdrzGT71939HlMcjKmx+MsjjmVbTyzmpckRcN0EP/56JgyNJv2ApI3cN5
	VdvivC2gxGaTQk50pKrMKWkk6YVmeWw/NJBy4mVRusd3ACRh4+9IZbarSpfTCTdQCH3i5F
	I7i6dBSUoS79Htwv/pBXsuRRMT6Y31Q+rfOhyH7WltEsaiisPBhhu5n+tn8XY8ddVh3C1t
	h9DnN/nu/gJFYZBy3ML6hnh71CZ/W0sUXK3KImpCPYP+Hoe0frN2MY6YScc3Lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Dec 2024 15:02:53 +0100
Message-Id: <D6MJEPMXOVAW.2A59CDTVRHM14@bootlin.com>
Subject: [styhead] Pull request
Cc: <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Dec 2024 14:03:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6046

The following changes since commit 8e6b07ffcc3aacee2244e064e09c27418017e414=
:

  dev-manual/bmaptool.rst: simplify and fix instructions (2024-12-20 09:24:=
18 +0100)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs styhead-next

for you to fetch changes up to 0c1ca2bd6de4cf98a91fbbec9524e08682739487:

  reproducible-builds.rst: show how to build a single package (2024-12-27 1=
4:22:30 +0100)

----------------------------------------------------------------
Trevor Gamblin (1):
      reproducible-builds.rst: show how to build a single package

 documentation/test-manual/reproducible-builds.rst | 22 +++++++++++++++----=
---
 1 file changed, 15 insertions(+), 7 deletions(-)

