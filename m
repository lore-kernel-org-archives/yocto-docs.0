Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06674C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:45:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16929.1787579151593326149
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 06:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=@bootlin.com header.s=dkim header.b=bsoSMeBq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D1644E4138B
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11CFE5FFC1
	for <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E62D311C7952B;
	Mon, 24 Aug 2026 15:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787579144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TAlgDD8DHxFuXKSOGawYy6iML3rJmVyGFWDiXfyHMuE=;
	b=bsoSMeBq9AGuekk7yXWAcGG2Zc+7Csbn6AeqzMN+4zVY7jRRAzvtbkQ+AIOoOpmAK6szmL
	n5ANUQhTqbwGVsS6zxtkRAwAXHKHyqWzLd6OLTCQuCJA1xeF7tozSSsGKKF+tu1QmCJxS8
	RWWpgfyPiD1JgE3H7fSz+7oIXb6/THoS20fTfi9V3UDXEuhn3H8IERuSMyYBGKwG+bTKDV
	b0Ej25SzH0RTLigAdjedoL+Ost+Joyx4vSp84zuhQS59ecrZ2W6xw8caULn9GLQSG/fHI9
	wK7B4EZsl8B2KoikFBmRfHJWz2izEkVDvP50RxEPqGI4XXEPHUMTRY4TK9Agcw==
From: Antonin Godard <antonin.godard@bootlin.com>
To: docs@lists.yoctoproject.org,
	Antonin Godard <antonin.godard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/2] Document package related variables
Date: Mon, 24 Aug 2026 15:44:17 +0200
Message-ID: <178757686710.159281.8997830012150737972.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
References: <20260818-packagefuncs-v1-0-1f26764cbdd3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Aug 2026 13:45:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10326

Applied, thanks!

[1/2] ref-manual/variables.rst: document the PACKAGE_NO_LOCALE variable
      commit: 6d69a4744a4d1cfa45dafcf5af28658cafe30a1e
[2/2] ref-manual/variables.rst: document the PACKAGEFUNCS variable
      commit: c3e8c602c60bf78123d6a05b83346235abf7f233

