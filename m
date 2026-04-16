Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E553F433C8
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:52:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14683.1776347531329612349
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 06:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=AuE0cFWP;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C024CC5C3D2
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C275460495
	for <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 422851046088E;
	Thu, 16 Apr 2026 15:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776347529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h8BlWy43Xif3agqI/PWo0eVnWc2DhdjR7DvfbaGvbQA=;
	b=AuE0cFWPf5f7WK9gJ+KC+/OJy9Jbt4lZBril0MJDk/BfIyoplOJmL6b3/1qwkL00X4PE1N
	lFQm0Xm5RHPvrHqjr1/5DQyCG+tzhz+aCN927Ukju3WPfNKfLceRQzduZEmFt3SS9+OcPu
	e8pwvPyBnkcMkSQeOQ4XDzXc8hKfcXaqB3XCa8dt7zuq5AzY+VQAc2TMFBqYN1sqRI5Das
	wljoFdkpOLHEKyGQ6V0R/LM2mW3SlrFaPSy6o46IrUy4K5HNgp3x/WrC+iHjYIgf7sTCfb
	IiZ1eL1qr7sHVHtsYqet2tJ8KBnWjLt5/p0UqFWxcMhnL7kMkqi4jzRddiAWdg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/5] Updates to supported distributions
Date: Thu, 16 Apr 2026 15:51:06 +0200
Message-ID: <177634729827.75801.9081297395030965925.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
References: <20260410-update-new-supported-releases-v1-0-fc53a1fbbdac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Apr 2026 13:52:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9265

Applied, thanks!

[1/5] ref-manual/system-requirements.rst: update supported releases
      commit: 511f8481d6d795abbfa57798308bbf3816407fb1
[2/5] tools/build-docs-container: add ubuntu 26.04 support
      commit: 043af43fcaa09950fa2de66de64c1de489d37fc1
[3/5] tools/build-docs-container: update fedora distros
      commit: c721359988b784c0728260a2fcc2a6ebfb653139
[4/5] tools/build-docs-container: drop support for OpenSUSE Leap 15.5
      commit: dc1fde2ef7f49d7923cd79fd22ae63a1165a9b79
[5/5] ref-manual/system-requirements.rst: add section for openSUSE Leap 1=
6.0
      commit: e5880b36dfc6879c8344178f3e37b4e56ecfd461

