Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40814E6815D
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:02:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8978.1771322543067596987
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Feb 2026 02:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Q6NUn9rw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 674DC1A1030;
	Tue, 17 Feb 2026 10:02:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 351B6606D1;
	Tue, 17 Feb 2026 10:02:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02B5010368067;
	Tue, 17 Feb 2026 11:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771322540; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KllCn8ktLa6zHShfcui3It819pEERJxhZuYQCmQ7iG8=;
	b=Q6NUn9rw9CGL27bD+K3xH5O3Xh9Y399Ho7RH7nCs0lBSDovceqwRxiAK3tCLSEvV0vsYD3
	+vO7DaRBuh5TWTeSb242i/W6hjYJ6VD7EfeQQniVQ09/QUiU0UECL0NrWJIcNHErFxTf4i
	xqUXkYPiMMb2sMM7s7gY8q5nQkc90WiXMYBFWTt8CT0F7/MMDiFRC6oSK5lsMfqJOyHsQk
	1D8FcpNeTA/g+n9sxj9YFSWrYlfAnMcnovTB3E56+jXBbt1GeI7NF2qr46h1unRUfxFANR
	I5VI3im3eZOWV3t6Sdz/+mRS8fbfSgWPZDDrkfJ+u9IRjF3SQhmdiwQiVyQqQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 11:02:19 +0100
Message-Id: <DGH5FOYF4KTK.1VK3DQX1ESCRO@bootlin.com>
Subject: Re: [docs] Links within 'Mega' Manual?
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>,
 <docs@lists.yoctoproject.org>
References: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
In-Reply-To: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Feb 2026 10:02:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8933

On Tue Feb 17, 2026 at 8:59 AM CET, Daniel Ammann wrote:
> Hello
>
> It looks like links within the 'Mega' Manual do not work.
> E.g.
> - Go to https://docs.yoctoproject.org/
> - Switch to the 'Mega' Manual.
> - Click on one of the links to within the document (e.g. "Build Host").
> - The link is now https://docs.yoctoproject.org/singleindex.html#document=
-ref-manual/terms#term-Build-Host
>    and doesn't work.
>
> I tested with firefox and chromium.

I have found that the issue was also reported upstream, and have sent a pat=
ch to
our Sphinx recipe that is used to build the documentation on https://docs.y=
octoproject.org:

https://lore.kernel.org/r/20260217-fix-sphinx-singlehtml-uris-v1-1-763a999c=
54db@bootlin.com

If you are building the documentation yourself, make sure to revert the com=
mit
as I did in my link above for now. Hopefully this will be fixed in the next
version of Sphinx.

Thanks again for the report!
Antonin

