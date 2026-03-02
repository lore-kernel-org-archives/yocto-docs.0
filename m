Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D84E9B354
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 09:54:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157072.1772445259933795137
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 01:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=mpPiCbhp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 66E374E424DC
	for <docs@lists.yoctoproject.org>; Mon,  2 Mar 2026 09:54:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BAA65FE89;
	Mon,  2 Mar 2026 09:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7831B10369540;
	Mon,  2 Mar 2026 10:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445257; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9YBDdNf8XbQYH9Slx5D331sZ04Nw+kq7qZOCqznFBIc=;
	b=mpPiCbhpWrDHK9AEdP6WGy0jQ2zlevApVpbqSHscoeHIgob+n/ItEG5tfmcYTpmFWGX2gu
	aBmhXSRjQsYvIcm1xt9A85JLOQV3NvHLJnEYimNr8wd8FvWXXP5Y+z9+KuVPwPRkzEX8NN
	5eCB4VfQ2HeABrCfnvrNfHEyEbz0oLPl7AaPWnqxibbqS48UOJY7CPm4UKVVMWJnan5SpV
	A1+VP6fP4JqBVE+jkdKpVNOu2g5YTGirEcjpQvI8GCe69xDFsBAbIpfjCQJhjrZJx6m/RT
	pmNHHmVj8TEVxz0TRd023Wq/El5gmUCbQuzi8JVHL13okqWstc8Gi46mOXCcsg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] tools/host_packages_scripts/tlmgr_docs_pdf.sh: install perl
Date: Mon,  2 Mar 2026 10:53:35 +0100
Message-ID: <177244519640.106718.14719946611602225104.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217-fix-latexpdf-target-centos-v1-1-2e2abee7a078@bootlin.com>
References: <20260217-fix-latexpdf-target-centos-v1-1-2e2abee7a078@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Mar 2026 09:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9029

Applied, thanks!

[1/1] tools/host_packages_scripts/tlmgr_docs_pdf.sh: install perl
      commit: 2817a907738ab916a24bb2440dbc63d505b5e08c

