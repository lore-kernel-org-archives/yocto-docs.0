Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D72CD98C4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73954.1780990113623255096
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=bM9yFL46;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 74B6E4E42C6E
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AC565FFC1
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96CA2106A2A05;
	Tue,  9 Jun 2026 09:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RUUBrKRKISenPNHEoWwxR0sKjRMxH5J2KNoOZ8RIpgI=;
	b=bM9yFL46LTpifCa7NlEAQJTLushMY/N4WNeX/s/qFfkJtjt28uuXNJRNijava8sjokZYK0
	C2NA7kapX5JMpel/WUbHbTQ2Hre48LGmmvPXaRWJhuwqsxfzRad00BxGvB2099w/OkZdUn
	BXwVWUaOnCTrwog6uA+B18WBUo1aKxcuX/DimM6jg5tg0jRQgfDwzAkLCL/aO/185hwf00
	/R4WFVk3crJUsl9MuLwbFJrTr4jwwyTQfMMDLk22kL9ot/RAl2cS7ZJpXhfsXeNGxJGvkL
	E/IBC1TpsTePoeird1jNZozSblwEXFndz0lsg6qUCmwCmAmDvme86uMBqpQZGg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] migration-guides: add Blacksail release note templates
Date: Tue,  9 Jun 2026 09:27:00 +0200
Message-ID: <178099000110.200930.9136314292693899642.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601-release-notes-6-1-templates-v1-1-e586526dd576@bootlin.com>
References: <20260601-release-notes-6-1-templates-v1-1-e586526dd576@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9635

Applied, thanks!

[1/1] migration-guides: add Blacksail release note templates
      commit: a9f45a93c3eea8fe20decc1efc6aadf7baf4db18

