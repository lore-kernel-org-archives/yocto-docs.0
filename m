Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452F1C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87427.1782720332425914990
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=sxC2WtcY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C72A21A0CF0;
	Mon, 29 Jun 2026 08:05:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96C005FF96;
	Mon, 29 Jun 2026 08:05:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7C6F106F1581;
	Mon, 29 Jun 2026 10:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720330; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p3JozeviqnuzTPsvkVROqNemzzxJyW4MDdBFtOyOZfA=;
	b=sxC2WtcYYrH64LXQ3HMoEVINMhsOgl5vMPlXzs4DcK03BcIvLpMBsjQvfOVXAQh7ehm29+
	xs9d/E/CYYEQar2QdVOsbIuSnTH0gSP68RX/nYaw4ct7j0aKmfl3Bg9ELnQFvYlIBhCrtv
	vL467UJnXQleITIqeSnGxVZ1/h+HohAnpJJqbdpKf/Zed15C7lCllNpzExmlBB+qqscuPL
	8F1mGubF2WV3GjIl8CX7w+Ih4gvJ7U4qcZuN8qDz1FjdiXN+ikxYcHUcRafcPxlVHxdRO3
	bQA3K+QT1J/JVKsk05IpGxvfFgt68q9q4A/JkMQvydxgnHOeaemwvpE8ItuFqw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	uvv.mail@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guide: Fix migration scripts
Date: Mon, 29 Jun 2026 10:03:32 +0200
Message-ID: <178272012436.45179.18087666424262949159.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611073236.879823-1-uvv.mail@gmail.com>
References: <20260611073236.879823-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9962

Applied, thanks!

[1/1] migration-guide: Fix migration scripts
      commit: 342abd6328b755417a41e76b57ebe44c6e47a498

