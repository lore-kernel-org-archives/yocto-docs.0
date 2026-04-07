Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB0DFEEF37
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80898.1775567614024964314
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=G69HlFCZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 88D651A31C6
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6094C603C7;
	Tue,  7 Apr 2026 13:13:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B31501045020C;
	Tue,  7 Apr 2026 15:13:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tezaIyM5Bbx7mpEWrHnhT4RvwXQRrg0ZBhkTh+qhD0s=;
	b=G69HlFCZQy/O+khQV0622FiyICdiN6nG7t3Q25nPvEDkFMNaBX79UkPq6kLyH3duljxVcr
	fEkWkHmazr2+LfbKUDOvler/1UiJSs93Rbra6E8n/sGlcq4QnbWO2ssANQNU7cKoABq2J8
	9JNOnzvoD3w/97MGn7TM8255KMXONp719VmkzuX0KigH0Lqq3Ffdw9HnLEADRMutQZdQMf
	+PDFmlnvQFEg1dnCN+oRzm2OGrHjYqzMNb70jo889Bu1mevSamGuxk56KBM78e5zB0NZ1t
	KvHAA+dTp6uYWUU85mKeXYnK2JGWWnT76e4WRRRrhxj0BDjYFi3m++9jrYExVg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] migration-guides: add release notes for 5.0.16
Date: Tue,  7 Apr 2026 15:11:44 +0200
Message-ID: <177556742846.245356.1251931703281733547.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318101028.1339215-1-chee.yang.lee@intel.com>
References: <20260318101028.1339215-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9190

Applied, thanks!

[1/1] migration-guides: add release notes for 5.0.16
      commit: 47411fd29b571e3e20e221d3692eb1246f6503cb

