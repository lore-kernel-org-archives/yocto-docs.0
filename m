Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADE1CF34B7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:45:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8606.1763563527325945711
 for <docs@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 06:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mZ/Wxd/y;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B31B8C11189;
	Wed, 19 Nov 2025 14:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE11C60699;
	Wed, 19 Nov 2025 14:45:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2C3B10371A6A;
	Wed, 19 Nov 2025 15:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763563521; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BYV98AJ/TMlat73RQ8BKLdQos8X3H1ZL6vdd8Vugao8=;
	b=mZ/Wxd/yJDT4fG9Th/m2If1JWnDNTNcQubG0qDqp+v4WOZKhQvt463nOpzJ9Psq5sHjjKN
	03bs9/nBi+jRrzf3zo3PKJh3IucCoFgG8cvbg3KALcpVeRkvYIJL6uT9eEzXEHcxApT/nb
	a2El6lG4ziOnu0xIIMYJ3lsul3h2M6MVSxBWZ1TBiiN93AaecXpPo2GxdTwirHYicnPowM
	nS/K7UjeMjw1nKrg7+/VSkPkYBrlNDMjFuONSFTlemqDn91q5f2etKEKjUTUfKpWbmqpnl
	X9BLL1i2KLihn4QLMd/Azzu38RQP0OaVCPqNWftCQO3lkNYKYPhDR5Z/0URRKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:45:20 +0100
Message-Id: <DECR3CN1EBY4.X2BVV7QAJRYE@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
Subject: Re: [docs] issues with "bitbake-setup list" command in QS guide
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <b14e403b-0c5c-2adb-e917-9a57860dc721@crashcourse.ca>
In-Reply-To: <b14e403b-0c5c-2adb-e917-9a57860dc721@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 19 Nov 2025 14:45:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8086

Hi,

On Wed Nov 19, 2025 at 3:22 PM CET, Robert P. J. Day wrote:
>
>   i'm thinking about why i don't like the early part of the qs
> guide, but in this section:
>
> https://docs.yoctoproject.org/dev/brief-yoctoprojectqs/#use-git-to-clone-=
bitbake-setup
>
> the note about using "bitbake-setup list" to get an overview of the
> settings does not end well if you're not in an initialized directory.
> perhaps the command should be:
>
>   bitbake-setup settings list
>

Indeed, thanks. Will send a fix

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


