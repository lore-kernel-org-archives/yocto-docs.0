Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1E1F8D745
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14653.1776347535446191235
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=bCBD/axT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 128464E42A1F
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE13860495;
	Thu, 16 Apr 2026 13:52:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 994B01046088C;
	Thu, 16 Apr 2026 15:52:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VwkzbD3tNE1w0x4y4bldgYciPWcrDQtTtPGBXx6Hdhw=;
	b=bCBD/axTIF5e51ULu5bRXNrgIsgB/l3a/bmk8hKOnxT/tnLvkrHB/9zN3QYB/3+vzgqWdi
	z5LUK7T3m9ptMMwJ3gZyaZaUnWnCD2lVSYBcH4nnQeb7HzB4JA7C5v5npCPGK0uBRVDZNX
	N3BvW05jQfqFwlhGuknr1WzQUfJDPa8brFly5iC1+RedkvOD/fUBmrHrJr+5aVYuQaqgC0
	X/hNxp7ptkjoW7y7QtyI8pRZsgydsm7yFzVglyaMstz/l7xGYCmIhAccWp0yHNr87c0x2d
	Ehsih3ERh9Q0fFH+4VVjB/JrqiOEmI9qxHr3Ndr3MAGDDZRC1glShTDd3P4W5A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 1/2] migration-guide: add release notes for 4.0.33 4.0.34
Date: Thu, 16 Apr 2026 15:51:10 +0200
Message-ID: <177634729823.75801.9817222012564548286.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402095811.60426-1-chee.yang.lee@intel.com>
References: <20260402095811.60426-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9269

Applied, thanks!

[1/2] migration-guide: add release notes for 4.0.33 4.0.34
      commit: c6bf2dafaa441273481c524b14b3867f86fc2714
[2/2] migration-guide: add release notes for 5.3.3
      commit: 560bc33c0c2ecd60d68ba06a2edff8c25b9a3f90

