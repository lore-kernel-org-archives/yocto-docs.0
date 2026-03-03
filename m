Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B598EEC1446
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:30:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18238.1772544632314348045
 for <docs@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=In6iQF0F;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03D9DC40FA7;
	Tue,  3 Mar 2026 13:30:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 559B85FF29;
	Tue,  3 Mar 2026 13:30:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA335103696DA;
	Tue,  3 Mar 2026 14:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772544629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UYBFA7WAU9j4Ihlz9xLRvaOiSeCdjmRntWnmDmaMYZg=;
	b=In6iQF0F0X/Ovynx9OtVAyMqpatmYsAS9D2WkVB9uAr836dgbdIzNIZPKt7VP4TMfaFRon
	arpVrrCrqUZ0M8ZuOFr4QV8krdYWOVrEfTys8wwzpAI3y/492II1ej5L6gABulxy4JqXEF
	9MhEobqMVRFkdW1owVt+m6xWuBPKNxW0ZUdUFGh95srihjvqjz0fk2CplLYqaR38oiI2vx
	n0vSsOjBoOoIaru8gJUVWvzeIpz85P/MZY3y7wAyIAk9A7HttKG7hDSPe/IvDnW+4ggPDs
	A8G4nOcqMeB831v734/Xa94XYaLyF4CZ80zxUa8lNid8cpFdcSoUq7psjmBhFg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:30:27 +0100
Message-Id: <DGT6MOLXE6N0.121PL435E6W89@bootlin.com>
Subject: Re: [docs] does PACKAGE_EXCLUDE not handle .deb packages?
Cc: "YP docs mailing list" <docs@lists.yoctoproject.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Michael Opdenacker"
 <michael.opdenacker@bootlin.com>
References: <929b18be-e9ac-ad9-b8b2-36f95834834a@crashcourse.ca>
 <1a48de66-a431-451f-ad28-70879392ffe9@bootlin.com>
 <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca>
In-Reply-To: <ea6a195a-ac68-ffb3-5a52-a1af97e3356b@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9048

Hi,

On Mon Mar 2, 2026 at 1:38 PM CET, Robert P. J. Day wrote:
> On Tue, 10 Oct 2023, Michael Opdenacker wrote:
>
>> Hi Robert
>>
>> On 09.10.23 at 07:33, Robert P. J. Day wrote:
>> >    from
>> > https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_E=
XCLUDE:
>> >
>> > "This variable is supported only when using the IPK and RPM packaging
>> > backends. DEB is not supported."
>> >
>> >    i just tried it with .deb packages and it *appears* to work.
>> > thoughts?
>>
>>
>> Funny, I came across this paragraph last week. Thanks for testing!
>> Indeed, the code seems to support this.
>> Shall we change the docs if nobody objects?
>
>   From *way* back in 2023, I just noticed this ... the docs still
> suggest that PACKAGE_EXCLUDE does not support .deb packaging:
>
> https://docs.yoctoproject.org/ref-manual/variables.html#term-PACKAGE_EXCL=
UDE
>
> can someone clarify this?

Yes, I could also verify that deb packages can be excluded through this
variable. Can you send a patch to remove the sentence?

Thanks,
Antonin

