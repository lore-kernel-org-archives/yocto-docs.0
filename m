Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C7ECCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 12:31:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.14259.1761913858891701330
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Oct 2025 05:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=eeC+e45o;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 89BB74E41438;
	Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61CA560704;
	Fri, 31 Oct 2025 12:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 323C5118125BF;
	Fri, 31 Oct 2025 13:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761913857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9z88A7eNptvutvM3ihwf2ujoPgOhq+OhA0FysiHsb4I=;
	b=eeC+e45oV3p7HovG1LLRNDAJlqVq0NfZJgmUqCvCDN5UABp934lAn2nOziEaofn7QakvYb
	RubXeesG55SOXtdRKa9Z11a/sfcA9GvUBjm/xUh1BlDlX55xWATkZDMrG0J3uzE9cUTymA
	XKkZuDxKue+VnhpuP4J39B3hPpXAxZ1MBCCcl1NbDMG0v2jDvP+d/vir3lkNsJUonKuJZw
	+Mh2j4eAMMMv0uDKpkJQIg0FixdqI11cFrdCvz9i5oY74Srl3hMYxRP9HxmIh42O1R/0n5
	2aldWnwxbE2fqxxWWxie7cz5J+5skxreHfufHkzowo7MPo0Nn52viMDH0YtwYA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	pierre-loup.gosse@smile.fr
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v3 1/2] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
Date: Fri, 31 Oct 2025 13:30:12 +0100
Message-ID: <176191376989.156612.1993561008868995372.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
References: <20251024084446.1109145-1-pierre-loup.gosse@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Oct 2025 12:31:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7947


On Fri, 24 Oct 2025 10:44:45 +0200, pierre-loup.gosse@smile.fr wrote:
> Added by commit 3892912bd7e0 ("wic: extra partition plugin") in OE-Core=
.
>=20
>=20

Applied, thanks!

[1/2] ref-manual/variables.rst: document IMAGE_EXTRA_PARTITION_FILES
      commit: 3d2aaec8218a7cad5653face152e9cd45257aefe
[2/2] migration-guides/release-notes-5.3.rst: new wic extra_partition plu=
gin
      commit: 6a9b26ed0316156975c7ef9209e73ae9d8f7ac03

Best regards,
--=20
Antonin Godard <antonin.godard@bootlin.com>

