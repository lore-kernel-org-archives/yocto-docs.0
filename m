Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D857CC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91455.1783079103460057072
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=U5v4AM1X;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CE2BBC49F59
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 104BC60300;
	Fri,  3 Jul 2026 11:45:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35347104C949F;
	Fri,  3 Jul 2026 13:45:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SwLCzvZuiiLOToAK/XGzPumok59J+24jXcsKEk1WRy8=;
	b=U5v4AM1XTsvJ6ctUB4s3B1jhNFC6YP21YGroeEeq6Xb8XejNLEn8c6tTX+NQNIyvferB5Z
	ANxMDQcyskm3nfoFQVfL61eeeKkrtWzHWEYVh5q3Vs6G8nJPm1AT23gRtjT3gYPT++GxJi
	b9hSZmirajImmu4YaSSyy0FEXveUw0+G3DShD92mjNq/w+o4udM4jUt0oWUtR0HCFP26Je
	Z2nYchVTL88LIfKhFoArBm8VdSh0yhd6f8jpulNJMYln85NGRoIMw9opHfj+40YzXTeL8P
	8SevlwPSYua3sqmRd0iE+fIg91bKcyUfgpIDyakKS6IrNqyy8VKEK2wypwC+FQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [docs][PATCH] kernel-dev: document patch handling for discovered BSP descriptions
Date: Fri,  3 Jul 2026 13:43:36 +0200
Message-ID: <178307887458.248663.8256915931660632108.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
References: <20260605115821.2909728-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10023

Applied, thanks!

[1/1] kernel-dev: document patch handling for discovered BSP descriptions
      commit: 63b90ab4b818f888cd2e4ca36de5e5260f17e500

