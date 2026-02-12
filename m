Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0B8ECD6FA
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 08:40:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41275.1770885641629667816
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 00:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BQ2vMeIt;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3D382C8F472
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:40:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24691606CA
	for <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:40:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79DB8119714DC;
	Thu, 12 Feb 2026 09:40:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770885639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YKMGro4rsHTNKIqmj/dxCkXMs2/el4XQHQk0OwAUb6o=;
	b=BQ2vMeItN194p2isbIla7cc0ndeHvdWisJVUWgv2WFGMcw4FzmKppz9wioSovFEF3jtCc0
	CfoOAfdUAIz63JXDwmE7ObfDC7s19p2zZc+lEj9Mvc1IRZFHUZl6aH5FRzMBlHHzhW9b4v
	tnSazK0QWao+3LXRwFefr8rSdUw8CXueSf05yriIu7W/g+FjX9eviety+f1qIHfFa0HZZM
	l+xyQLLWbKlweNJHPxgC2f4afl7/pa0iZTPy1EautL+awx9s6u5ryJaP0fPT36nAYKxQ/M
	lmYa34REBhzbfvmcy+EBPLr+yih25No9fL6Pg94itXLzTh6FxH/g+gnxg2kJWw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 09:40:39 +0100
Message-Id: <DGCUKFOM89YT.3MGBCW3MYTE1U@bootlin.com>
Subject: Re: [PATCH 0/3] Rework the logic of the switcher menu and improve
 it
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <docs@lists.yoctoproject.org>
References: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
In-Reply-To: <20260212-fix-switchers-js-v1-0-16d95c74c328@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 12 Feb 2026 08:40:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8899

Needs to be merged in lockstep with:
https://lore.kernel.org/r/20260212-fix-switchers-js-ydocs-v1-0-ab1113759747=
@bootlin.com

Antonin

