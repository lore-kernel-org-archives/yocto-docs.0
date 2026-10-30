Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17591.1793382740640574071
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2026 10:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=atvr73aw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b042c0759so567310f8f.2
        for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 10:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793382739; x=1793987539; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sPurYRIVgrvPvYOSMSsqij1yWCkWNWbbX+4aQBXe4tI=;
        b=atvr73awqDTVWIxrOoKP9F6D26ndIr1VQyow0R3CiCeHRTTNuLWuTOpyVpZAHt/YKb
         pR/2A4j6Yolqmphzk9DfMN+oPCm/oorxnYF8OwpgHDZfOJ2eP8oegfcaiN8PfAj5Eraf
         HdzetbDZ91swiUAHd3g4isnslukJ0REHzJsm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382739; x=1793987539;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sPurYRIVgrvPvYOSMSsqij1yWCkWNWbbX+4aQBXe4tI=;
        b=vblQ3HVyYbDQFE9UVVUvaHPYpj8vb+A4FtvmocNNE6D+aymL9i2BMZLpbG3CJWaYAX
         3Xj+VqK1xpsK83xn9lfz2cQDroNX42KR1exMh98bQb254xqhpQ83JCYnvUYxvYGm6nIx
         2lOF45HN38ZuYfKMObUFgISUl2bfxQruCX7AhsUbK01InAuIxC91mes3mdkOrpIZ7lV+
         OC7bTLqkoznOsLviHQQBFjj03UcuBPRSlgV7fzITj26QjW0t+0aoOKEJIDncmcpIh7sA
         1lYlerVdyNmSU77IZPa5wApLAKGqMvB5ipu5mJfhr1p7kjjAfEL3ekiJYPCh/tuR8QOj
         MRsw==
X-Gm-Message-State: AFq9FYIe6Hihep1wwX5dYadjqFnY+J0Y+Cabj0qYhds550BNjMs94OBZ
	MJc2Bmwm8YfdcijRbLUfX0NwxIXcnYcW9O2zCp5cT+M+G+xlBA3dLTmJX2JFwwcC6Os=
X-Gm-Gg: AYBFou2ahff7JtKTigd52GCLEYUnM/rKsnYKqacJVjawbhN+/MH++zL+W2f354S/6ng
	Qqpt5f7IRZr+sGMkpOPwkEgi3cQe7R008KH0pWlSoe/DbQ3eUnpMUsHZgdObZqT/dFY8zF5KdH7
	IlCY8IxpQgFJlasxQrtoWBXKV7TV/yHPmGPc9zaL/AkRbYsxsLgwiyDb5olPTuv7/F19ZpDHS4/
	xy+I6nNH+MFvrzKz9Q5APfjlh/3030yZrpdW7xgs4K+4kI0iERV72L1drPGciDiP6giHNmPKMvK
	JTsLku7GVkmwmXV21QO8HeN+ZLIQbe1kvCxIODZRlS42kb2Q+wlwa7KvSDfHOKr5+Lt1ehFXDAN
	OCPAw4tmKx6Bpg2C8LqwK4ko5sKW55/uYYksWxNUMX/fiE5zbv6i1LSoMjXD1KTL82s+Xe3XWCS
	NvguAgWUUq8g7mYitFznwGMfWmqcqfez+V+vmS+a9ybZPUMeoc4kbcCAyUw5h/L8hAPf5YaJLeK
	OQIphUrPv4L8eoCdJlh5sNnInUdAY699c8O1zhfdJUC/Tg8BVxOQbQdjAOMMB4SdHuU1R3aIi+I
	1uPJM58NSvO/K48h+gab+8Dh5XXt81xkL+P9BVwdse3gRO1tTYdmJSsQn5ZqbxGJj9bY07buqEO
	ezD/gSBHiMHsYzfNO4/LDgBKfq7FeWw7rrX63074=
X-Received: by 2002:a5d:64c4:0:b0:488:7787:469d with SMTP id ffacd0b85a97d-48e6e4fca0amr7563358f8f.25.1793382738765;
        Fri, 30 Oct 2026 10:52:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:50a1:2666:faf3:9570? ([2001:8b0:aba:5f3c:50a1:2666:faf3:9570])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm4651961f8f.52.2026.10.30.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:52:18 -0700 (PDT)
Message-ID: <1b6c9c4da442dcffff9649662b29d9f9dd16981a.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] ref-manual/faq: Add entry about emails on patch
 merging
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, raj.khem@gmail.com
Cc: docs@lists.yoctoproject.org
Date: Fri, 30 Oct 2026 17:52:15 +0000
In-Reply-To: <ac49d3b7-2142-4974-8bec-722a98bc0781@cherry.de>
References: <20261030153308.3269691-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sr86nv0_fO4fscES2puqzkJ10+__rQUcJBbvTScsBsGRw@mail.gmail.com>
	 <ac49d3b7-2142-4974-8bec-722a98bc0781@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Fri, 30 Oct 2026 17:52:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10749

On Fri, 2026-10-30 at 17:14 +0100, Quentin Schulz wrote:
> We definitely need this very visible (and the docs is such a place)=20
> because I've heard again at OSSE at least one person complaining
> about this (and I've complained about this in the past too). I still
> think it's a mistake to not do it and that it's adding enough
> friction that people aren't encouraged in contributing more. But I'm
> also no maintainer in Yocto and I know they are overloaded, so I
> understand it may be asking too much right now. I will not debate on
> the content of this patch as it's the position of the project (for
> years now).

You say you will "not debate it" yet you put forward all the arguments
and therefore I probably have to respond.

The ask is that I send an extra 100+ emails a week. Some of the
recipients will be happy. Some will very much not be. I'll then have to
write a process for people to say "yes I want these" or "no I don't"
and maintain lists which I then filter the responses against.

Yes, we have tools and there is automation which can help to a point.

Do we really want me to focus on that?

I can't even reply to the patches we're *not* taking. I struggle to get
volunteers in the patch review calls to respond to some patches.

The cost will be things like the layer changes, which are already
pushing me back to breaking point :(

I'm getting really frustrated that people just want to continue to say
"that is a mistake, I think you should be spending X hours a week doing
Y".

I already spend many hours a week doing lots of things which people
take for granted and just expect to happen. I don't really have
capacity to add more.

FWIW I do agree it is a lovely idea.=20

I'd also note that someone else could sign up just to do this. They can
look at the patches merging and reply to the authors saying their patch
merged. Any volunteers to do that on an ongoing permanent basis?

No, I don't want an AI tool thrown over a wall I then get to
debug/fix/maintain, it needs a human to oversee it.

Cheers,

Richard
