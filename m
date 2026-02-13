Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989CDEF48FA
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67937.1770973648861243656
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=iq0Y6sXb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 543F64E40D33;
	Fri, 13 Feb 2026 09:07:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26348606CC;
	Fri, 13 Feb 2026 09:07:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC44E10368E26;
	Fri, 13 Feb 2026 10:07:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973646; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DvXNeFAZ608L5VmAxDn0sYpsyGKdm9isKzb8IuZowxU=;
	b=iq0Y6sXbTR2nyDUc/Iwj1guy2HI5PLRR54ElwtziJQb7oWdMoMYaCsmXUYdatRv/lvlSqv
	fU8M9BQNlTI1wgWzLeWKz4Rn9PcRqlywXnhN/i4buikVj0R7BSGjjbQBu3ptmycEGzJlVc
	5W8SoozOKFIvJHNX6LuQSof6NzSkTHuyDNJO3GJa38a7B4VtsfB4huRS9JO7s7LpQm9Igs
	Anx1HZx8hUQnrzfgqjh/op6hAvNDyZ41rcROpEq5TtSkYiaCDjnwVlJTV4tb81IK8mEUv1
	bTbVfoO6ZRqeBReVKPKjMzag1b0HsNWknm5iUieROVKwp8cNOrP2yNSZz1bX2g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Robert Berger <pokylinux@reliableembeddedsystems.com>
Subject: Re: [PATCH v2 0/3] dev-manual/packages.rst: pr server fixes
Date: Fri, 13 Feb 2026 10:06:50 +0100
Message-ID: <177097354649.48715.1969146403603353364.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
References: <20260127-pr-server-increment-details-v2-0-b46f91df002b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8911

Applied, thanks!

[1/3] dev-manual/packages.rst: pr server: fix and explain why r0.X increm=
ents on SRCREV change
      commit: 09f0430bc69024b9854c31ba6783ddd807aa4f19
[2/3] dev-manual/packages.rst: rename r0.0 to r0 when PR server is not en=
abled
      commit: 7a0324b6a10e64ee250945747db10ca88040b1ce
[3/3] dev-manual/packages.rst: fix example recipe version
      commit: 411122812ced4ec32127a823896a73aacf6eb97c

