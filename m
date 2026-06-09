Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFB8CD98C5
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73967.1780990123715458571
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=hJUfxBq7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 330281A37F4;
	Tue,  9 Jun 2026 07:28:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0039A5FFC1;
	Tue,  9 Jun 2026 07:28:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 078BE106A2AC6;
	Tue,  9 Jun 2026 09:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uxtMLyrPECo2JxlL8Y+EvHdmPNecNlVw5n8NZtQZuGk=;
	b=hJUfxBq7fDHj6oOmCVeaV8L5F+8FtC4xKXQFFng4WHnj7h44SXJ8ugHGYqBEK0CPidt68D
	2h2zTyr2Bqb0N/TTnKY75baWyeszEUKdtNcKOZwdmVZiVroUin1bjqrcqjHBTdmoGLWOkC
	GsfDKUl896N37louwZ+ZgD9e5U+B1Dkk4HyKV2f8+hYKlqGsQSgsTX7KLBdLR54o1zjSEH
	+UTj9VihWy1JigwV8nmhOmylIcx1hA5HCwOVmcHiPgaB5uiu+pVl735YXmrR2VePa77ETQ
	FxPXnPfimHq535wBS48cXWhId86+2ZGd47KxX7LqF044cdxm+zoWLkrQJAdagg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: hyphens not allowed in file version
Date: Tue,  9 Jun 2026 09:27:12 +0200
Message-ID: <178099000054.200930.4080429851729072271.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <ca4da254-48cf-033e-e548-81604af5135c@crashcourse.ca>
References: <ca4da254-48cf-033e-e548-81604af5135c@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9647

Applied, thanks!

[1/1] overview-manual: hyphens not allowed in file version
      commit: b9c7aa835576f154dff1c565e835bffd298af7c3

