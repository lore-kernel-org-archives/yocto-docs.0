Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13432.1793629417829165053
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2026 06:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L/RGolPN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so29380695e9.1
        for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 06:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793629416; x=1794234216; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tbWXdm4avIg4AHKxBTT/H0q2WV9g06utZdKHaP7bEyM=;
        b=L/RGolPNPUlVez306SYJt8CSkgDHv40BlZzIju/z0FszWy7Mb71OEj1H7cjHQKrGXK
         k8Dr4hBUIeoAKGZxJG2PqxYkXGch1qVovp9exwIrmC9WriQhMraawJfAOb7hecRPx3Wp
         s+JJe0pT1br5KSfXbu8OifnxHJZLf/+NXgGWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629416; x=1794234216;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbWXdm4avIg4AHKxBTT/H0q2WV9g06utZdKHaP7bEyM=;
        b=Kb0DAtOfnME4IvpxGcp0KD+eXiU7ULykt4JIvfYNJapiW7XqjhwebNDwQJo8lxrWzG
         QtLRYhxH6lumz5w8g+Xfh+fqTMt2X+uZQ/JDSvDOiz5qq1Dc5qmiwl0nKOzFCRVlqbA5
         4fsuN0yQY6A/N2mauEMyZ2C/H5XSNVXIea2E0Revhq4SQOWHAstrl86EHrgaZInUISXt
         ZEdsSNMFL7fkF4P+JdkJhb+okgtmbAWLXlLukCRgkw5DSaZWsl0fQqMXZzGMXJ89FLBb
         tlv7/zzJXA2DkfsiGBy9QjOJbDFRDM+iwKUHUu6qSMDzHJtS8IivZEbF+Peq2Z+2rohn
         x3oQ==
X-Forwarded-Encrypted: i=1; AKwUvByneDjd/YL1BVlTtNo204UfSGo4Cb9e+zqQbwlYOCa5GLmv8mZgO5W/rwP5XK7GAXoWsY0L@lists.yoctoproject.org
X-Gm-Message-State: AFq9FYI1X0c8d+a3AlJLXHA/R/zDGcemQN25vtD6Zy2+pg9uR+lkGB17
	jpMg7opSz0OrnUBMS46K00X9RAWpBaQQyjs/aLONsA90xbu9d+W9yRRnW7X0D7D4cLE=
X-Gm-Gg: AYBFou3NQoLvClwLmPhTNCTTPYNSssEmB7lnC5uh7EyQ2Cm8CNawMyG5hvE/NJfr+6t
	QY8yUxoEteu69W5GQIYIJSsnJijTlEhV/d9HFOCZ1u5zpqlqZFaBYDhUQQG8eo0/mcGL2KwsOMc
	HlzNPgO7TmRwmxvvX0D8eiq8+SqeLf0qjJ8FlZYa2lDvWfupLx2RzNFEdHKwZZqqwaniLufKPQC
	MNb/vbxdW/tvgr1CehmSmjlJxp7XrFMiczjJlZ2ttH6q/Ps+ZIe9afZIhQtdGsNXkamlIcU1X/t
	55EFa+wXiU8la0L54A6uvv0ALzrsr5Putwon/UxZMG0zhk858RyqGOkRjuQq/gmyrcNTq4Gknlg
	reR9cS2m579dKsKpm4KbIVreDtZqeN08odw5vN5LSxqBOvIezkk82c8J/qKbjv7U5f1rexm3bXC
	DhL/6wBe0noDfGaG3lBwqTe8hmvH4Svx2AgpWf2AIJVobGeQeYEcBydhaAYC9ZDRyQpbOXz3S79
	IKvwAUA1G5yCf+bIINYUSZoRtkT06b0Zve7gpZ5dpAJ8CA4bW2bdb6ckELD5u+NWx4PstkJw0nk
	voJuu9B2myimFE0dKMkSvyjf/Un8O7rjteyJpWqf7mV4eiK0ltxjCtgUfHJ3NRH+zhSnhsQLU6/
	QGdXqhHEemmqqjEjuUNg=
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr244878075e9.2.1793629415782;
        Mon, 02 Nov 2026 06:23:35 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a866:4584:45b1:5742? ([2001:8b0:aba:5f3c:a866:4584:45b1:5742])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm321186695e9.12.2026.11.02.06.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:35 -0800 (PST)
Message-ID: <f0a7b4c1fb39d620962daca358c9fdcefc35cff9.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH] governance: Add start of project history and
 leadership sections
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Date: Mon, 02 Nov 2026 14:23:34 +0000
In-Reply-To: <DK6U5WRXC6D8.1K2H139ELD32@bootlin.com>
References: <20260715144404.753400-1-richard.purdie@linuxfoundation.org>
	 <DK6U5WRXC6D8.1K2H139ELD32@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Mon, 02 Nov 2026 14:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10762

Hi Antonin,

On Fri, 2026-07-24 at 15:29 +0200, Antonin Godard wrote:
> Thanks for contributing this, there's valuable information in there. Here=
 are my
> general remarks:
>=20
> - I don't think this should be part of the "Manuals" section of the
> =C2=A0 documentation. I propose that we make it a separate section instea=
d, as I
> =C2=A0 don't see where it could fit anywhere in the sections we have.
>=20
> =C2=A0 On that topic, I've just sent a series that re-organizes the secti=
on a bit
> =C2=A0 [1]. But I think the "Governance and History" should be on the sam=
e level as
> =C2=A0 the "Security Reference" one (i.e. separate from the rest).
>=20
> - Adding more dates (at least years) throughout the document might help r=
eaders
> =C2=A0 understand better the temporality of the project.
>=20
> Otherwise the rest of my suggestions are link additions, Sphinx syntax fi=
xes and
> formatting. Below is the pasted diff. Feel free to apply these suggestion=
s or
> comment on them!

Looping back to try and get this sorted, sorry about the delay.

I've made most of the changes. I put the section on its own at the end
of the sidebar after a lot of debate, I wasn't sure it quite belonged
at the top next to the "newcomer" pieces and concepts.

With dates, it is hard. For example rpm support drip fed in over 2008-
2010. sstate was a long evolution. I've added a few more dates, if you
think there are specific pieces where we should add more, let me know.
I'm having to search the repo for commit dates to pin things down.

See what you think of v2...

Cheers,

Richard


