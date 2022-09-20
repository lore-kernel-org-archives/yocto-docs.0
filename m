Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D09EECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 07:34:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.9042.1663659250996197762
 for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 00:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P6ey3YN2;
 spf=pass (domain: linaro.org, ip: 209.85.214.182,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f182.google.com with SMTP id w10so656910pll.11
        for <docs@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 00:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iQcugTRN+0cQ3ypjYBquepcgzSYY4wcsUYPn2oEE1h0=;
        b=P6ey3YN23kM87GY9pXfDMV8y5Y64XBLsHTJs7WylpuwRksDMPhd7/46sgvm2HM9Qwf
         w3KJrWFUQSm2ATfm78HITRJ61SJ6aYWIeG2An97RaTay6lbylU+buCEcpmd6oZhcQxSE
         VeIxFBkdgVC1+8qGmYm9eKqkluzyJruFI8Dg5bYUlSbKmhnRdOUDZbXHCcz/WYVJUDCj
         z0RtlApQM3SzAqp+eU2tdtA0FE081oxUUzTZa/t/AMGhpSxjTRXSjCLyKGWzlIQLZbSi
         fsRQSmknP2KvnTewSYSVnfbIDLxO69leGVK9Ts2z2zXjyVux/LSzLIREjQvjWIyvmw/3
         mS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iQcugTRN+0cQ3ypjYBquepcgzSYY4wcsUYPn2oEE1h0=;
        b=lkUnLE0qGMxtwT4K+uiyyBVBXG5ccDbjldk0tNX56QqZI5TjGd0z4vZeKfFwD0q680
         0ShP1qzyVCX1HhCe2UA3lW12ebOQpidxVv0kdVdN5Bu+Gb5XaV1fHN01IEJE/C/N4hVd
         /3FYqthjwoPm1xpv0yDLn4CJm4KRDwzMZK/ainF/8Lu/eAAt5Uh+Xt/s2FE0p0P0Coeu
         z9L8wTDvPR9UwxoCvWNnDM8oW2U6ZtqbTUmdJR38HaEnoxPCKEP/UsiaamXFab6L7PIN
         JRR1Mo5MQfKFhX8I/igSLha9WUumUI8fSKM8CJUNb8ASW+IAQtUVK/xJfNQh1PHV5EVL
         rdAA==
X-Gm-Message-State: ACrzQf3NMTzoW6QB3ttY/o2ewNcbBdoRn5KqzpYHM4l33OYOVyn64ofR
	h1jThuP+mAn0aV0l2CwVpqo38iv9RZA6jooMV8bXgQ==
X-Google-Smtp-Source: 
 AMsMyM7jdjOfb4UOdN7KmcKLA8NhJ7WMY2FqdBBkwh6kHOPlKlbjg61BYysrah5lWGQ9VyJWjSuK0nusiBR1AZU6WGo=
X-Received: by 2002:a17:902:f08a:b0:176:b477:8be0 with SMTP id
 p10-20020a170902f08a00b00176b4778be0mr3761162pla.66.1663659250329; Tue, 20
 Sep 2022 00:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220912073221.16601-1-mikko.rapeli@linaro.org>
 <f0c891d5-ccdd-41fb-97b9-ce987818e18f@theobroma-systems.com>
 <1a076f35-655f-bf9a-cb11-8489958ea829@bootlin.com>
In-Reply-To: <1a076f35-655f-bf9a-cb11-8489958ea829@bootlin.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 20 Sep 2022 10:34:20 +0300
Message-ID: 
 <CAJFpGrOS39UfH6gOZ6GpvaKxV9pk4M5FOYp+zhAhEvzpN1NsyQ@mail.gmail.com>
Subject: Re: [OE-core] [docs] [PATCH 1/7] common-tasks.rst: remove
 SRC_URI:append from examples
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: quentin.schulz@theobroma-systems.com,
	openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 20 Sep 2022 07:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3178

Hi,

On Mon, 19 Sept 2022 at 23:35, Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Mikko, thanks for the patch series.
> Quentin, thanks for the review.
>
> Indeed, I think that the description of the commit should be improved
> too. See below.
>
> On 9/19/22 16:04, Quentin Schulz via lists.openembedded.org wrote:
> > Hi Mikko,
> >
> > On 9/12/22 09:32, Mikko Rapeli wrote:
> >> Using SRC_URI:append without recipe, machine or architecture
> >> specific limitations makes the :append'ed text unremovable
> >> and thus users and custom layers can not change the variable
> >> anymore. This makes it hard to e.g. override SRC_URI completely
> >> in a bbappend to update the full recipe to a newer version.
> >> Thus common, reusable layers which users are meant to re-use and
> >> customize should not use SRC_URI:append but SRC_URI += instead.
>
>
> What the following text instead?
>
> Using SRC_URI:append without recipe, machine or architecture specific
> limitations makes the :append'ed text more difficult to override than if
> the "+=" operator was used. This makes it hard for example to override
> SRC_URI completely in a bbappend to update the full recipe to a newer
> version. Thus common, reusable layers which users are meant to re-use
> and customize should not use SRC_URI:append but SRC_URI += instead.

Ok, will send a v2 with this.

> >>
> >> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >> ---
> >>   documentation/dev-manual/common-tasks.rst | 9 +++++----
> >>   1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/documentation/dev-manual/common-tasks.rst
> >> b/documentation/dev-manual/common-tasks.rst
> >> index b08a55331d..3112f9b893 100644
> >> --- a/documentation/dev-manual/common-tasks.rst
> >> +++ b/documentation/dev-manual/common-tasks.rst
> >> @@ -2577,7 +2577,7 @@ chapter of the BitBake User Manual.
> >>           S = "${WORKDIR}/postfix-${PV}"
> >>         CFLAGS += "-DNO_ASM"
> >> -      SRC_URI:append = " file://fixup.patch"
> >> +      CFLAGS:append = " --enable-important-feature"
>
>
> Didn't you mean
> +     SRC_URI += "file://fixup.patch"
>
> instead here?

No. The sample code shows how to use variables so it needs an :append example
but SRC_URI is not good use for :append's. Hence I changed it to CFLAGS:append.

> >>     -  *Functions:* Functions provide a series of actions to be
> >> performed.
> >>      You usually use functions to override the default implementation
> >> of a
> >> @@ -2708,19 +2708,20 @@ in the BitBake User Manual.
> >>      to existing variables. This operator does not add any additional
> >>      space. Also, the operator is applied after all the ``+=``, and
> >> ``=+``
> >>      operators have been applied and after all ``=`` assignments have
> >> -   occurred.
> >> +   occurred. This means that if ``:append`` is used, that text can
> >> not be
> >> +   removed.
> >
> > Pedantic: it can, with :remove. One should try really hard to not use
> > it though.
>
>
> What about...
>
> "This means that if ``:append`` is used in a recipe, it cannot only be
> overridden by another layer using the  special ``:remove`` operator,
> which in turn will prevent further layers from adding it back."
>
> I'm not very happy with this wording, because ":remove" hasn't been
> introduced at this stage in this section. Maybe we should add a link
> to https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-metadata.html#conditional-syntax-overrides
>
> Any thoughts?

I'll send v2 with this version.

I'd like to get rid of all SRC_URI:append's in documentation
since that bad practice already ended in various recipes in poky master
and kirkstone branches.

Cheers,
-Mikko

