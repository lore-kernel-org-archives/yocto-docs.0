Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05677C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 13:20:05 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.43870.1710767998373005443
 for <docs@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 06:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RZb8A4cZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d2509c66daso62218761fa.3
        for <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710767996; x=1711372796; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ltq61nv3ZUOnePteRuBUQkM88IWivvIDwzub7/dU93E=;
        b=RZb8A4cZ+QiRqqNP4eWDeeaq6/V1LnPZ1cKLQRfu+gBM5maJ4RPaOpmk8juvjYPKPF
         sBghvA4YnNG+5yBWOfJAcZ3v/TWP1Cvvdd8YbhYZNXwK8ZfLm1ks1VqYdMiyzryKnihI
         Utgy5+BHta/7RVhuw2caCIrL+jkROuPKmvUqBHWhf6c/ZvzjAFCS/ohncKeYgISQLQ2M
         k7IilVK5IL4251Zhuc40kNacIa4vuVHiIbza1TAei34VRRx+1dq0fMGAvlnGs9ihTjTp
         qh2snNx4RsptJaVtoFcTeS7UWliVooZ9OYZl0KJ56+/T8LPHjA2OW95DAPEj134DPpq7
         TL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767996; x=1711372796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltq61nv3ZUOnePteRuBUQkM88IWivvIDwzub7/dU93E=;
        b=wWOf8j9C41oN7F8qX0c80aCJ/X1Z2l0SXkUzNzy4QGaZOUe0ph60eh0pBiu50KkqoA
         D/QLZUwT2oqKYyzP+HXylpZotNTrTyRYmISQfD5Z9LBSiw8nysottqwS6Wg6HXK+qjOQ
         q3mWIW4ixV3Rq6ty/Sql93oP7ZSThCmyA0tvO62BKJM/1fRZPFPiiXl20faywnuVTCbI
         1Hdm4lh00pwtn9DZ0KMLss+mki+1qm4dhdKRXrRGrdO3hZXOsxEnSx6go2AN6rp8vl1u
         g3fkpFpHX6pbADdvzNAo5Oei8UrnspYLXSe44jOINd3N16O6CWB95G9DIgzikH0H8UPI
         2jMw==
X-Forwarded-Encrypted: i=1; AJvYcCXlfoTdTWajhGt0T5FsbFX0jy1oAjt3+noqy/5jNB1Yo+/5i/Iaa0AKdKpFCAqoA7EnIRo1/qDeQ4dimJQJRqeAoM6zFM85UpbgDZY=
X-Gm-Message-State: AOJu0YxMwlOot28IJgn5wzW4Gyz0sK3AuN+u+mBcNcRONUnZfms3JOuv
	UEvi1LAFrhY2U5NmwQjfGFuxeheUysHpP7Q/GSoBS3LPZuf10ZANAtGA7p8yaNFBS+oA5xBMz05
	q0cDj/xAS58ykUAx4klECJUEgnXU=
X-Google-Smtp-Source: AGHT+IHOZHF3Ko0y126RSkJjz/aeJJBwSPjXLfMkL4CwGk8V3Q+Wxl5eA4KAbjwLxHxkDbyuW5etEmDVo87L9z8iqqs=
X-Received: by 2002:a2e:9243:0:b0:2d4:a041:874d with SMTP id
 v3-20020a2e9243000000b002d4a041874dmr3212407ljg.48.1710767996283; Mon, 18 Mar
 2024 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <f53c085e-3d24-42d3-ba62-e1c543311dd1@bootlin.com>
In-Reply-To: <f53c085e-3d24-42d3-ba62-e1c543311dd1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2024 14:19:45 +0100
Message-ID: <CANNYZj8KxPxPxmLDQrOgMAXo8csysaz6u4Upd07=MCv23M9D9g@mail.gmail.com>
Subject: Re: [OE-core] Call for contributions to the 5.0 release notes
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 Mar 2024 13:20:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4985

So I have looked through my commits over the past year that
*definitely* need documenting, and identified these standouts:

- https://git.yoctoproject.org/poky/commit/?id=63e53fb8b60d38315015844bd3357fa1649cd639
"build-sysroots: target or native sysroot population need to be
selected explicitly"
Easy fix to existing docs, will send asap.

- https://git.yoctoproject.org/poky/commit/?id=2187e823ad66eaaee6a4ed7d748f2c68028a45e7
"selftest/sstatetests: add tests for 'bitbake -S printdiff'"
This functionality needs to be documented; a review of whether there's
something for bitbake-diffsigs (which is related) is also needed. I'll
do this after the first item.

 - https://git.yoctoproject.org/poky/commit/?id=6f29e2319cf8f6124de4998e887efab90bc63ba4
"meta/conf/templates/default/conf-summary.txt: add a template summary"
Needs to be documented everywhere where config templates or config
template descriptions are mentioned. Also on todo list.

- https://git.yoctoproject.org/poky/commit/?id=c390b2e615930b60db0d7f3e72d056e0c67ef5bc
"oe-setup-build: add a tool for discovering config templates and
setting up builds"

This was added to master very recently and documenting it is pending
an important fixup:
https://patchwork.yoctoproject.org/project/oe-core/patch/20240305073749.4133403-1-alex@linutronix.de/
which I hope lands in master soon, but for some reason isn't in master-next.

Alex



On Fri, 15 Mar 2024 at 09:12, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> Greetings,
>
> If you contributed new features to the upcoming release, or if you are
> interested in figuring out what's new in 5.0, that would be great if you
> could help us by submitting bits of release notes about them too.
>
> If you are familiar with the Sphinx / ReStructured Text format, you can
> directly send patches against the yocto-docs "master-next" branch
> (https://git.yoctoproject.org/yocto-docs/log/?h=master-next). However,
> I'm also happy to accept raw text as well and format it or even
> elaborate on it by myself.
>
> We may also need proper documentation for the new features, not only
> release notes. I am thinking about documenting the new variables in
> ref-manual/variables.rst, for example.
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197128): https://lists.openembedded.org/g/openembedded-core/message/197128
> Mute This Topic: https://lists.openembedded.org/mt/104943580/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

