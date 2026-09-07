Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8259CC79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 08:36:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30467.1788770169936982260
 for <docs@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 01:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=DtHRlHvI;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44D501A1A21
	for <docs@lists.yoctoproject.org>; Mon,  7 Sep 2026 08:36:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12D5860383;
	Mon,  7 Sep 2026 08:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8FB511C7A43E;
	Mon,  7 Sep 2026 10:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788770167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SuTIi/oUHINM2zkW6vOEs3vKdS9k+yfsxU2Fcijgd+s=;
	b=DtHRlHvIWmEFLlHeRULOOvdzEjcNryf/cCrZMNBzCITJD4H1PJGFGgcBPY2fZQKRKwp/e8
	YPT+W4vPVsz74ShWGc522RfgAPTGCgLy44DAgDyqHhPmNuVNh/GUDCFWI0erErq1JWvQe5
	2svGgE73jKyeQBsOBrhxCoJL0PuDK1nghfjw/yOV3nj3rWaoimN3+/M5O7zjhUu9P+XrlW
	b2b+yzCFuINB7RYNdgXyVHdkeCxkW8oVsIbjqQTRi+Rzb0u3XL+uoCxaP5xsQJoyyG3o/a
	9NM5ztgjy/YUKWp0cOOQiQpHntCwz4ziBUoKLRYtRFhYqtkueI4Jp3CI0d6cvg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] ref-manual/system-requirements.rst: drop ccache in distros
Date: Mon,  7 Sep 2026 10:35:56 +0200
Message-ID: <178877008747.67635.13635175897427997124.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901133127.2608205-2-jose.quaresma@oss.qualcomm.com>
References: <20260901133127.2608205-2-jose.quaresma@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 07 Sep 2026 08:36:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10445

Applied, thanks!

[1/1] ref-manual/system-requirements.rst: drop ccache in distros
      commit: e35e86e9aea4e4ae12e8e0ba8a6391f2b2555b63

