Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6757C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 09:14:04 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.17774.1752657238759805553
 for <docs@lists.yoctoproject.org>;
 Wed, 16 Jul 2025 02:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7Myuroq;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ab81d016c8so23387611cf.1
        for <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752657237; x=1753262037; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ddQo7OFSr50ieyf/IZ+wKONFew0P2xP6u5V6GoCvzzY=;
        b=N7MyuroqZnz9lCjhN85i7f5gUYyBSwkWcyXw4d/3z2ZZiFeIBvDjCl7X7GL2HKrDyG
         PJLwY/AnZltRkLu4B51o34sgigzb7cJ1yQYZwJOEUQnT2NlYVZsEfUzuiITJuL4G8Olh
         LvDUCuDXnSsHcN2MPIpjHw/Lb2xkuaPUu0wMTzW1IYS7/C29Hu26IMKhHirY/FHYwl94
         +ACb4frjqmEchNWoMQlSXRVIrGx+Qt6zlhjaWAnxDuvlWfbYPuJSeTmGg6ItBPyNs4UI
         MmoU5PiiYw6nxp78L2PJ8djKAWYrxm1ELGodOYGfEHx0hztxoK7yHGG0HH/wkJgd1Ir8
         b+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752657237; x=1753262037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddQo7OFSr50ieyf/IZ+wKONFew0P2xP6u5V6GoCvzzY=;
        b=tSpL+YK8bYS7eQiHGPIkLbDm/EEKzVVirSxn8npkplC4GLq9QgOdAvSp3Ig0emM0Kw
         ge38KMghP5Rv4ay0Wn1EJ7gFZq9YgW6Oil3WkLQe3Q2GGp3Uv+FC126Z8/kNvo2dju92
         KTtub6FXDHHWPTEiP0rLlUBIcOGjcUbQvbz0PIyFKwluigyYluuNyaI33ghssyk7xMez
         g/KK2g3C2ak9riEDiKktfmnaU66/GOhii1fXWh+1F+dNRZ9F529FiojS5zzQCG1rPgud
         +qWRriu7ZnLVYmEc3Mx36lRSUKsv9MGk8b9+EPV5ASKjkI//5tTrirZVsSW6FacOXwjc
         OLkQ==
X-Gm-Message-State: AOJu0Yxr5OyFfqrJoFmSF59oHsCC81FbWByElIBIegjbejuvvp6bbXj3
	ootVoVsM5YZKJwiQiZ2X88NM4o07wx7GaHnMfYUScMw0J/PWBWoyeQifa+EVcMq8k2kMabKOo5u
	eTkvusZUWot1qRMs6fp4I6vxWDwsIEAQ=
X-Gm-Gg: ASbGncvA7r7peEm264NlCphYLt3bHU8RONbe0W6ybgPZ55VTkg+L0p1brncPBhBYM7Z
	2hejEcEZcrFHJ64iEaiWVvKWvok8UP+TqZM/HdoOMG3Icia8/96aYG7LSItlSZRRUBlDxBpKRi0
	xe31UzNgV/mU9f+UbuDI5rDxYFWnA9a9+O6vZBbdZX2g6WeGyfVl3+OHcu7DLl6BLMQh3bk7CYj
	MhM7u0X2hDKoZETwqlVGBeTYLOfTXu6iYnJQBC8FUaVtkJ85hc=
X-Google-Smtp-Source: AGHT+IHq+Le07RX/992IKbQI83QsMUhfdhptFJnh/6hcwhdSSTo8kAmT7m3amsETkNGkSkKlMbzp7ww4ceCWayhMVXQ=
X-Received: by 2002:a05:6214:4413:b0:702:d0d8:5165 with SMTP id
 6a1803df08f44-704f6b70f11mr23683466d6.43.1752657237531; Wed, 16 Jul 2025
 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250716-remove-local-hashequiv-setup-v1-1-e2c80b0bfb24@bootlin.com>
In-Reply-To: <20250716-remove-local-hashequiv-setup-v1-1-e2c80b0bfb24@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Jul 2025 11:13:45 +0200
X-Gm-Features: Ac12FXz7NFDdyTHTbewLb8Fj6A0R5-1FOmOC33T5e15t5mil1VzjZ6pnLAremnw
Message-ID: <CANNYZj-Wn8+y_EzfZFOb2f1wO7ZCWaKekC0bntrwcJ1Z+2kHLA@mail.gmail.com>
Subject: Re: [PATCH] dev-manual/start.rst: remove basic setup for hash equivalence
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 16 Jul 2025 09:14:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7343

Thanks, I think we're good now :)

Alex

On Wed, 16 Jul 2025 at 11:10, Antonin Godard <antonin.godard@bootlin.com> wrote:
>
> Quoting Alexander Kanavin [1]:
>
> > 1. BB_HASHSERVE and BB_SIGNATURE_HANDLER do not set up or start a
> > server, they set up the hash equivalence client built into bitbake.
> >
> > 2. The above client configuration (used by poky) also starts a private
> > server that is specific to a particular build directory. So hash equiv
> > information would not be shared between multiple build directories,
> > and this will cause sstate mismatches (as reported in the bug), if
> > sstate is shared.
>
> This setup does not shed light on the potential of the hash equivalence
> feature. So for now, remove this basic setup, and later rework the
> concepts (or create a new) document that explains how to set up a hash
> equivalence server shared between builds.
>
> [1]: https://lore.kernel.org/r/CANNYZj_kvLsZG3sgH+nPu9B=pqWBU785w0SGHGdQqB4UW-DtmA@mail.gmail.com
>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  documentation/dev-manual/start.rst | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/documentation/dev-manual/start.rst b/documentation/dev-manual/start.rst
> index e10367752..f34f0a9a9 100644
> --- a/documentation/dev-manual/start.rst
> +++ b/documentation/dev-manual/start.rst
> @@ -228,12 +228,7 @@ particular working environment and set of practices.
>         used by developers in the same organization and share the same
>         source directories on their machines.
>
> -    -  Set up a local :ref:`overview-manual/concepts:Hash Equivalence` server
> -       with :term:`BB_HASHSERVE` and :term:`BB_SIGNATURE_HANDLER`. A basic setup
> -       would be::
> -
> -          BB_HASHSERVE = "auto"
> -          BB_SIGNATURE_HANDLER = "OEEquivHash"
> +    -  Set up a local :ref:`overview-manual/concepts :Hash Equivalence` server.
>
>         See the :ref:`overview-manual/concepts:Hash Equivalence` section of the
>         Yocto Project Overview and Concepts Manual for more details on the hash
>
> ---
> base-commit: f9f1c87424d307d2df60024bc448bd6778605cf8
> change-id: 20250716-remove-local-hashequiv-setup-6c2880dc23fa
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>

