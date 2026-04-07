Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C690FEEF38
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80904.1775567619834851383
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=n8A61LiC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E2324E42948;
	Tue,  7 Apr 2026 13:13:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2599B603C7;
	Tue,  7 Apr 2026 13:13:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61A0E1045020C;
	Tue,  7 Apr 2026 15:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zx1M198BmKEKQ7EoWd6bpD6JYovfirT9JDx4iE1ovLE=;
	b=n8A61LiCHSqu4ukWUx39YQGXHU38qw8Bd0ZBRNknwyd5UqhiJr7UXv6BmvnXPN8zjikv/R
	hXpvetn5KhpjZef65kRVzUq0DrP4kProjlhJp51ZKy3/I/4eIiuEFAPJMs/vp8uf3pNaUr
	PLXKandNkYA7IkGa54MYA/sIVhVYj9iBf9xKPxJksgn2C5WUZ2+o2YvNG43fXUd4bab93+
	SqKpAsNnkY0xC7r8VrNNlR5fBLFbMpUQb4hYR+Rgy3NDCDT7mkS8TLn7+FgUjdQO4k82uz
	1WdE0Qq7mgXaMCyCPKT4AXv/cROLxp38kKisbAD9SiNEunkbOXLzMkuvrcGi9A==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	stondo@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com
Subject: Re: [PATCH v2] ref-manual/dev-manual: document new SPDX variables and capabilities
Date: Tue,  7 Apr 2026 15:11:48 +0200
Message-ID: <177556742863.245356.2631665444057846894.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320125636.65856-1-stondo@gmail.com>
References: <20260320125636.65856-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9194

Applied, thanks!

[1/1] ref-manual/dev-manual: document new SPDX variables and capabilities
      commit: b8502b2ba5707b7036c26f9218b5846e0ed2ffb8

