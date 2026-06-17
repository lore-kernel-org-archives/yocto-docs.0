Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EDFCD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 06:53:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9579.1781679181155833578
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jun 2026 23:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=a96qmuYx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 81A5E4E42F25
	for <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 06:52:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47AFE601AA;
	Wed, 17 Jun 2026 06:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E993A106C82CA;
	Wed, 17 Jun 2026 08:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781679177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eF/YYrdyZM8zZd9r0/OKsjoK4dqgLRESLscHiPVVZSY=;
	b=a96qmuYxfjFPnaOkWeBPMzA8+gotY+PXCFDD15ZLRFfJDpldkYLijpet9zJVcPZsOoWM7x
	eabhUrSMlhLn/9H8b7Q7NoYOD5AlbUa28NpXfegSUYv7sHlTqIW6cl3TQql/SisZShamI3
	2lD9l9P1/PAKmeFXrlSWheVqCdQxOMg5OriZciBRyEOE5EQlP987mQU8mqxKlaeQnzVEud
	SkQx0OkAZ/2oW3TFHaj03xAITbq4sE/R/4/3GT/KxOmsqBf5bdPAt61TQZikxFy3pGUTN/
	SY0UKgvL6jVXYRrr6a4dQJ5qd6HeQ897qo8KOHw///piHMF8IzvusS/pOiXzkA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 08:52:56 +0200
Message-Id: <DJB4K286HMFE.1L8FE84O8O1FA@bootlin.com>
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [docs] [PATCH] test-manual: add more detail to the ptest
 section
References: <46ed8884-f3d1-ee7d-1da6-a73a6e07c74c@crashcourse.ca>
 <DJAKAL8C465B.CTTNV2GIAZN0@bootlin.com>
 <e97c27a8-5a12-2384-7a85-c974bceb428b@crashcourse.ca>
In-Reply-To: <e97c27a8-5a12-2384-7a85-c974bceb428b@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 17 Jun 2026 06:53:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9768

Hi,

On Tue Jun 16, 2026 at 5:51 PM CEST, Robert P. J. Day wrote:
[...]
>>
>> You can also say:
>>
>> """
>> You can list available ptest packages with:
>>
>> .. code-block:: console
>>
>>    oe-pkgdata-util list-pkgs "*-ptest"
>
>   And that will list *all* generated ptest packages, not just the ones
> you select for inclusion, right? Just want to be clear since I'll word
> it something like that.

This prints the list of ptest packages currently available from the local
package feed. Maybe add this precision yes, thanks :)

Antonin

