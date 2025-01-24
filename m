Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C306C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 20:28:50 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.2579.1737750521825296093
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 12:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WsXHHVfU;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46783d44db0so23551421cf.1;
        Fri, 24 Jan 2025 12:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737750521; x=1738355321; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aIhuxWBKUA55p1JACv97TpnCRlBvPOQfe6Oc2hESiZ4=;
        b=WsXHHVfUXg9IXdD9flBGI1DGucZHQRYsG8Aryo9k4sX1MP4uJz9xG3mAsdt2ePFoWJ
         AVj3NuQ2P359A/4lgnDbWKJ4IhjOf3MzRYNDpaBzr2DzrZ7IyhJLeJXeIRZQJL4rGWGm
         5N1S/zSGVFkA9GEu6UDuljZ4i/hmlkgJmZWvWN5X0iM9T2pSyWuioiTwQ/gUCPDr/7+j
         ZdhXarwuFniXDJJSnkhcvkLt8Ine7XaXpRUZne7I4VCOAHPNHEJWqQOIld/QZyjNFqjd
         hjZmngBpAt9EsZeK4Z2kcx4TVGsBJQ7hLv3Ab2x81GIa/qxvjNAVmwiDKOXkJdx8F3an
         5qqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737750521; x=1738355321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIhuxWBKUA55p1JACv97TpnCRlBvPOQfe6Oc2hESiZ4=;
        b=fr7P45u6JSMfsFsESi/e6IU34dwqZRPH/ovFyHIaDen1PtDuSHAG8k/FuA8qS+X/xM
         o1f6/X1iB8EXV1/+wsnkJTbIIAlJFLdTMriphNXrUEg+DNRoG02XBgbyqwP12Moan6Rh
         9FcwOAfIfcacnasrJsDIyt7hpkGAFxBH+8tAnEA7eCt8SKkLX2ShyzZkU0YSDRm7dqqJ
         mQ+p+tUQD5nwIs01TEgpb2OJDK1bhinYKbwbiXL8GbMBIlic+XxoKzuTXIZ619mqRsW1
         02ekM7sftZZH3kAChAH4FKs+DPpJvmaXL41n4ctbfkDC7DCg35JPuJ5FTlf68I71FAq9
         M/eg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqUSe11e+ln+1OqfcQZJjaJIk7S1/usjWBnEvcueqG0P1x3SLEKuL5Tz9t4NT2OlrzWU=@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyH25HeFFABF1blw4vn539wzSGFCqZcorUdjrM53FUmMMCOWMEY
	1i7vC6dFp5arWdxe9HgD1LoGyFReAJhypmQw1N3RwQAy+F0H/Z0Y3+l/7pAiQo8Q5agb79u2xuE
	aGygTKYv4AvxzK6fnZDv8utGeWG8=
X-Gm-Gg: ASbGncu1CS0mtC8xbYcoCXRM+LpN0WQnjDQEMbGZywFWvOX5gBMp5kSGCO5fqdkYtsR
	EAdxciY7E3XnnxOKkt8kpDNumX3BAFKxYdGFD43rQto3P6RTqlgKuBWBroGFD7MMVPqQPRbBfjO
	1gJOwEcavwDBcz4MbwB8ha
X-Google-Smtp-Source: AGHT+IHNBjBCfQq+OTRe0I4cWjeD8GAwwaw0JRqItnNT1xk6lX+TIMYpU81D/jw+UktSRB0vWLkMnogsRG4CaShZTnk=
X-Received: by 2002:a05:622a:180c:b0:467:5d7f:c683 with SMTP id
 d75a77b69052e-46e12b75dc2mr411636431cf.34.1737750520815; Fri, 24 Jan 2025
 12:28:40 -0800 (PST)
MIME-Version: 1.0
References: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
In-Reply-To: <4d28594d59069ca0dc8c6a04db71b934acb572fa.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 21:28:30 +0100
X-Gm-Features: AWEUYZnfjjfJ9ztXh7nWoeOoQbl2SC-2y8MlarvvPY7HAE0CPdg01-yN6yZR25U
Message-ID: <CANNYZj8oDZk96ti-Wfw3qBtSzi6R_fJ5ghwHBRsK4pD+ReDa0g@mail.gmail.com>
Subject: Re: [docs] New FAQ entry
To: richard.purdie@linuxfoundation.org
Cc: docs <docs@lists.yoctoproject.org>, Yocto TSC <tsc@lists.yoctoproject.org>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Jan 2025 20:28:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6172

I'm adding my voice to the chorus of agreement. The reason is this
deeply unpleasant conversation I've had about musl support in systemd:
https://github.com/systemd/systemd-bootchart/pull/47

This conversation convinced me that systemd holds values like
interoperability and choice in deep contempt, and thus clashes badly
with why we do Yocto. It should not be the default or recommended
choice, or the basis of our test matrix.

Alex

On Fri, 24 Jan 2025 at 13:02, Richard Purdie via
lists.yoctoproject.org
<richard.purdie=linuxfoundation.org@lists.yoctoproject.org> wrote:
>
> Hi,
>
> Since I keep getting asked this and I'm weary of repeating msyelf, I
> have a new FAQ entry, probably a slightly controversial one.
>
> """
> Q: Why isn't systemd the default init system for OpenEmbedded/Yocto
> Project or in Poky?
>
> A: systemd is a desktop Linux init system with a specific focus that
> isn't entirely aligned with a customisable 'embedded' build
> system/environment.
>
> It understandably mandates certain layouts and configurations which may
> or may not align with what the objectives and direction OE/YP want to
> take. It doesn't support all of our targets, for example musl support
> in systemd is problematic.
>
> If it were our default, we would have to align with all their choices
> and this doesn't make sense. It is therefore a configuration option and
> available to anyone where the design goals align but we're clear it
> isn't the only way to handle init.
>
> It is included in our automated testing through poky-altcfg and we
> don't really need it to be the default, it is tested, it works, people
> can choose to use it, it works fine.
> """
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6169): https://lists.yoctoproject.org/g/docs/message/6169
> Mute This Topic: https://lists.yoctoproject.org/mt/110788689/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

