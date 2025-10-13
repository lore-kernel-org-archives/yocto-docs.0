Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C261ECCD192
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:36:10 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.49180.1760373366554133596
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 09:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F6JY9BE1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 08B54C093B1;
	Mon, 13 Oct 2025 16:35:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB6DA606FA;
	Mon, 13 Oct 2025 16:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2F49102F2275;
	Mon, 13 Oct 2025 18:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760373363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7VahjQJo2D7R3UTZFEJk05L/ie+Yb+utqE7D/at7E7c=;
	b=F6JY9BE10IOWmo+zeXqDqV5OYsleRN1XMd6io6XkERtcCidKKUcRALdq+A0iG1h6tLrfZ4
	e2r7GNJW7ZzSj7itNBkQLGMGOyH66Jpv4Bp3a+gj8Fr+sUtoF0pkzn6cRmzz0vZbbbRH/v
	t835uAwcHWn8mh2z9Js4e7/RlxBIG905phfvL5PYrkY9Cevoyh/Z9Zf4xoMM/U570hrYPn
	UaVOkNP8344F74vLEYEBepqvsFqXYIlJLzlBIiNgtYDUseuKVRTKydS9nOf5YWtQkH1mOI
	TyBvi8yZG51JuYfwG3kxDhFbjuz7wf8fmuSsn3qnurwoxd6oaRljHaperlS2xA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 18:36:02 +0200
Message-Id: <DDHC9YH88NWP.1DBRSUEGOLV4K@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [kirkstone] Pull request
Cc: <docs@lists.yoctoproject.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Oct 2025 16:36:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7697

The following changes since commit eca2cb23eb1fd4186d1f5cadc3280d73e8f52631=
:

  ref-manual/variables.rst: fix the description of STAGING_DIR (2025-10-03 =
11:49:14 +0200)

are available in the Git repository at:

  git@push.yoctoproject.org:yocto-docs kirkstone-next

for you to fetch changes up to fca48e1239950ccf10f6b1b805c5734104144ded:

  vulnerabilities: update nvdcve file name (2025-10-13 09:13:46 +0200)

----------------------------------------------------------------
Lee Chee Yang (1):
      migration-guides: add release notes for 4.0.30

Peter Marko (1):
      vulnerabilities: update nvdcve file name

 documentation/dev-manual/vulnerabilities.rst       |   2 +-
 documentation/migration-guides/release-4.0.rst     |   1 +
 .../migration-guides/release-notes-4.0.30.rst      | 170 +++++++++++++++++=
++++
 3 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 documentation/migration-guides/release-notes-4.0.30.rst

