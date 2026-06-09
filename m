Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC79BCD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:28:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73971.1780990127701629975
 for <docs@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 00:28:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=V4I0Sbla;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DDB44E42D41;
	Tue,  9 Jun 2026 07:28:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0426E5FFC1;
	Tue,  9 Jun 2026 07:28:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5301E106A2A05;
	Tue,  9 Jun 2026 09:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780990125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pQe38+zKPVTDNZ1tQVPa5IGf+U39bIs8S5eQuS3Cg34=;
	b=V4I0SblaJncUmxUPZt8Q2fFD+hm4x6whOIdlioXQTXq/JgLJzejt0bq5pWh0UT0MM7XMko
	DE3WD9TP0td0GB0OhKfXFgLSsXiS4zH9aD088A7azx03n6beYIcjFUu3BdUpMI1iAcemd5
	y7mGR6H4GboN69+R/9Y0dxaaiCTwGc0DUWD2cKa0jtOQNUwARySvgLSwert3raxb9Oadgt
	MjdknznwxdS1tyv8wboBTG7UuMqlqCrzft+FpbaYhP6AVPJxhmWEusod8jT8XeFcKrQqHq
	n0KkfDU9bGb+963v78+KlC6AfHenjd/5b7U9Q3PQs0VJprf5IuvPuwT3aUU+PQ==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Antonin Godard <antonin.godard@bootlin.com>
Subject: Re: [PATCH] overview-manual: remind reader that meta-poky is a distro layer
Date: Tue,  9 Jun 2026 09:27:16 +0200
Message-ID: <178099000037.200930.13189600528991283921.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6d2c5a08-67b6-58cd-ac67-4cd85805a530@crashcourse.ca>
References: <6d2c5a08-67b6-58cd-ac67-4cd85805a530@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 09 Jun 2026 07:28:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9651

Applied, thanks!

[1/1] overview-manual: remind reader that meta-poky is a distro layer
      commit: 4c57f21b681ca92e89903a79b2404132d5b00f10

