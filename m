Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5853CD6E57
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:50:20 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29222.1780321817817923467
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 06:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dAHniIvV;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-516df7b256bso49253351cf.1
        for <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 06:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780321817; cv=none;
        d=google.com; s=arc-20240605;
        b=MD5VO8LCvR9PQ3mPTpuiwKvb7gQiEUGx/dfWP3JLBvGmabwpJpEUnXRhMOgKRmxfH8
         nbToUnfFN1z0w1ivRRZaUzxtV74UOeHCQpj0+3+1Q9TcQ37xWEVqlwD48ycfHp+KhwF0
         lC8H4M2UDop8Ebx7hhdLRN81f/hHIek8YrkI8U9QLfgLZL4/aDbK4wTBh5mOUiteRqwr
         63Jzvp3DFEnGxQG8RTdMZ4yAbNLdzI83RbprooLv7uzSrfqtS27eSHJ3WfBd3phue+9F
         WW0Sbrrebi9JMlu+Yq5yQWad67Dcxv/cjf/KEbC24oXrfXPmd1gjXZ7M7fekBIBOGy8N
         IFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EaqdfggLgajFTdZN0uRkOuUPLhtA3ZUFAHAhEQ57p9s=;
        fh=5aj+No6YTS5NpxDIZ9YeEA+DV1UNQ9kB5C3ikIN78GE=;
        b=VdT7UXPB8j4au6pga+Ac0+u+XUc6DgY0hMQM9gUJfwRm6MbZ5Zz22l08eHhBYw2QS7
         Gi0WxAWt60S+kRRV04yNRsoymDVUec06XA2pGuAWwn8tMYtOfFZOBTDj/1NW5+o5K/bI
         LxADjYLvUkEQkcIs8HnYKy7tNVmeZfhd1ljmjPEBdTacQFaXhTvGUy2z641hQL0T+r+4
         OpcqZo4d5ldpAVm6nToa6LQZb3i8jfqFZWVzNwp17D/zrHl0akUMN7AMv8QWLbJpQAVX
         4H4Klpxvz9y4hyskKhBBvSzCjusU5OpE10URe9caGLJdInHsJuKNeW0lb87KfsQarNgp
         usog==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780321817; x=1780926617; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EaqdfggLgajFTdZN0uRkOuUPLhtA3ZUFAHAhEQ57p9s=;
        b=dAHniIvVP+OQ1WfflV0PYW8FEgX8to/+VLTnq1+2RbJHx1MtBxK0/F/ku/T3OMu0cf
         sa/WwktO3cDdNAmVlhpBnzcPdq83xq6Pi2rXH+RMSkGoX8ByKkEB9d4KthPJH14c67E7
         IdI2lK6iiePzKyCtXLCxhbxDqqkFGmgaPIsPSwdK6bk0VajLoGXIIL8HQ5OjfjrMc+hI
         69gWQ4bzh8yXooniwtpni2TQB/o5qp4Y4+xgfxTMkHgDI5APang1eLE6wN713li5BM+/
         oqireZT1em/2xomFmHctyrlp4xuEytRmSGHwAn2rk9hBGJo4x+BIjHj8HMrqCJdqD8pL
         lthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780321817; x=1780926617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaqdfggLgajFTdZN0uRkOuUPLhtA3ZUFAHAhEQ57p9s=;
        b=OdQw1eq0O2jY/sxuUI1r7f1bcziYGACTWkkHVpU0EXyTfuI9k/TZgGzUZPVkKz7Efx
         EMaHFO/zm0LIg19Kg7FtIUo6j3J4quMnOU+fre2yzzE+Vdp12BCgK3Vhvh9PU/CUmnmf
         Eo6dRl1PytO/5Tv7d0hKQiLoW9My9XE78dHFf31hIO7ARcRqZkPJOMzJyuSQ5NrZ1ALi
         yVbKLT3sLKKpQJlI/U6nk7EkEUrUrORsk9WUiYfq71Fb885ttIZ8d6UXXP4J2398XnYH
         oa/ewImm/BEOW/usGYFqQDXOeEqR694IaUyfso8ka0J/xb4/Ap2KxXDKUJr8i9TYt5N8
         hcIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+H/uL5KjOPjz7ufyaSXOBJoATQblpfGqKHmo/pWASbVwFUQMl2UOzT9qqplgzgyqukZQao@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yx3Cibk4QKI+IPdyD6Ymyq5k+A4BK65kbJEz/PeHKrdKW6ndoDR
	A0HmmIWRfLjFC+BnQnpvNwCMNkYp0RR6p+jWgpjJYDXVGG0i25HaU3+48cIoUsrTPfht6B5W9v4
	xDDd9IG/q3ZvZnJp5Q/et8xR2PcGJkmE=
X-Gm-Gg: Acq92OEAcvSnxuJBLvx5V7UYtlSeLUWhD2eDlJDbDsvHBwXJuSZO/lKQdwDhsFqTsL5
	HcBjXKKgMHyjf0Rog2/6MAmMyPpye0SmDmMYxGlahZ5RNeyqqT2nnenS3z+IegR+TgwCsdLfAKs
	/OpfrMOf7a8TexmRJDgv3hEz+R4qacMd6V+nqCsesxikCywKl2FY6aJj4Giu9EvBd5RAfi6/DGU
	TVQDnp1o5MlswNb7ZHNCm7fU+4uvzx1nBvVNFSr9WuQvmrU7X7w8A63NbsIklWxukhSVpQvlbZ8
	TXAcqWDDUrNGIIrDW5hxt+l9Ob8DeP0MVRUDwZOFzqKAH47rrgFyLRKOzdY1ook=
X-Received: by 2002:a05:622a:1f16:b0:516:d64a:e67b with SMTP id
 d75a77b69052e-5173a82fe33mr153850621cf.40.1780321816743; Mon, 01 Jun 2026
 06:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260529-bb-setup-override-improvements-v1-0-91db62e0149e@toradex.com>
 <20260529-bb-setup-override-improvements-v1-1-91db62e0149e@toradex.com>
 <CANNYZj_iZGyJQo-OrTXfH1rBSxtrQtOcCT9Mfnb3uiBJpwQL3Q@mail.gmail.com> <o2tur4mf7vfsmx2qkizqhhxjnz34vifjtxeschtjvueskuzrcy@5hmfaoevpek6>
In-Reply-To: <o2tur4mf7vfsmx2qkizqhhxjnz34vifjtxeschtjvueskuzrcy@5hmfaoevpek6>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2026 15:50:05 +0200
X-Gm-Features: AVHnY4Li8PheL8nDJ10wOQE209Kfvb0B-Zb6eAwSRXgVUlCataD32rc_nvYXKUI
Message-ID: <CANNYZj-ajQ_2LJnTHMvC82JjtNxLRMPKEJO1ez_Paj6vb9NBdA@mail.gmail.com>
Subject: Re: [bitbake-devel] [PATCH 1/2] bitbake-setup: support multiple
 source override files
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: bitbake-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, docs@lists.yoctoproject.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 13:50:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9554

On Mon, 1 Jun 2026 at 14:43, Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:
> I arrived at this from a real use case. Admittedly, that might now be
> semi-artifical if we don't want the other default-source-overrides
> patch.
>
> My setup idea was to have all sources move, then use a fixed revisions
> override to create a "release" setup at known pins, and then apply
> another override on top of that one to create an "integration" setup for
> CI where most sources are at known pins, but some repos are at latest.
>
> By overriding again, it prevents needing to maintain a "release" and
> "integration" sources override files, that are mostly duplication of
> each other.

But why can't 'release' be a full json config? If that leads to
multiple duplicated configs for each release, then we should pursue
the 'souces-one-of' idea to have multiple source sets in configs.

> You're right that this can easily be managed with other tools, the small
> risk I see is that lots of custom solutions start growing around
> bitbake-setup, but with your feedback on the other patch I also see less
> value in this one.
>
> In short, the expectation here is that people use their own tooling to
> manage the .conf.json and source overrides .json files? If so I'll send
> a patch later to remove the multiple --source-overrides option from the
> docs.

Overiddes are meant as something local and throw-away, and not
something that is ever checked into a public git repo or otherwise
shared. They're not self-describing for example, if you look at the
content, there's no way to tell what is it for. Allowing multiple
overrides that are overlaid on top of each other also makes it more
difficult to tell what would be the final result, it's hard enough to
figure how bitbake variables get their final values, and we don't need
to repeat that :)

So if a certain set of sources is reused between many builds, it
should really be in a config. Bitbake-setup could help with that, e.g.
'take this override and add it to this config' command.

Alex

