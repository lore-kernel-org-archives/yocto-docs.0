Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A04BFEEF42
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:13:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80895.1775567611989891556
 for <docs@lists.yoctoproject.org>;
 Tue, 07 Apr 2026 06:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=2MEju0sT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 392074E42947
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11BED603C7
	for <docs@lists.yoctoproject.org>; Tue,  7 Apr 2026 13:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23D7310450143;
	Tue,  7 Apr 2026 15:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775567609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TBFhIUhYhpBvqLbbtprmNRbU4BqLYAhTOpCfOURuXjM=;
	b=2MEju0sTQQ5ZoM3wNfHIXfczQb9wLVRVv6TsJI54fyW7A6PVYbijfCerqkpAmdgk93bwB1
	KibVFrIsMs/+PIa7eFIF0AyaMeLPGu1yjlDlJ0+QA3RVdcyJQOl1mg0Fm7CVtF3HeSVmfd
	RAAR7RcpUHNOyYlIk2XNQsyZAZb1AQa2GXjzkRzqqYdX2nsOYknLEAP8WKO3Bpj+nPNWfi
	G46JXzmYD1ahYXBSW/QbjCn6gnw+Etxoy1B6EeZW4DS3uBqAqeHCrUlyxZpN9z3IjdchHf
	h+q68+xYwpFxJor4ULC2YwWmMvuDZt6g5Xwg8nBiKr/+oZst9j/qFGuxslEEcQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH] ref-manual/system-requirements.rst: remove Fedora 41 from supported distros
Date: Tue,  7 Apr 2026 15:11:41 +0200
Message-ID: <177556742861.245356.12427399325228305397.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319-remove-fedora-41-v1-1-851ed45bb8cd@bootlin.com>
References: <20260319-remove-fedora-41-v1-1-851ed45bb8cd@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 07 Apr 2026 13:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9187

Applied, thanks!

[1/1] ref-manual/system-requirements.rst: remove Fedora 41 from supported=
 distros
      commit: 5bfe4f9aecf542766dec727bedbb30b1f93ab64a

