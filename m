Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87035CD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:29:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74156.1780990132754024917
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=BvMY/8Mu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3EA8E4E42D42;
	Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DFC35FFC1;
	Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91EC3106A2AC3;
	Tue,  9 Jun 2026 09:28:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=meMMpUA5SpcGEh4flH+rjGEZ8sKax4ToPtG387AZgRI=;
	b=BvMY/8MuJJoD4gXRbjWSeeFG3SC6id9+v7xDfelWnisXRcXGVDYgxHNRqU8K/HADBp2F8P
	wUw5em6gLOLfVjQOq0klsfKr8U7jWPgmY6TiWDcPlx+u3VjxUM0f/CRyEonZStGNrwGb17
	ophFcdRU1LZQtnSBl8bm+Gf5B9AesF4dLZZ93zhj9mWYvkJRStTcVbC1haTs7uB4BTsqxx
	18PhJzmXhMoPqiolqd39UYN43SxVA+hRPDWRKhCWHpDgshdDj/2jENMC0CYxeSWbcXgG0W
	1PbhM4At/d+W6sJko2f+0esyXNLvzspVXE2WwPxVLgd9EO5QI9O3GT3LgSXIEQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] overview-manual: update deploy.bbclass snippet
Date: Tue,  9 Jun 2026 09:27:22 +0200
Message-ID: <178099000190.200930.3853826698539040227.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9071d45b-8364-46c0-7454-262341a5c63f@crashcourse.ca>
References: <9071d45b-8364-46c0-7454-262341a5c63f@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:29:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9657

Applied, thanks!

[1/1] overview-manual: update deploy.bbclass snippet
      commit: aec2a39ea648694bb5a30da216b721018e8bb670

