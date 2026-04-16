Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E8CF8A17D
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14651.1776347533132317213
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=oQu562AH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A9F4C5C3C9
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C75660495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F07E610460891;
	Thu, 16 Apr 2026 15:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SfMm5WOCe2qA0RrBXIPXr0dhX3/8P0x4F7h+X9CSUzs=;
	b=oQu562AH/jrNtk6/LRJo66JMy+yl25dF5cHj+ByAboe+1SLDJNffZoVoQR1fPFMBiAiX4q
	L/NOdxIsdh2chFyRI9hG64F8uHyP1QcBtTZkmPzow6yOV1JfOhBDUZuiY9Soqri+73fZh2
	SWIyOobgzwTq9FA04xxDge7pQKN5Q7lAmsj2U0uJzoXptmaY0G0Sm2j8rFuFcpuhyF5bTk
	s8+6CMRLdR+U7OLYmCTYqLkMIv3mT8ryRb/nSlEPYe/VGFVNNSVXUYwWTO0OwBN7iIlZVj
	PqtaM/jCCc8t+PuhT6aDcxw79t3gi7RX65lSF+Eqoh7k+y51kxdtpak9ngcQvw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note
Date: Thu, 16 Apr 2026 15:51:09 +0200
Message-ID: <177634729843.75801.15651345269276200594.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416-fix-compatible-machine-v1-1-dee3c0d32431@bootlin.com>
References: <20260416-fix-compatible-machine-v1-1-dee3c0d32431@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9268

Applied, thanks!

[1/1] ref-manual/variables.rst: fix wording in COMPATIBLE_MACHINE note
      commit: 2c12ec7bf29aedeacf82970a9d2eb262fde4670e

