Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB59C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:13:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8698.1784193178825362357
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Jul 2026 02:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=Lo8F2o7w;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 30BE41A1027
	for <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:12:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 065B0602B8;
	Thu, 16 Jul 2026 09:12:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74A6411BD2EBE;
	Thu, 16 Jul 2026 11:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TEZTawgrI/75MKEFd+D3p5KolMWXGsO1dBI9LCVWkiI=;
	b=Lo8F2o7weD6Cb28tXtcxzPbuSF5IYJGJLf6hgKeNbZFNe1vpsoMLOotfvcUd/W2bqEBQDA
	ryuiToY01S81ocwNR71LhzQ98VzFRjb9o8euPK7UExmnZDWbOXZ5vA6v+9dInRFGrjeso3
	kaxDFH+FP4N98D5yYU42r+7zblGsDavUlAsaGdtu/KznnPaePfn9A4EnNX7dQIB4D6U4hD
	j0VoiTksE1HHt/lhjE1PMJMPwyYCKwmJj59Eb0uMtHW81zmaqDt8OIYXZqhoXdNqUnIDec
	SyTtOaj8ggRr/it8zfiztgsr46K4HUxoydkDhXGv01/VO4bBwfvxevVXpbYzJw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: expand on kernel "do_sizecheck" task
Date: Thu, 16 Jul 2026 11:12:19 +0200
Message-ID: <178419298513.94913.4168202947259829611.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca>
References: <b5a26548-6620-a7cb-ae04-d42f57df9bc3@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Jul 2026 09:13:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10084

Applied, thanks!

[1/1] ref-manual: expand on kernel "do_sizecheck" task
      commit: b01fb11a4909fe2d3afa6cb01bd7b179429e382c

