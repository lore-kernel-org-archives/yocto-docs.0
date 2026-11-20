Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1990.1795162379444365015
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2026 00:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EHrx+d3v;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 439ECC2F4DE
	for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:12:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A616D6017D;
	Fri, 20 Nov 2026 08:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD6F511BC0CF6;
	Fri, 20 Nov 2026 09:12:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795162373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/eb0UnfK4xF9PHeWmhppwD6Cr/C3afbrMhtsEQfXO3M=;
	b=EHrx+d3vGNvkYgce9LPANrYkiXRdRPXeNWe2huMUOCftkiSaKBRGZBX5j8h+37OAwMsw0m
	mV00ZjC/XPnM+kMKUJh9zsZnGECDXnikr6h+jFE7n8KyxxKHQRiEEyeyf8wnq46+YuXrUW
	TN0QV15VA+e6yflrw3D9X64sRv3KNw1tXtqxBpWhyRzNOj7QgEHlCh3s3aElMuezFzDiXB
	r7062DrdU/5IfiWV7A5J1kPScTgY7ld4X/z/rktOqOsr+U1HHZTiQjYbzTESUhb0yl/Vdl
	oXP0EGhL0wL1BRGw4tDnN8o2WERE08dFTEEjq4nf3wLc2/mIXVIHCnK+oFlPnQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 09:12:51 +0100
Message-Id: <DMZVY8QI1F0T.EY4UOFTM4UZ6@bootlin.com>
Subject: Re: [docs] [PATCH 4/4] tools/gen-releases-svg: simplify tempfile
 usage
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <quentin.schulz@cherry.de>, <docs@lists.yoctoproject.org>
References: <20261119-gen-releases-svg-fixes-v1-0-b6245fbf8294@bootlin.com>
 <20261119-gen-releases-svg-fixes-v1-4-b6245fbf8294@bootlin.com>
 <758fb30a-350d-4e4a-8646-46363475ebc0@cherry.de>
In-Reply-To: <758fb30a-350d-4e4a-8646-46363475ebc0@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2026 08:13:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10807

On Thu Nov 19, 2026 at 1:59 PM CET, Quentin Schulz via docs wrote:
> Hi Antonin,
>
> On 11/19/26 8:55 AM, Antonin Godard wrote:
>> We can directly use tempfile.NamedTemporaryFile() to open a temporary
>> file and use it for the diagram passed too mmdc. Make sure it's flushed
>> before mmdc reads it. This simplifies code complexity.
>>=20
>> Suggested-by: Quentin Schulz <quentin.schulz@cherry.de>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> Reminder for people trying to review block of codes which are only=20
> reindented, use:
>
> git log -p --ignore-all-space
>
> to see only meaningful changes (though be careful with Python as if only=
=20
> some parts of the blocks are reindented, the behavior will change!).

Good tip :) I use git-delta[1] in my mailer to show patch diffs, which also
helps with that

[1]: https://dandavison.github.io/delta/

Antonin
