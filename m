Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89441C982FF
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:47:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5492.1790066832634159207
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Sep 2026 01:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gW5bFpHz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 67F644E40FC3
	for <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 08:47:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3979160580;
	Tue, 22 Sep 2026 08:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B32661032820E;
	Tue, 22 Sep 2026 10:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790066829; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bM/i50sROZNmUt0DXEC/rwBWNZ2nmHuup275Ne6MhsI=;
	b=gW5bFpHz8xi9kUO9B25ClRJbtihIPpbEwRbQJ/nGHgTl6Un2hPiPRT6sOJJAtOidVUhJo7
	G7rnBqN7dym+JenSAX+aHIq4F4pwLlgA9sbBBsNC3Slo10A854LQeQaib0O2eN7HNLugVg
	nT0Ju/IGeI6btgncp/Gntguc7Mmehyj4jwDWHpp8HWy/cokCEpLxG1BVP2FxRio2KkUSfg
	EV2FSbCNYBKvpv4CbFdGKJCx4guDuH6+kTqEhENMH554Jz4QjTtK2q9QnBWwbkDrsrEuRM
	NYYtvwTZ4sP0QUP6NlguzasOMXxJYEtND9b+vDtRffHcCovNAa4To76bxqjo+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 10:47:07 +0200
Message-Id: <DLLPQC2GSTR8.2EVI8ZYZL5J1E@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adrian.freihofer@siemens.com>, <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH 2/4] conf.py: enable sphinx.ext.graphviz
 extension
References: <20260911150750.75697-1-adrian.freihofer@siemens.com>
 <20260911150750.75697-2-adrian.freihofer@siemens.com>
 <DLLP3P6UGBWU.5MIE87WD6FE@bootlin.com>
In-Reply-To: <DLLP3P6UGBWU.5MIE87WD6FE@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 22 Sep 2026 08:47:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10575

On Tue Sep 22, 2026 at 10:17 AM CEST, Antonin Godard wrote:
> Hi,
>
> On Fri Sep 11, 2026 at 5:07 PM CEST, Adrian Freihofer via lists.yoctoproj=
ect.org wrote:
>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>
>> Required by the .. graphviz:: diagrams added to dev-manual/devtool.rst
>> in a following commit.
>>
>> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
>> ---
>>  documentation/conf.py | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 48d28a686..7144d6db1 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -48,6 +48,7 @@ needs_sphinx =3D "4.0"
>>  extensions =3D [
>>      'sphinx.ext.autosectionlabel',
>>      'sphinx.ext.extlinks',
>> +    'sphinx.ext.graphviz',
>>      'sphinx.ext.intersphinx',
>>      'sphinx_copybutton',
>>      'sphinxcontrib.rsvgconverter',
>
> In order to add this extension, we also need to update our standards.md d=
ocument
> to mention the usage of these types of graphics (under "## Adding new
> diagrams"). Also, we need to explain how to edit these graphs - did you u=
se
> software to create them? Which one?
>
> Unrelated, but your series does not apply to master anymore, sorry :/ Cou=
ld you
> rebase it?

We would also need to update our host requirements for building the
documentation as this extension requires 'dot':

  WARNING: dot command 'dot' cannot be run (needed for graphviz output), ch=
eck the graphviz_dot setting

So this makes this addition more challenging, as we'll also need to update =
all
Autobuilder workers to include graphviz. It's possible, of course, but it's
going to take some time.

An alternative I've considered in the past is the addition of the
sphinxcontrib-mermaid extension[1] to our docs. The main advantage I see us=
ing
this is that mermaid diagrams are much simpler to read and understand when
reading them textually, so also more maintainable. It looks also slightly m=
ore
modern, and has more possibilities, like having our own color theme, etc. A=
lso,
as far as I've tested it, it does not require any additional host dependenc=
ies,
it is self-contained.

What do you think?

Can your series be re-sent without graphviz diagrams? And we work on refres=
hing
diagrams separately, later.

In any case, if this series needs to be merged before 6.1, it would need to=
 be
one without graphviz or mermaid diagrams, as both take time to integrate.

[1]: https://github.com/mgaitan/sphinxcontrib-mermaid

Thanks!
Antonin

