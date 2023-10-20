Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D48C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:06:30 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.59871.1697821588861821745
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 10:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lh12QfmD;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso2312867a12.0
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697821587; x=1698426387; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uHoNFpS31qk06L2mXkXIJmfG1p8AA3/v4Wz+hR9WcLQ=;
        b=lh12QfmDnYMJPGQSTvXY1wVs6QYch3+tK3roiQSzEnN6x01AFj4VnEq5j9Fvq70ypT
         wrWEwfKvK/3PTVAOYI5ewid5TJm99yaZEcyGjNRXTiShhdr6DU6JasdyQymE90N+Tz4D
         Pi+Z78+XCZWjunW8NZ8OlMxtLi4l0sCOTnNA+4faeqPeGuOzESGkJJ3Y+KLQcZh89dAU
         JM7TDP3YKjPaNctQ3vTf610RW/R8uCf2hl+wbXM8iI+9zzPvLX3wudBunbMQvXl09xhJ
         Q196XwNpjFxvVOPu7C7R5rfUdeiMMgkdKdDgrHjDynE50INArwrDs2kT0HnqEmqafw2e
         YR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821587; x=1698426387;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHoNFpS31qk06L2mXkXIJmfG1p8AA3/v4Wz+hR9WcLQ=;
        b=ejHaYO9X1H22WCXWwc2RqdmewtQrq9445z3YFMA0WCpUpNN1B8iFIkT/sWdIwg9uH6
         ap4/5rm+jatQFAgllyjEbg4edaa3/oy/hmYxtfqcUlSH3SnU3vxnPYvi+4Y1vBNGvpWX
         W0IQm2TzJrvfGUDHLtKETlKIm4vZeOhat1lYv/DDp867P2zZZ6EDQxIB4cFffmYbDWD3
         +vR+cUm5IXqgEwO0hMgcJwE7kYJchBohPVwVj814nX4RW8HxoaJw7RPiWwxFin8E3AMi
         xXgBCET7m7zV37Lwf17PiBktCWxvBgz9aYBf11WoSFh1dOCv9TsvKemMotPShjJdT4wz
         f7zg==
X-Gm-Message-State: AOJu0YwJriqzwDDpDNkc6T1ja1VCY5pq3PLKAHbllq5d9OaIG/iIE8Il
	ryH1qtmOjPrHIZI8uBTA+sG3JBuM8IGaM+PbsxZzI7LY+Z8=
X-Google-Smtp-Source: AGHT+IHXVQg7cGFvtpTpC/BVNmWsZvqjP3T6WpXxpsVGjXGHCZyOIUK1ba4qQ/F7lEVXxYaRVkDT3/0eOECKogQ2j9M=
X-Received: by 2002:a50:d49e:0:b0:533:ccec:552 with SMTP id
 s30-20020a50d49e000000b00533ccec0552mr2366653edi.9.1697821586819; Fri, 20 Oct
 2023 10:06:26 -0700 (PDT)
MIME-Version: 1.0
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 20 Oct 2023 18:06:15 +0100
Message-ID: <CAOgG7m3Z8E9PvROHDV5qL8-WGJmY0f6NQgPrfxG8YXnVw6AfPA@mail.gmail.com>
Subject: [Proposition] Workshop-like documentation
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000931080060828e45b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 17:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4450

--000000000000931080060828e45b
Content-Type: text/plain; charset="UTF-8"

Hello Michael,

I have a website for Yocto that I have some articles in there:
https://yoctoleef.xyz/

I am a Yocto trainer for long time now, and I love detailing everything,

For instance check:
https://yoctoleef.xyz/2023/07/27/details-you-should-know-about-the-recipes-working-directory-part-ii/

I would like to contribute something like:

   - Practical Manual, or
   - Workshop Manual

or something like that, the aim is to provide a learning process for
newcomers.

It is like putting a Yocto training path with workshops and examples to
follow in order to master Yocto.

It is like The Rust Programming Book idea.

What do you think?

Kind regards
Talel

--000000000000931080060828e45b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Michael,<div><br></div><div>I have a website for Yoc=
to that I have some articles in there:=C2=A0<a href=3D"https://yoctoleef.xy=
z/">https://yoctoleef.xyz/</a></div><div><br></div><div>I am a Yocto traine=
r for long time now, and I love detailing everything,</div><div><br></div><=
div>For instance check:=C2=A0<a href=3D"https://yoctoleef.xyz/2023/07/27/de=
tails-you-should-know-about-the-recipes-working-directory-part-ii/">https:/=
/yoctoleef.xyz/2023/07/27/details-you-should-know-about-the-recipes-working=
-directory-part-ii/</a></div><div><br></div><div>I would like to contribute=
 something=C2=A0like:</div><div><ul><li>Practical=C2=A0Manual, or</li><li>W=
orkshop Manual</li></ul><div>or something like that, the aim is to provide =
a learning process for newcomers.</div></div><div><br></div><div>It is like=
 putting a Yocto training path with workshops and examples to follow in ord=
er to master Yocto.</div><div><br></div><div>It is like The Rust Programmin=
g Book idea.</div><div><br></div><div>What do=C2=A0you think?</div><div><br=
></div><div>Kind=C2=A0regards</div><div>Talel</div></div>

--000000000000931080060828e45b--

