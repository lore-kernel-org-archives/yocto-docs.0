Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC94F8A17F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14684.1776347531826416438
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=KSH/SknN;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4610BC5C3D3
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 488A260495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B05CF1046088F;
	Thu, 16 Apr 2026 15:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q6csTuR68ZZmgf105VKzoa8Dja4OQKu3PWSaotIt5B8=;
	b=KSH/SknNZsFKydnk5mgmmc/9wnz+TUiwCT2qfNmYtGUHt25+JY834/wTYwao4ztkV7rkvu
	qSn+TvPnnCZB59muvIKWhbxRQe8oUO65fslF9VuXa7ogSpU6Uti8wh6b1X8SYvbYyb111B
	2OYRyfWHzAXVSc9F6Ex3vmAYh4clL3T88l2C6wXner8DwyCkUKeInwuIi4q2ZX4/tRkANi
	RGgWny4nIvLc6UpbQ/xEBrMOjDyE1ACzTJzAWNte2y4lbUqy6OhYU7BlrUZHoBn7+5v4dZ
	60TF4mwkIOMUIxI2vJQvZHmZVh0dn/JyIlZUBO7pgwd0YUQBU9Ih41MO+cEnRA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 5/5] ref-manual/system-requirements.rst: add section for openSUSE Leap 16.0
Date: Thu, 16 Apr 2026 15:51:07 +0200
Message-ID: <177634729830.75801.17357435917290844907.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-update-new-supported-releases-v1-5-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-5-fc53a1fbbdac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9266

Applied, thanks!

[5/5] ref-manual/system-requirements.rst: add section for openSUSE Leap 1=
6.0
      commit: e5880b36dfc6879c8344178f3e37b4e56ecfd461

