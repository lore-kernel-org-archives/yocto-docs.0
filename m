Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C9BCD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73960.1780990117159702070
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=ihhOxieb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7B56D4E42C6E
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5059F5FFC1;
	Tue,  9 Jun 2026 07:28:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 554CD106A2AC3;
	Tue,  9 Jun 2026 09:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ejg8jftSuhyqGfLJz2UjT85yNoVDpLFTG7LHmHtT7kg=;
	b=ihhOxiebojuNqD/S1wKk59X2hxvwxKMcNOqFGMYDK5W/9NC0dIRP/gIoKspck664xjRuNM
	I61t1Um09bJZ6X4RWOUNcdYzqrkjkZowuNrQc42RvFFraK9LbwZ77LdPEly/ZI4X1vqUXY
	P/9XiWIysC0xbE4KE2J6grJS+oVGO8xTb+hO9XTVjr/pHOOv0QvJl3vqkcZoIOviz/6cRn
	Dh91sB5MUcV7O6dzacTJzG2/eMxsr25eTw9gqptHUuh9rIDb42bCnWNQYilR6MGnkeg3kr
	/wVE7bzft5pFK3Ga8ioP9C0n3nRZpDl5MDb/gzvQOGG5CgKQL4mzLnpF3FUIjg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Peter Marko <peter.marko@siemens.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: remove semicolons for rootfs commands
Date: Tue,  9 Jun 2026 09:27:04 +0200
Message-ID: <178099000181.200930.12847858778435955296.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605120823.130634-1-peter.marko@siemens.com>
References: <20260605120823.130634-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9639

Applied, thanks!

[1/1] dev-manual: remove semicolons for rootfs commands
      commit: fa0b3fc4218e75b88b7811a3f2bfefdb0ca6496e

