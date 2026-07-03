Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64109C4450A
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 11:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91454.1783079102014249421
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 04:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=HJHJ5AZh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 14BB3C49F58
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BBA860300
	for <docs@lists.yoctoproject.org>; Fri,  3 Jul 2026 11:45:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD291104C94AA;
	Fri,  3 Jul 2026 13:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783079100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UqefpypSzfol38jZpZL6jdLiA1sFo1oATEEWUbChfg=;
	b=HJHJ5AZhvkoK0qJgGstzOFjZAm3Hst98UObRN4xwwi3Dc2pkrRZMNgqvQyr9Zvmi/zRs94
	pcxaZWzLW1S1uqrJC3/t7ftbU8OpbQOWL25eqfeVEspd0+ak8tKgAYEEYfiHRufHQ8C3tm
	s6wpAE5yGqy3xqZOLNK8lgE/AHsecfynGpXy9sUpPQ/FvAmd1dntsYjqKiTHOb2sBv49wa
	eQvDDnAu98LwY8+H9c/YBf+EyLGc9I5swMml41uOiEnST9c8BHcdtd4WXjF4JFsDvyeh08
	xauFs2iTAFlw34ivuI62+0iHMQRqivX1xGmq5z7DbEx+Ad3e7JeW63A8cgoEfg==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] tools/update-documentation-conf: remove
Date: Fri,  3 Jul 2026 13:43:35 +0200
Message-ID: <178307887474.248663.9366948369166907216.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701-drop-update-documentation-conf-v1-1-23e88cea8808@bootlin.com>
References: <20260701-drop-update-documentation-conf-v1-1-23e88cea8808@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Jul 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10021

Applied, thanks!

[1/1] tools/update-documentation-conf: remove
      commit: a26606bcd05313c6519438e1fd7f13e16a03d201

