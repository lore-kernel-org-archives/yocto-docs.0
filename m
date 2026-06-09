Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49959CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74148.1780990115001232320
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=gowiRK19;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5BB741A37F1
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F48B5FFC1;
	Tue,  9 Jun 2026 07:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04A7F106A2AC4;
	Tue,  9 Jun 2026 09:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990112; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Sf3NjdC5MYtAhdoMJxGvEVWPFZhtjWH5lH6jD+5RrM=;
	b=gowiRK19ps4aW0n7868Ipqsng0O4bDzTagBy+N9hW3CKKmKlKYvYDgIGVpDMIvV9ZyaXLD
	D/1rBOAjJGNFEvRqrRsYnq/OHXQjeteZMGw9d1Us7gh25EOcgbODt/7ReoAu/ZcMv0j5Ms
	td4RCZfJi8GmbG5iMMZ4w5XMduNifswRT1BMTQHZ9H84Ie3WdYXjIssx5Rw8hyKXVGyo26
	g/kY4s5tofJHmqQAiolHXslmgnNWvRku5SW4RPn+g90dtSDYe5XxQHrvKFOu2+NolaVKtV
	sccnJjn5heovaP1o83J7zTvktnPny52NSXhEhKNEBkdvwo06L3qBUxkGH3uyPw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	chee.yang.lee@intel.com
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] migration-guide: add release notes for 5.0.18
Date: Tue,  9 Jun 2026 09:27:02 +0200
Message-ID: <178099000208.200930.11706723572047294744.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605102453.2102163-1-chee.yang.lee@intel.com>
References: <20260605102453.2102163-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9637

Applied, thanks!

[1/1] migration-guide: add release notes for 5.0.18
      commit: be424bf52cd3ac9c83a4617d0b06afe8cde055be

