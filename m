Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D3EC44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87420.1782720315909349878
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=zVzXFW4A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DBE54E40B58;
	Mon, 29 Jun 2026 08:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12F525FF96;
	Mon, 29 Jun 2026 08:05:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FE1D106F157C;
	Mon, 29 Jun 2026 10:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720313; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0+oGtLHBNRpjApKd/CeNENfXvkOwaH++1UAlXN7Ib6k=;
	b=zVzXFW4AwwskjtXCcuPKg7wJfaQ42Do10BJXDPZRrSwz0J18Jb3u0XSZFauC52JNUzpO8v
	0Q9pYWdw/N89GePUqktjheTtXQfIKDq7MMroniuabWlRczlyaMXQs6dY+Y239GKXjcdoVL
	TNm51zDFJPuHKKfT9Msz0Uyo/XYdSxosVQxBoOyionU/H9+kFP7lMJ7OJz3kFPGkI4ody/
	VRFKReTR9Blv7v0TPSLRSSjr6lPI75GYJPPgkL1YvvcEm3cKkFocnzSTW6+iryiPaH8hZ5
	8/NA1GzxOKvPvsg6W5oDS3rKF+MK5Mpu6aMeMTcM4GOHK+g/tqxi4KJkWiW4Ow==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] security-manual: some grammar and wording fixes in intro
Date: Mon, 29 Jun 2026 10:03:19 +0200
Message-ID: <178272012495.45179.14556744488500079794.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca>
References: <6f15263e-56f3-fe32-ea3c-c81d89f34d05@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9949

Applied, thanks!

[1/1] security-manual: some grammar and wording fixes in intro
      commit: cedbd00bb9a9309019bb5d65ef0c3f185767278a

