Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89695CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 08:00:52 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3725.1779091242388557495
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 01:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZxC6j9aT;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 66DD1C2B9E4
	for <docs@lists.yoctoproject.org>; Mon, 18 May 2026 08:01:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA0ED602B8;
	Mon, 18 May 2026 08:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88F5811AF8F79;
	Mon, 18 May 2026 10:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779091240; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AejJRToJqRrQFt6OlKCS9YSd3pbFRYc515FyF1PQgA0=;
	b=ZxC6j9aTvQwUrBy59Lii4zi6/CSeM7PmGNf+jYZleiYb8rHQug2SnNeYe2BnhHIA9yMRxO
	3WlNUoe6O5qbLT0LJnu90/zLJvrp5AoLonn5OyN/26dJ32IgYotAZJuyMGrjzQdFkIP+pb
	P0gZecyzRMdEtGObmDC1kABfiqvNBHRCMnNwYW22NhSXvHqOPbRbR7aUkWUZW3HXvtwbPH
	POTvA2co0wjhDmWz0KoPtb12G61WnplXKzjQiWai4yoG2JFP7xEGttWlwigx9GJUBvjRWI
	rF8hYqYTp+PXO49AWgl7YZuK4uzN3h59Gj+ts9IgHDaJ3wyHBhA6f2pBn/Szxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 May 2026 10:00:38 +0200
Message-Id: <DILN7K1ZZS8C.1ST8N1Y1EX58K@bootlin.com>
Subject: Re: [docs] [PATCH] YP Quick Build: use "set up" as a verb
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
In-Reply-To: <24bc012b-dc44-ca34-b3d0-b08200bf77d8@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 May 2026 08:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9475

Hi,

On Fri May 8, 2026 at 9:14 PM CEST, Robert P. J. Day wrote:
>
> Pedantically speaking, the difference between "setup" and "set up" is
> explained here:
>
>   https://grammarist.com/spelling/set-up-vs-setup/
>
> - "setup" is one word when used as a noun
> - "set up" is two words when it functions as a verb

Thanks, I think there also cases in the Bitbake manual.

Antonin

