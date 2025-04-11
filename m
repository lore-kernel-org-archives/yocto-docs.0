Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C63C369AB
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 19:09:23 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.34933.1744398557450770112
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Apr 2025 12:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmQsRG7S;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54298ec925bso860498e87.3
        for <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744398555; x=1745003355; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaOIEtGeYICBAKLWoiwTYPeFySUSKCJN12B3UE8QBrQ=;
        b=HmQsRG7SkUnxOb6coqPcfqyfoW+AM1ScIFz9533yUCGMBQ+j4jkMtpRGENJBick7C6
         x5TWQemJ90eBualc4lpTJ9euprmWxh4UCnCV3IsASBx+InEt9D7drp7TV3z0b0aXtkim
         kFwMYQ/XRhIig22Fu+LZvTUc0pkALKKahpY7LXkGbMhUUFBOtIvmINCkb+BjDXA0fkNX
         LJI/FYcRr8ODRPWlPJ1lpOFjsZp+1641eHu/y4L8WFOyYWAfJKbAGnsrp9T0RqPgbHLW
         HXrVkYCd0hSVnucaWxpxXbjOGyykt8G0N2dLDyY4upAIUiRrv/USjEWwNaZPxKOp3JQB
         ChMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744398555; x=1745003355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaOIEtGeYICBAKLWoiwTYPeFySUSKCJN12B3UE8QBrQ=;
        b=Rs0zpO1nPv0Vi6fWdY7/OvdX5DkkkT7QPQHau8MINmnuMJ9Olgxh27DSfNOCwGGo4h
         rBtN9ASGTPHuUGL7YKrLw+x57yVO7jCaKHI8jovfjEfcy53QE594d9FiOQ/H+FdEVMgg
         XMtQ5KYnyZ/enm3ZdCaaNhtb/NLpq3V55iBCkDYfUovpIOIOLs4bJo7nLsXRRkUG5MHC
         MZ8vceKM66bzCLWCC69G2Dsw8EtBIixO65Me57KPI/Ok+tVVKG54jTgQk4sI+/dxJ13s
         iqc4431bkVglZMLzoCjaOjI7uRFkvP7yocL2nLBsE+HqDWiPVR4fU7A+/SPQTmAr3/7I
         mCEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbiRIrIpNVxK7xRyhvv35shAJ2EE9Y70Kydz5LvPhrovHHZQ3wUoh0fDLRkRx/IyWCIWaq@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzZpbgQKCI4W189HtyQgGnK2fXheXGmWGDMQ0poJyZ8A0pNACOo
	tmAui7QzP4ZqdgbZshQWtYgmIWxLDm5lz6S79gqAJ61kU8sv4aTHEoQW1o2t0aK+xXyDb19vnYR
	/wPlGQqeTG5qUFzA4Ru1GDThZxWM=
X-Gm-Gg: ASbGncthsLri6FxxO0r6mupJ/CNxyYNPgJH5HodsAKhdoindd9kSt7wYgAYACdWrej8
	OOLcbGB+3VPPCbckQZoZ/TqtiRZ9NgfcbYFvGDCM8Mjxr0P8XYvRFPD/SECpZzNee54QpKzX14T
	kBa9y3KuV+/0kumagzkVguNxWt9lhuEKK6Dqc=
X-Google-Smtp-Source: AGHT+IEhNg0Sg6/7o4ZCw68ZIeqO4Ch9LoEu84ojrr4ZmHNl2Bv+g8ZnmTp9Z5iLeDMYzuOg/NDUapnLM9rcEEj9EkM=
X-Received: by 2002:a05:6512:3f07:b0:545:2a96:34f7 with SMTP id
 2adb3069b0e04-54d4529f454mr1151331e87.31.1744398555107; Fri, 11 Apr 2025
 12:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-bb-pressure-improvements-v1-0-7d9e3593167f@bootlin.com> <20250411-bb-pressure-improvements-v1-1-7d9e3593167f@bootlin.com>
In-Reply-To: <20250411-bb-pressure-improvements-v1-1-7d9e3593167f@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Apr 2025 21:09:03 +0200
X-Gm-Features: ATxdqUGgQENltaV00VCZ9gYiITy_iUO38noMhoZXirLaMqqGPcdIyKxefNORZSE
Message-ID: <CA+chaQeXK2pbaNWaYvDVzMhu=eZLpFLB9zeeaGDA7oLDJnaG3A@mail.gmail.com>
Subject: Re: [docs] [PATCH 1/2] runqueue: decrease the verbosity of pressure messages
To: antonin.godard@bootlin.com
Cc: bitbake-devel@lists.openembedded.org, docs@lists.yoctoproject.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Apr 2025 19:09:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6738

On Fri, Apr 11, 2025 at 4:46=E2=80=AFPM Antonin Godard via
lists.yoctoproject.org
<antonin.godard=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> By default all the pressure changes are printed on the console and
> generate a lot of spam to users using the BB_PRESSURE_* variables.
> Decrease the default verbosity to bb.debug (level 1, so can be seen with
> -D).

Isn't "a lot of these messages" a proof that the BB_PRESSURE_*
variables aren't set correctly?

I find them quite useful and using -D by default in my builds would
bring even "more spam". But in worse case I'll just revert this for my
builds.

Cheers,

> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  lib/bb/runqueue.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/bb/runqueue.py b/lib/bb/runqueue.py
> index 8fadc8338..adfe3c7a1 100644
> --- a/lib/bb/runqueue.py
> +++ b/lib/bb/runqueue.py
> @@ -219,7 +219,7 @@ class RunQueueScheduler(object):
>              pressure_state =3D (exceeds_cpu_pressure, exceeds_io_pressur=
e, exceeds_memory_pressure)
>              pressure_values =3D (round(cpu_pressure,1), self.rq.max_cpu_=
pressure, round(io_pressure,1), self.rq.max_io_pressure, round(memory_press=
ure,1), self.rq.max_memory_pressure)
>              if hasattr(self, "pressure_state") and pressure_state !=3D s=
elf.pressure_state:
> -                bb.note("Pressure status changed to CPU: %s, IO: %s, Mem=
: %s (CPU: %s/%s, IO: %s/%s, Mem: %s/%s) - using %s/%s bitbake threads" % (=
pressure_state + pressure_values + (len(self.rq.runq_running.difference(sel=
f.rq.runq_complete)), self.rq.number_tasks)))
> +                bb.debug(1, "Pressure status changed to CPU: %s, IO: %s,=
 Mem: %s (CPU: %s/%s, IO: %s/%s, Mem: %s/%s) - using %s/%s bitbake threads"=
 % (pressure_state + pressure_values + (len(self.rq.runq_running.difference=
(self.rq.runq_complete)), self.rq.number_tasks)))
>              self.pressure_state =3D pressure_state
>              return (exceeds_cpu_pressure or exceeds_io_pressure or excee=
ds_memory_pressure)
>          elif self.rq.max_loadfactor:
>
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6736): https://lists.yoctoproject.org/g/docs/message/=
6736
> Mute This Topic: https://lists.yoctoproject.org/mt/112211584/3617156
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [martin.jansa@gm=
ail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

