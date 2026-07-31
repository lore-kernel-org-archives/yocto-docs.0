Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82974C55178
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3044.1785490630623076519
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=iPA98bzg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6ECC4E41047;
	Fri, 31 Jul 2026 09:37:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B51696039A;
	Fri, 31 Jul 2026 09:37:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61A7011C1660D;
	Fri, 31 Jul 2026 11:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785490628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5cTTYHvGqrvpZyyZ2rr2jZ3QzbEEH9+bLI1nPcJwiZE=;
	b=iPA98bzgcFKeLm1qLOBqF+mccqeaERhzMGTnOvqey9kx0ADAJPVWT/WMq0/NS7pQ9qn//e
	IsAhRLKoMsVKpA9gQ+oAIc17PsWgc4kOpd17u5ZPJrSwee6VTjdFo7DVHb3IZCkkuNHTQH
	Zz8vCPH6FsC/EzmW5QStOFTWiEP/vnrvp3n0/JCNAobAjVqy6t0OmI85vRd0HKouHnY4aM
	Kh6kLnOpYPlGFLttAoBUre4Mjyld/ZCj4RyuW8hN6CDR4nJBxSl5gpD2oiQYUj03LWB87q
	/Ft0ZD+NqA/c4uuWE/ozNTfkGSkoQ7uqbueW0SAypN7dby6pvNcvcPTKBroEIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Joshua Watt <jpewhacker@gmail.com>
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [docs][PATCH v2] migration-guide: Add guide for converting licenses
Date: Fri, 31 Jul 2026 11:36:23 +0200
Message-ID: <178548999922.2379643.1870909262369278226.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722144843.3413389-1-JPEWhacker@gmail.com>
References: <20260722144843.3413389-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:37:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10221

Applied, thanks!

[1/1] migration-guide: Add guide for converting licenses
      commit: f1eeca0141a49396f5886a558c70deae88f5d973

