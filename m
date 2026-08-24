Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AE9C61DB9
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17070.1787579156905313435
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=U/ZeK5HJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 456761A17FC
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 140DC5FFC1;
	Mon, 24 Aug 2026 13:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0C6411C79594;
	Mon, 24 Aug 2026 15:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sNjqPkRk5UYVVc1WlHKa+469Z7d/d0Vez3sYB2JmOzE=;
	b=U/ZeK5HJ1e8Bz3PKR0Isn0AU5Di8JjPTIhqYVxTna/raH0a5BMGruX8mhlDQ9FdBZ6hvlH
	iD3ZuKiILoYiuNOaIwt2PL8pvaAK/1B/mOnTXBFF1avhCDIMcG2X9phrvUO6MDs6h9UDym
	Ag3tedi2nHXHzGDrFKvUJPQBg+l2skNQKNrjQ3UApAm+xtwplWVMV6Vdfkdm0KZ9G4eCNi
	O0wgqfMNHiQu5wksK12ivTyVzQNSSW4zv3kTLA6mNwUvSlbQWTR1SSGWjq6++iaB3bcL7Q
	LqLJFTo34XUqxiY7E+Oca/AJqqwsWj3NN0iWThyjx2cjeWKbklrGG0FMdX2n1g==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Joshua Watt <jpewhacker@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs][PATCH] variables: Update variable documentation for SPDX license expressions
Date: Mon, 24 Aug 2026 15:44:23 +0200
Message-ID: <178757686703.159281.17007503336342740434.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722184853.188733-1-JPEWhacker@gmail.com>
References: <20260722184853.188733-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10332

Applied, thanks!

[1/1] variables: Update variable documentation for SPDX license expressio=
ns
      commit: e7dbd06e942c18054e4530f5fa1f175853f07382

