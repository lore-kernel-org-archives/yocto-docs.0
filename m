Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DF9F8D740
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14650.1776347532827724703
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ri0qvKxI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17061C5C3D4
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18A3760495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36CAB10460890;
	Thu, 16 Apr 2026 15:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qwhrGpzzQ5BlNQG5nFjEQDK+xpndg6yGaNcmfYCZd78=;
	b=ri0qvKxI8rI28iD0uuS8rspOeYJ0q4msoC+fFouLRLlepzl0fTQq0GA/JfkGjQVVi9IryU
	NIcsxv+NKPmJN404WST4bVFv3+tJYsTnnop1/b2LKbbvtJWalN7atK4Bru5lGno1ujQGrc
	fdP5PJNcNEc7xXh73YAT/oJtev9eXaiZ1uv+QoC1xvbzN9UgPte9xpXjuYsuhBn20mZIlQ
	/YDmtRdDZgHWfJCsh7Raxh5Y1IwdqYhJz/B2AwYILuih6YjkPhYoPHPq3IWsYc+yBSyHs7
	gNVwsVeyppg7xZEpLYOIHnsqwwckQUEhKN5v+TcAUEHDVWUo2his2r/OTrHRFQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/system-requirements: add buildtools note for Alma/CentOS/Rocky 9
Date: Thu, 16 Apr 2026 15:51:08 +0200
Message-ID: <177634729826.75801.12246184966819988913.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402-alma-centos-rocky-builtools-v1-1-447c92372100@bootlin.com>
References: <20260402-alma-centos-rocky-builtools-v1-1-447c92372100@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9267

Applied, thanks!

[1/1] ref-manual/system-requirements: add buildtools note for Alma/CentOS=
/Rocky 9
      commit: c58a6b4ad3910d39aaadc5659afebbd51f07ea4c

