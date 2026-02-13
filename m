Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E84EDF027
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:07:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67936.1770973647630044721
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Feb 2026 01:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=dyrmRqb3;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1967F4E40D2F
	for <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E5A1D606CC
	for <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B69710368DFA;
	Fri, 13 Feb 2026 10:07:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973645; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lvwZwBiKaHI2H72OMvWxvNH1XmXuXtb8sX86UJYqKds=;
	b=dyrmRqb3D06gNNu+kroFESi/A1wi28MPZY5Izs+UfBMqs4enzfTODJPYt3zC+7t9n5CYQk
	aXYe5FIZhEkwCSlZHATbcgpig3LR0IfCRcHkQsf1MRUBuQU44xB1ymiZkBM6BlhCy1Dfxd
	a6L1vtsuamMGdCR8fW4LiK05vEn3V6LicXYANlXlJftnoZ6cIV08cMp+xeEfvbnAX8wkig
	sKya6YkJJfOS44xH34cSEEViyFJXscVRR8Z89NOF81DxJy7slK8dp5HurGM54KlNlD5kG5
	TCgBaKyIXi928ByrjFtsR+ZwC3PXzhpeLp7eOWGfkcUB43YjpvfwfWm79eWl4Q==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] set_versions.py: check that we build from the git repository
Date: Fri, 13 Feb 2026 10:06:49 +0100
Message-ID: <177097354669.48715.519506391209813675.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203-building-from-tarballs-v1-1-40e353ca4085@bootlin.com>
References: <20260203-building-from-tarballs-v1-1-40e353ca4085@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 13 Feb 2026 09:07:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8909

Applied, thanks!

[1/1] set_versions.py: check that we build from the git repository
      commit: f40dc0b42e5e66c5b4618063f8fea72e9f8e4d7c

