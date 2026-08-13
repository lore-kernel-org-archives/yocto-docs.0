Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C8CC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 12:02:50 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17368.1786622567805341703
 for <docs@lists.yoctoproject.org>;
 Thu, 13 Aug 2026 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=L6/z0Q/A;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 305C51A15F1
	for <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0371A602B8;
	Thu, 13 Aug 2026 12:02:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A04FC11C4DE72;
	Thu, 13 Aug 2026 14:02:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nH00eifykhNMhQ0rJ7HJESs5wxBhj4rBnLwcdxYi+m4=;
	b=L6/z0Q/AnT8tBs+Bh+dfc3O4WIDpY8Q0BvDhBObnDJ6d4Ku6HFflXWEBykl36FB+YpkfUF
	COGKtm2phDtWAY8lLdUiS+FYpjulx2fqpjYcnNWheCNWKgBtpw5JI7b6DGJlwxShmA9SNq
	uBspzcLwUAr6/6hVDzNJXWuhajP8CnDacFvrJkSdJHrhY526A2saTkkA9s3fzhX9JZneXF
	ksww1rkcgwc86OqH3MtnEUfIU5M1Y0O2sv7A33yy099clWXzqZP84myqeNq0m7qdADo4vu
	hovgx92oTs60sF78g8xeKVQ7GRpBnt+FoSZvHpIdA6xAr25bICizKzRmj/MrLQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v4] security-manual: Add information about how security is handled in builds
Date: Thu, 13 Aug 2026 14:01:45 +0200
Message-ID: <178662237156.775933.1734566392443326605.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811091436.3649689-1-richard.purdie@linuxfoundation.org>
References: <20260811091436.3649689-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 13 Aug 2026 12:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10286

Applied, thanks!

[1/1] security-manual: Add information about how security is handled in b=
uilds
      commit: 0bdf2e2eb4ed75650c80df3f62b28eaebf8e44e3

