Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F847CD98C9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:52 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74155.1780990131312114762
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=0F/Trp9f;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C6CF64E42D43
	for <docs@lists.yoctoproject.org>; Tue,  9 Jun 2026 07:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CA5E5FFC1;
	Tue,  9 Jun 2026 07:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B23B106A2ABA;
	Tue,  9 Jun 2026 09:28:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990129; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4WPh2PQoz2DHBJyU/plJWvNXYs2j0wwmQcPmxeCkC/U=;
	b=0F/Trp9fFyXsFNHxG+JPk9GdG+/v5XxfL6Es/waMhPJgY3l5FVgui/HoV/LlWK9m8Pi5wL
	h/9VigqzoRA23xDiT9QgHikgCqUTBZ0IclGZzd+TYLlLo8N6SFTTDQh3bD72QEV7cVpHIT
	bVulqjWeGOXv5aRusEFPiP5FwPSRBktj2wrkGwoG4bTiAH9Ha+f1Jv7UAyS7iIvy2OuQlt
	lzU/QGkd9kR0ECeXpB1kAZHZoDgCvjyzZvaQ+w0X7++j9D4z22cfOSfxyNXoHPzO+P6pFp
	eRUPqEKvfgfBMzM6cjpANJNhySnR1/2bi0vbFhZ3bUXGGKKCRbfLfqDCz23qOA==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH v2] overview-manual: inform the reader early of "bitbake-getvar"
Date: Tue,  9 Jun 2026 09:27:21 +0200
Message-ID: <178099000099.200930.4837570356159317238.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <f4adc33f-5b48-bd89-e872-fa387921aa2d@crashcourse.ca>
References: <f4adc33f-5b48-bd89-e872-fa387921aa2d@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9656

Applied, thanks!

[1/1] overview-manual: inform the reader early of "bitbake-getvar"
      commit: 33f57d154ad1ec950c59c5aab20e0a0323ef19cc

