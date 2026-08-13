Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C3C5C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17363.1786622561307305155
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Cr97ngGk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A5C204E411F2
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D366602B8
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6E3E11C4DE69;
	Thu, 13 Aug 2026 14:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X+arMqN0nItV6N/XTZpeCTn9XdRHkSX6PfJs4Sj8zKw=;
	b=Cr97ngGkVLKGFnWGrVSWH+sHpDa+cWj4MUIkNHS1tlJVfmL75h5cjCO17oSMpw+546wnX7
	WSS+6spA8qXAX0WJLXiVgQtb887r2KHzKY3dNqBdXeL4YGHvRb2U9ymxseEthl39wNHS5N
	1CV2Y0ROUVZAsh6Sfnd1a/E1BHcWUIIWDNahRShOqsChJ4gl3srP8xi8e2B8MNmYSECN+W
	3GsawYXkZ8yj6bMA4Zhp8o8wjpAiNexEdDwwFA3saZHQijSvdfQ+4zOCfd7zo6p+4xtpbK
	wBenm01l4mgpDKXXLnX3chJ/Lz86JKG6zX2lF9j4upoaQjU6HfERm2JofcMCxw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3] ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable
Date: Thu, 13 Aug 2026 14:01:40 +0200
Message-ID: <178662237160.775933.8028338246482446383.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812-qb-default-bios-v3-1-5e0706b72d9c@bootlin.com>
References: <20260812-qb-default-bios-v3-1-5e0706b72d9c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10281

Applied, thanks!

[1/1] ref-manual/variables.rst: document the QB_DEFAULT_BIOS variable
      commit: f2eef5268aa94b31e986e4eef4ce1fe0094b70c4

