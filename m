Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DD0C44502
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 08:05:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87408.1782720293027765629
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 01:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=vbJYBW7N;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E17B7C5145F
	for <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2E705FF96;
	Mon, 29 Jun 2026 08:04:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29C6B106F156F;
	Mon, 29 Jun 2026 10:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782720290; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gyoEIxnuaM+1hSAn7irUxaYLg0J+J0Pv0JY6G+o4/Zs=;
	b=vbJYBW7N1VfpfObDXrHd3fofFzSFaIjfyHAYWCzvnyoZXtz98jxnNCnDhuGSZHqBDMk5Lr
	CcQbkLoI7HpWNLBgHPn9DD/dhM1aloNiX3ZDc2snlAyOjGaPu+imNRoz3UALuesfxNetsV
	Zx8Cimn2ycOZD7ZuQk80GkFL4z7odZ3oAEctzdFtM4BFE61iZJ6hTWh/omxxmRwwM/S9zx
	7DunwTBRiXDwKXpLVacsFJpq8rgZuPBW6pDbl1WCHOqy2VWCv72oadMSzKlKMyS/cCCd47
	gLm576Whdw4Ffk4UfCC+rzV5KZXA3cfEZrdH6lzWHdARTn66V5Y0OeeWZZpGQA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
Date: Mon, 29 Jun 2026 10:03:02 +0200
Message-ID: <178272012414.45179.5622820150177852881.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b99491de-f786-3ce3-d7de-104ba1660842@crashcourse.ca>
References: <b99491de-f786-3ce3-d7de-104ba1660842@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Jun 2026 08:05:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9932

Applied, thanks!

[1/1] dev-manual: drop "PREFERRED_VERSION" from x86-base.inc snippet
      commit: a70ce32d8e314afa833079e17757dc9b19590c56

