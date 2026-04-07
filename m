Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD063FEEF36
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:38 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81041.1775567616992649905
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=msmPa/QK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 724254E42947
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42B09603C7;
	Tue,  7 Apr 2026 13:13:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBE891045020C;
	Tue,  7 Apr 2026 15:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567614; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IotAXnVPu2onV1vqTWHz5g/YuVLBFfVr+/doSvMC//4=;
	b=msmPa/QK8XCjeQWA1EwcBQJ6APZudjk650uReJKBoF/+kucvdLyOsn11qKJn7A3hrwFwbj
	nhDhOJBcZucPh49CfMpkpg4wXyUSWD2HM7InpNIJwwm71rqhAeP1ASlWKPEs/EwL391BHe
	JPSr7JxKW+AHuyJGYWxpTWr811V7jzbzT04cM9mZnIjVtKtdq7nWiFYgbDCo1+GIIeKLW+
	lsYtmH5mIaFBGpZJOfpqnO6hKr284j812V3d7iX2piU56JuAaSLwB+rqKWiIqoiDX2L0/A
	EJBo6nyiLynIieLY0khBYcjbesHX+P2dXNKGTDOMpT3b+QkVFGcFdMr35PvztQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Niko Mauno <niko.mauno@vaisala.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] recipe-style-guide: Drop obsolete EXTRA_QMAKEVARS_POST ref
Date: Tue,  7 Apr 2026 15:11:46 +0200
Message-ID: <177556742855.245356.3469121984108161696.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318160409.1767493-1-niko.mauno@vaisala.com>
References: <20260318160409.1767493-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9192

Applied, thanks!

[1/1] recipe-style-guide: Drop obsolete EXTRA_QMAKEVARS_POST ref
      commit: ca057a6b477b72698409d7b6c6ec49100f73d05d

