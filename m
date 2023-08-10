Return-Path: <dse@thaumatec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EF3C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 07:02:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.12061.1691650928000479868
 for <docs@lists.yoctoproject.org>;
 Thu, 10 Aug 2023 00:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thaumatec-com.20221208.gappssmtp.com header.s=20221208 header.b=Uq9bmQhG;
 spf=pass (domain: thaumatec.com, ip: 209.85.215.182, mailfrom: dse@thaumatec.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-56518bb1552so433209a12.0
        for <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20221208.gappssmtp.com; s=20221208; t=1691650927; x=1692255727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh7CIVJbwqeOtwbrrgGcF+jALFLsFwYTsW0fwtG9t44=;
        b=Uq9bmQhGCknbZZG0ZPuMUVBCbqhD3K+L//vuh93fFa35E0CfUdILtKWx9vgovHKCUU
         Fu03FOgaPNCenmakO3lqvExct0c9M9LJrQOBV+2CGHrwvCAqsoN3CX1TMU1PN572NX1M
         bd6KCLdhuWUzXJEudF9vm89spIRCf/YF4kmHKvbO2Gr7dw9vXjnMcgJm/1gdDZ9IllYw
         VfsAfMSEZSbycm7C+hvnhmiB+Umsp7OExUdq+ljvUYVRK3+ztoxs+Cd2mrCJdojpiAX3
         ZL6HBH9L8Sp9fumIri7h63RrRUNsNW9WlPzsklbsK6KEBEeR4l2MmeMj+yGby82D+cZO
         ZqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691650927; x=1692255727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qh7CIVJbwqeOtwbrrgGcF+jALFLsFwYTsW0fwtG9t44=;
        b=C4ovzHw9sgiwZ4Do8GHyS3bpoVXPFtCBLuA1ZMrjZGwBePEf8yrHYhDue5eGF8cxQG
         VMf/319VO7E69N/DcrKZTAXIdgmMMiwkvP5CKYtxP96OOF/zPR8J3/FiuFnhhlGKm6vq
         S0U4Y9nvl6VzlGYbR1e70Zk24HbhG97JbqPNHTtWN1M+KkLmW+4VQffm1rUOPc3oPJOE
         RuC0pMau4+dzJHBibtCu7yzHmWJm4OLC/QaGjwsnpbbOgIw0bgJh8vS+7d7UTaurj7iz
         RCgk2YO6qJ/QWb3q6VOeL6N4NxHcOuAYpZk+QTCvFegFhP5a1B8siI7oENnxBednjlhi
         fRyA==
X-Gm-Message-State: AOJu0YxDIG5sum81VFrNKBos7r7Xe99f2ciyVjSotgSYU1j5HG83PgVU
	pc2LXuW7FyE5znWsothxsC1nQDgudYMM1SEn1JMwXQ==
X-Google-Smtp-Source: AGHT+IGNBQp54suLtPmGxX1Sh47Xec8fhyVhg2GzgN0xfylE2Fi99rmCx9l1r7gkhTrTx6QXaGZmYUWEEQLpmNjB4DY=
X-Received: by 2002:a17:90a:aa87:b0:268:d716:4b62 with SMTP id
 l7-20020a17090aaa8700b00268d7164b62mr1194666pjq.0.1691650927078; Thu, 10 Aug
 2023 00:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230808084945.24457-1-dse@thaumatec.com> <7f67ee29-7ceb-47cb-ae98-034ba3c19407@bootlin.com>
In-Reply-To: <7f67ee29-7ceb-47cb-ae98-034ba3c19407@bootlin.com>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Thu, 10 Aug 2023 09:01:56 +0200
Message-ID: <CAHgnY3=qP-mX2dbe+T5i3iZnL188HZCHy7B8DPDy=3esZvP-tA@mail.gmail.com>
Subject: Re: [docs] [PATCH] dev-manual: wic.rst: Update native tools build command
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Aug 2023 07:02:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4127

Hi Michael,


On Wed, Aug 9, 2023 at 7:36=E2=80=AFPM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Daniel
>
> Many thanks for the patch!
>
> On 08.08.23 at 10:49, Daniel Semkowicz wrote:
> > Requirements list seems to be outdated. It is not possible to follow
> > instructions for Raw Mode as not all of the native tools are available.
> > All wic dependencies are gathered under wic-tools package. Some command=
s
> > in the instruction already use wic-tools native sysroot, but this
> > dependency is not specified in the requirements.
> > Update the command for building native tools to use wic-tools instead
> > of the seperate packages.
> >
> > Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> > ---
> >   documentation/dev-manual/wic.rst | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/dev-manual/wic.rst b/documentation/dev-manua=
l/wic.rst
> > index 2a4408cdb..664f07a21 100644
> > --- a/documentation/dev-manual/wic.rst
> > +++ b/documentation/dev-manual/wic.rst
> > @@ -92,7 +92,7 @@ system needs to meet the following requirements:
> >   -  You must build several native tools, which are built to run on the
> >      build system::
> >
> > -      $ bitbake parted-native dosfstools-native mtools-native
> > +      $ bitbake wic-tools
> >
> >   -  Include "wic" as part of the
> >      :term:`IMAGE_FSTYPES`
>
>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ... and merged into master-next in yocto-docs.
>
> Do you think the change also applies to Mickledore and Kirkstone?

For sure, it also applies to Kirkstone.
I was not testing with Mickledore, but if this problem was already
present in Kirkstone, then I would be surprised if on Mickledore
it works correctly.

Best regards
Daniel

> Thanks again
> Cheers
> Michael.
> --
>
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

