Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E544C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 08:15:08 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web08.18071.1646036106687634833
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 00:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZWt2eaCX;
 spf=pass (domain: gmail.com, ip: 209.85.221.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id l10so4734944vki.9
        for <docs@lists.yoctoproject.org>;
 Mon, 28 Feb 2022 00:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nopwWOFCcJlNGnh6QI2pvgf+RiBKNbumr64dMaTUnok=;
        b=ZWt2eaCXvV7Do6zxtZXVLgh2DjBz7MI3KVM+8lWQFxPh0kPGdn5aH8Xjp8YI1q/SQK
         5BCa9ol5lqRTdCXm/EuYoJ5FD+URPPHNNLgzwNFVV3BaH/za65YqYfKw9Rqii6ywuELJ
         NyYjeaUp8lk9c5Vd/ZZ4LOGHwYdzoMkZUpXmn3341y5sYywJocDeK/AmobIJqUp5kr9T
         zOX2gRHTYc2ycS2kTTHbWPZVCksD3/YQRo2g/vyi0nwJJgVfR87Rfzri0cAqSvY1fRhZ
         +nUtzNtBKuMyO+RsRpxNTLjOROMhveCzDwSU97kcecwQ6eFO3mL934icUbMHcsgX8nUE
         Dv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nopwWOFCcJlNGnh6QI2pvgf+RiBKNbumr64dMaTUnok=;
        b=XZviTohMG80inQUqy834mE8S2Ds7tocnG4xiyJekmmhdQlz8ivWt6TjwVTAJfPHRfZ
         frNkxP7zXghwjDCMKszRhwPjqk6UHkcz90WVVsSEke3clqQuS+HuOAAEPMWCsU1RjV9k
         PxFltj4UpGazFlGTHzi2ZMJHc8NkhTWGCTB0LRLXuw+k+rJEUVAP3QWPBok7JtUhRJ5f
         xI6JNIDyLDg+LtlbF4vECCoysWPJsVIODl6cuW+Ni24b+LMo0Wn0abwQdRXN216DARrm
         4YILUZVixjwC7Gh9zDpA2WhxbkQlEC7l/TepzM7T0HTtAmV22eHxOdxnsHGY9D+60/lR
         8vHw==
X-Gm-Message-State: AOAM533n38D33hyAcQ6jkN+HG1e3+aGl+LrlSOVLsAZZr7OcFo8lIvUg
	ITiZjO2CMrUfAVH7C5mr3/6izZwdvmTRC4cnwzg=
X-Google-Smtp-Source: 
 ABdhPJzQ/IFmucoSccN4fralzhg2keykCWhr8MInCSZswBmR7MbAv6vcCSB2QWI/NA6AfspPqzF+8K7D/oeI+8CEbGw=
X-Received: by 2002:a05:6122:511:b0:331:13b8:b2c5 with SMTP id
 x17-20020a056122051100b0033113b8b2c5mr7451806vko.4.1646036105787; Mon, 28 Feb
 2022 00:15:05 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
In-Reply-To: 
 <CANx9H-Bpvn-_bVqZkgkNGcwWEFZ3cY+B_Ex4MDpjU_cPt-G9GQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Feb 2022 09:14:54 +0100
Message-ID: 
 <CANNYZj_jqMiaRBkpsH+L9iq_ekJ7O37BPeQT2MVCfv6cGgnJ0w@mail.gmail.com>
Subject: Re: [docs] [RFC,WIP] removal of distutils* from docs
To: Tim Orling <ticotimo@gmail.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Feb 2022 08:15:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2509

Why would there be a problem? If you are migrating (old) version X to
(latest) version Y, you need to read the release notes for the whole
chain, including Y-1 -> Y, and those will describe why distutils is no
longer there. If you are stuck with an old yocto, you need to read the
documentation for that version, not for the latest one.

Alex

On Mon, 28 Feb 2022 at 01:47, Tim Orling <ticotimo@gmail.com> wrote:
>
> I have a WIP branch to remove distutils from the yocto-docs, but I'm not sure what to do in the old migration guides that reference the now gone classes and variables.
>
> https://github.com/moto-timo/yocto-docs/tree/timo/drop-distutils
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2504): https://lists.yoctoproject.org/g/docs/message/2504
> Mute This Topic: https://lists.yoctoproject.org/mt/89440967/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

