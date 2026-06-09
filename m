Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69073CD98C7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73966.1780990121921763994
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=uqVp5nEh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7197E1A37F3
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45C505FFC1;
	Tue,  9 Jun 2026 07:28:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 033A2106A2ABA;
	Tue,  9 Jun 2026 09:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BMtIskzCyxyUiIRGN7/94+Ca6zm5dLY64jl8zNkJjDw=;
	b=uqVp5nEhWeT9WpJPGMahzSQ30WcGND4ymiCSJf5LOUOQdyc5bJVm6OliG2KnsnDjY01JwE
	/3EdQBQ2c36CGuOXDqegnshAt2p3P92rOQuHN35LamG0s0nKELRSd+naEkcnh+P4kWDkRR
	eb019odk22+qs1HtzsiSntJGyIWU5rfysiqlsq3OTaly+Z7QDEqBTAIwsrlz1ZEfM8TTCb
	2UaOm7yrO2i19P7lnfFIHGprUlYOz0grhNMmHhex4o6hQQvDROWkUkuHpbyZ3cUsNW1xJi
	j0R6FsY97aW5UJJkIXGfHMk+m33WVbk2LuWM4FpsTm5VgRvJfzkH6HD6eZrhuQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: explain "ODM" and "OSV" acronyms
Date: Tue,  9 Jun 2026 09:27:10 +0200
Message-ID: <178099000130.200930.3121356740456450592.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <77b7f6d7-4d08-601a-0940-09d9a7493156@crashcourse.ca>
References: <77b7f6d7-4d08-601a-0940-09d9a7493156@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9645

Applied, thanks!

[1/1] overview-manual: explain "ODM" and "OSV" acronyms
      commit: 65d28b13a2d69e5087950611fac4ea610bf3b5fe

