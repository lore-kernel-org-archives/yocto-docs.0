Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6509DC44500
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:04:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87405.1782720283425549547
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=MjsB1xQM;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BE7134E40B50;
	Mon, 29 Jun 2026 08:04:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93FCB5FF96;
	Mon, 29 Jun 2026 08:04:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18114106F156E;
	Mon, 29 Jun 2026 10:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q+FWgXLHgmztICxBkhybXotb+RPBLvIbO3L3D07dnW4=;
	b=MjsB1xQM3OJBTH2ovmj8wEfunEiQLF+8CVJ1V1bJxULoCB9lmGAtDWq8TMt4IEngIU4+xr
	gvBT4Kt9VA9XWgQtNKBCvLUfe6KKi4BoBSqYYJ+q6MfXJyOxfXLBkLXYosUuhlGSKhpPOj
	ZwGL/mFVwmB+jxEmAPf/BVHHVcF/cJ8E2dzCoyajWejtnGpYUsnnhz42POQOfrLFkmcUve
	fJ8XO98k3Oi0pJFtS1LKgM8cH2DDEtP2TzATxoPgi6lXG4IPIdQ2JsdHgzrSdhw7vaixb/
	ypaK9gcroxN53vGZldYr8U3lo3BiG6zlDTgPXlswAN5iLaAfeuheNGcde5cksQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Quentin Schulz <foss+yocto@0leil.net>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] poky.yaml.in: bump min git version
Date: Mon, 29 Jun 2026 10:02:57 +0200
Message-ID: <178272012616.45179.1336327243256957842.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623-min-git-bump-v1-1-a634b0ec8a77@cherry.de>
References: <20260623-min-git-bump-v1-1-a634b0ec8a77@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:04:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9927

Applied, thanks!

[1/1] poky.yaml.in: bump min git version
      commit: 164e826dbc05015bdf8ab7aa834a3ae80ad8d703

