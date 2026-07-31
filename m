Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60821C55177
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2961.1785490625911496637
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=yB0WuZ2h;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 36A244E41050
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BF116039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6905F11C16616;
	Fri, 31 Jul 2026 11:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ak4xR5hNmZo5gVHnYKjcF6yuuBhgmG91V4DJeLhKWds=;
	b=yB0WuZ2hfNdj7WoThKm3GlaQd+NChEsQAsYLoEMJUmC52l2py6KjpQld+ygYnZYMc0cw3X
	2EwXEkQsVEQpfsaPGdcBTujJpTk/TAMxErHepfkwU8jfs84MMG73JEwFHybG3hXP0PJMFR
	ohWL3Zr/v/N73I+1dV5k3WFx9dTGnchip1UyrursSB1nboWgskdiD8TF2R6jJCtR3IWOzC
	4KGATzZGseJKfCwajdHWWnB+xVrXUOijozekFDOuN6zidkB/qC0OeA192m4HWQRI8xNKQB
	zbbcUCPK0FbLEJmnWv6YD3YwHbp7Q0zf+lLOgClvkmcxxmmJHyHUcgrJr2OzCw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] tools/gen-cve-release-notes: add argparse support
Date: Fri, 31 Jul 2026 11:36:18 +0200
Message-ID: <178548999946.2379643.18253480074744831272.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727-argparse-gen-cve-release-notes-v1-1-22e7ad7e9d06@bootlin.com>
References: <20260727-argparse-gen-cve-release-notes-v1-1-22e7ad7e9d06@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10216

Applied, thanks!

[1/1] tools/gen-cve-release-notes: add argparse support
      commit: 28814e69677619b7a01338560dd89f466601a92d

