Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4539CDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:08:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38302.1782115701418368744
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 01:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0xexcryS;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E4594E405D6;
	Mon, 22 Jun 2026 08:08:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22895601BB;
	Mon, 22 Jun 2026 08:08:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B97C106C89C4;
	Mon, 22 Jun 2026 10:08:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782115698; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6H5nMLp9bmQP9gqhxM2sLewPxsLoBrKL81pdI7Ial14=;
	b=0xexcrySSrhH08RkY08SN4pFNneDNjZllL9OEZFTwErMd93T03AN/wkEBLc0V54IU1HnKa
	3gKJE//NOARx41w6ex0jpUqfnmxnP9ot9bVYhdLbZORko8rasChaprMp/c4uKvsJUS/grB
	aO0AEquKIn4p08zUCcou63q4dk6fDL1NlCNQBxXmnvqzh3B9DSA2Vbq+u4lQXTg5mS+NF0
	DJruR8gsqxDj30fSWBIaH3qmMdieL/0eX7LB021bOdqY/y76DMDtiiZ4BYipqFySDLMdKO
	GtM8icqTSt79bTgumcyLO/IPNSQF/PXkjX/xnKduZxC6qxgyxam/jZkTbZ8bMw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:08:16 +0200
Message-Id: <DJFFAH0IKIRD.23QBL09H3SN9C@bootlin.com>
Subject: Re: [docs] why is Ubuntu 25.04 both supported and not publicly
 updated?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <71a319fc-1c35-c37a-d043-b37048836a8d@crashcourse.ca>
In-Reply-To: <71a319fc-1c35-c37a-d043-b37048836a8d@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Jun 2026 08:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9818

Hi,

On Fri Jun 19, 2026 at 10:50 PM CEST, Robert P. J. Day wrote:
>
> here:
>
> https://docs.yoctoproject.org/ref-manual/system-requirements.html#support=
ed-linux-distributions
>
> "Ubuntu 25.04" is in both the first list and the second list. i'm not
> sure what that's supposed to mean.

It means that our test infra (Autobuilder) still runs tests on this
distributions even though upstream (Ubuntu) does not push updates for this
distribution anymore.

Antonin

