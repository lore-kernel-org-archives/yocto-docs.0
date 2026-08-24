Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C27C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17064.1787579151590642213
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=xhZNoK7r;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FC904E4138D
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6450B5FFC1
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE89211C79595;
	Mon, 24 Aug 2026 15:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a5EqWnJLQESPn3s7rprh7LtGwG3RHz6FLeVH/rF5YFA=;
	b=xhZNoK7reVnkpvgkdzpzWldBk6uYsjS7RTB8PFEJ+9NFxYwJ/kOOjhRJgTLmmTMfWP+Ht+
	LQ2KNx+Xox0twDETuXieAbrb6aJjLvHEs6eMqrgrWMYfub1cd0s9FNnhAwtrl7FvUxjd+d
	Ayztcy5kZof6bBWkx7dSkhPe03ZZ9WdSSolEKEwWH7MV1Vrj3Px/SiX+SsZ0raPywpl+MB
	06lpsygfFaikAdXD/kOIxKIv3kOA7JXwDKA/a7fPZw7tJx4i7B7X8HuVwAgjcmSB61ICny
	2ssQOD3VYms2hPqwXiAd7q7rM2M1SHg2dFswd7zkmkzpnzx8ff0NYvrX6x8nwQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] index.rst: show the intro paragraph only for html-based docs
Date: Mon, 24 Aug 2026 15:44:18 +0200
Message-ID: <178757686707.159281.9230688102132851299.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818-intros-only-in-html-v1-1-4fe4c54655bf@bootlin.com>
References: <20260818-intros-only-in-html-v1-1-4fe4c54655bf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10327

Applied, thanks!

[1/1] index.rst: show the intro paragraph only for html-based docs
      commit: 8e70193dc4c6271e0226cdda7110cf60347f0f51

