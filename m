Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6DFD167EE
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:39:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6867.1767951556675507721
 for <docs@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 01:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SwYFOWUK;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0EA01A273D;
	Fri,  9 Jan 2026 09:39:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96E6360734;
	Fri,  9 Jan 2026 09:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44898103C8865;
	Fri,  9 Jan 2026 10:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767951554; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0a8/Se+kV+4RWMiYV2LZ7GoSwWhMPvppoQW9eZMlOzQ=;
	b=SwYFOWUKFJxDBw5ldp4UgFJCOutZbo02qfap6ueUMJFNtLI24Ub2EJSeYYBJqP/HL7lAix
	JD2zY1gK9B1BXD0lSqiLs7XBq1Nl6u5xLz/WvgaFhHR7JZRQEP83szY7jjms3jB1l3Bn0A
	+kUeDzh6ky+A+WUFN6IuD3zS2aruZOxSI4KKR200WIg2z6eS/ZdJv9mblyDzx1dMYby81m
	PNjpXhGmPpyKn01VxS1WjL8FmExxCmI/w8uSlDULpDN0XPL9HALPJgzOKULq4VrLrf0Lk2
	vI+1eQVgKylsGdTleGx2DAhitwaafFTg8xLeekot9IBMp9vdtyuK/y8tiKcysw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 10:39:12 +0100
Message-Id: <DFJYIQV433MB.1DVI67253GCB@bootlin.com>
Subject: Re: [docs] is there any way to render content in italics in a code
 block?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "YP docs mailing list"
 <docs@lists.yoctoproject.org>
References: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
In-Reply-To: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 09 Jan 2026 09:39:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8442

On Thu Jan 8, 2026 at 10:33 PM CET, Robert P. J. Day wrote:
>
>   one aspect of sphinx that gripes my wagger is that there does not
> seem to be any easy way to tag something in italics in a code block.
>
> here:
>
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-execution.html
>
> the code line:
>
>  $ bitbake target
>
> really needs the word "target" in italics to show that it's meant to
> be replaced. and, no, this isn't minor nitpicking -- the whole section
> on overrides desperately needs to be able to show what things a
> developer is meant to replace.
>
>   is there any way to do this?

I don't know but the best bet would be to find a lexer capable of doing thi=
s in
here: https://pygments.org/docs/lexers/
As those are the ones used by Sphinx.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


