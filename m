Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 948F5C4450B
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91453.1783079101493333081
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NjYnlSo0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8DA61C49F57
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C68CC60300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12785104C94A9;
	Fri,  3 Jul 2026 13:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QZY+xixcKnFsZZc3qa/hKxIXmtdWiXgkyYGGtVU+o7k=;
	b=NjYnlSo0l9EB7+LrRwZxisVD9tMZ/jHyQ7JHvC1ZwnFtWptvgynbi3677Pgv5PgSisknyj
	SZv6yMbMekQ0zY3lY8V5VBajkIFiS7nRi3yeyW0kzRBmodm0IZN4O7OkkfgClnESFxOEAr
	RwWNd5YBMUIQ58gy7GzIutzrb0bMxB3g7E+mb3PjXIT/wRejkR56Q/qF+JJeria8gzbYl/
	AZz21nmFyTUJd/nFuZqqUmEQWexkqRL+WaTfyM2MY+le4I7AqB6OiWN1WKUiIrhm6EoaWs
	YUBBC7psFxwbA5xdjzyKsenn2Kmso8pZk5QhfBrqqTVQk9JqW69IYZKLHL3GXg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/7] Sync yocto-docs glossary with meta/conf/documentation.conf
Date: Fri,  3 Jul 2026 13:43:34 +0200
Message-ID: <178307887490.248663.17112198531554123365.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
References: <20260630-sync-documentation-conf-v1-0-da14b40cb515@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10022

Applied, thanks!

[1/7] ref-manual/variables.rst: document the CCACHE_NATIVE_RECIPES_ALLOWE=
D variable
      commit: 8881547719215a86a4a2e51ae3362462419a335b
[2/7] ref-manual/variables.rst: document missing CONFLICT_*_FEATURES vari=
ables
      commit: fb38ef19e67b31f855bddb61ad990020d5cef234
[3/7] ref-manual/variables.rst: document the LOCALE_PATHS variable
      commit: b2267d27de5ac5ac163be4c740d725a181f3f2cf
[4/7] ref-manual/variables.rst: document the TEST_SERIALCONTROL_CONNECT_T=
IMEOUT variable
      commit: 69a8a4ad429e1280416700ce97039296ee996b43
[5/7] ref-manual/variables.rst: document the LOCALE_UTF8_IS_DEFAULT varia=
ble
      (not applied)
[6/7] ref-manual/variables.rst: document the TEST_SERIALCONTROL_PS1 varia=
ble
      commit: e3704c41ca4a5726ce714c43ae03f64bdd258334
[7/7] ref-manual/variables.rst: document the IMAGE_*_DEBUGFS variables
      commit: ce2af80cadf76740c5b00f1c228d7b55dcc73d0e

