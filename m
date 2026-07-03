Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CE0C44507
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90619.1783079106227664176
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=lk0GkWhY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EA1EE4E40C64
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8E4C60300;
	Fri,  3 Jul 2026 11:45:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3AF9104C94A8;
	Fri,  3 Jul 2026 13:45:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079103; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=khe1Z/2Pmt9a/smUCkgvxXd7IQOiLSF8TqsdUsIL4pM=;
	b=lk0GkWhYdZ32iLQbxFa1SaswhPOoh/Qf8197OeSTFWi7x5QcWSLcclA9rLwdtJUxiLLPjS
	EcRBElqkwSlv/Ehzh6QvCqXcx6o0icSeppc9sj8iLVoqHOqXS7a/mRg/u+rEsD4x/z8jCI
	wE2ZHWa9HyWfI6xJyJk1aijvwOfhcHVaqQDuH30lZY/Pj0dRzEyldL5uubmG4dcKs5H5L8
	B0qnQBWC1fSC8TwHB+mwXkgOgQInzwjLmKhGaiwC6g7q2Ew/txvuDPW6pu0aTRH5jixHhH
	HLEXT/owMxvkwFx/ut2sc8R6PSTLmr6H7LvUNHgD8caE2CdyQRrdTCoIgmbHgA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] ref-manual: add intro content to "Manually Called Tasks"
Date: Fri,  3 Jul 2026 13:43:39 +0200
Message-ID: <178307887434.248663.6183803474323545291.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <5bad0a1a-46fa-4b09-83b1-53fefa37de17@crashcourse.ca>
References: <5bad0a1a-46fa-4b09-83b1-53fefa37de17@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10026

Applied, thanks!

[1/1] ref-manual: add intro content to "Manually Called Tasks"
      commit: ef26cf026dbbe147f113cd1bf9af87a835edeb39

