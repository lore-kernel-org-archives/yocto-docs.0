Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DAAFEEF3E
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80897.1775567613703885548
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=VlFIbCjp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15FF21A31AD;
	Tue,  7 Apr 2026 13:13:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E121C603C7;
	Tue,  7 Apr 2026 13:13:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B657310450210;
	Tue,  7 Apr 2026 15:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567611; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kq3ZqpCMVoHyK+iV7em6JxKs3t1Ryr3t45k8eI8ZmT4=;
	b=VlFIbCjpsZYKUHWHCmwmd0HFiorG3u5+LzDvozK/kRxkKQMkSPeNrwtA+25Pr0zuxZNH2B
	7I6QWKwrhFO8LxUBo/KQ9NwFrdrgKB0KwSyH50xTTzWKdS4GqB7I/wpVGpCQG+nhR5bhyF
	81VLMv8BhAAzrZZCr4weVQNHOOsYZ7PpaycEo9hugJ+xq03H5KdFHayp6iD92jI7qnLvxU
	xjnzAxiB2AkOWOYfTY475xH6ypNL3aIv7hv06DXDA7W82VGuz1sVRKTFUI1+47JlP5j0Yu
	nHDUny3x7gVa5DFrduIIqXJ6HmU4LscG/VmZZyXmtX1xj0bLTNgKtcdVMnPIbA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH 2/2] migration-guides: add release notes for 5.3.2
Date: Tue,  7 Apr 2026 15:11:43 +0200
Message-ID: <177556742836.245356.15374790882483076918.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313095135.1177465-2-chee.yang.lee@intel.com>
References: <20260313095135.1177465-2-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9189

Applied, thanks!

[2/2] migration-guides: add release notes for 5.3.2
      commit: afb8749561757a056f2257c080e0ba87300a8805

