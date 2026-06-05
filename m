Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D4CCD6E7D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 13:38:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8440.1780666706916014117
 for <docs@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 06:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n3OeALBL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7CCF74E408D1
	for <docs@lists.yoctoproject.org>; Fri,  5 Jun 2026 13:38:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C96F5FED1;
	Fri,  5 Jun 2026 13:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43F60106A2466;
	Fri,  5 Jun 2026 15:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780666704; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FY4AoGMmKdtAOKR2M1wFNNsS8kyzgTQ5JhMdHMHkM5M=;
	b=n3OeALBLXXrAfikbR15xpf83XgXxa6PdFlsnCGrK9nbpLlrLV3VM2q2LKfmCzlnfWXH3or
	t0CnD/gOmWCYZ4uXIAA/o5xJnsVEBOzVW2PFkW8OP2dbID7rzbwAeyJSnJBq0NbmMAlv98
	Y7vlsB2RrOphUNFkLm3Qp+jkd79c7pn1oYHjq6rN2aE/G4H0+zBwMyKmM93y832QvB6lla
	45OAvoiCiyO4tHHJgxjG4poylfysrIPVNbcnGNEzc0EMx3FqFl7daUuh84D6zWbcnjFrFe
	4hwHnz29AMon5xnT9NMhKvQpQSKXyXm/v4j0OrrbSQTt2zTeSuBtRtNscACotw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 15:38:22 +0200
Message-Id: <DJ15NY3K55MY.2P350GP2Y0R34@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] overview-manual: mention idea of dynamic layers
References: <6032efe1-86e9-a83f-6247-939b7d3a36b8@crashcourse.ca>
In-Reply-To: <6032efe1-86e9-a83f-6247-939b7d3a36b8@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 05 Jun 2026 13:38:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9601

Hi,

On Thu Jun 4, 2026 at 5:59 PM CEST, Robert P. J. Day wrote:
>
> Warn the reader that simply adding extra layer names to their
> bblayers.conf file might have unintended consequences, and refer them
> to the BBFILES_DYNAMIC variable for an explanation.

I don't understand how this related to dynamic layers directly. Including a
normal layer that contains bbappends already has consequences.

Antonin

