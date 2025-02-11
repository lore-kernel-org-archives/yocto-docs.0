Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CE2C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:38:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2874.1739317106156193156
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eRpqB3Ef;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43957634473so5276245e9.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317104; x=1739921904; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbW1rYCWKMkilLruLdG+gs5oNW92WHMh8geZTG2YZr8=;
        b=eRpqB3EfZrxMO5cWM5NJeMBOXDYA3bq3M/mQacKBDqt2lB0Z+B9tnu8tygg4U7z+Sh
         IyU9wk3HXbGexcQHF7hWOsm/QqKyjBMvVDTqNJJT8yADQEk6M+zDaGfRxrTNI0tOrzND
         5Yy4SqqV3klJmpizhL/CCPXk+zFtHzCnbI+RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317104; x=1739921904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbW1rYCWKMkilLruLdG+gs5oNW92WHMh8geZTG2YZr8=;
        b=nY505uQF9UZfGAFnruTa9IS5TwHTJhvdZKO1m7rI4Ml46MEf9XJUuZP24x7fJgNEWs
         J8IHBTk1U05rlCVY9KqPj/7Ehpa+oWRtq4tF1OqZ2xOK6jMMEyhyql7d4X3Cfy/yZz1N
         3tjvWy2XeCDzP39pxnkBaw5too2Soq6nW69EzyCaslQQqw566eKV7Qw4ZgdHdMvMQwAN
         RC6OUKyTCg1fQGiQJ+8Fxc3WSnxHqEtyX6IGF3NZYN/dxeWXkRJXsLh3EsDaRrA5FdId
         hrLznnhWh4kJlZFywgzTPt61/fas6ER0LADtwsH2AIgiObBuPAj6XjYTeG4hkOPALDMx
         F9OQ==
X-Gm-Message-State: AOJu0YwotCnx2qZ5ZsmjBaywkJ61uiOpWhlPfF/WDm3CUoRQz/HkPj//
	sPTmla00MS0yoks/rcewBggaHoUZy+3w23l6fBay3ySN/yP4INXsL/q5GRtVmx9GpfMUu/+HVKW
	QKd/Uy/bZjSE5iq8H+uARBFicqj496Nygm8T4e0sLZEfOOsCs
X-Gm-Gg: ASbGncttJDPHrVf7RKsTNAZoPFU85ljKrWyOaCrs7bSyaqFJv07TxDQxvgkO1raDRY8
	ZvEFddTsD/5nsTn6WL9DViIhttJzyYHdkWDQx5R0r2VSec6RW3sBNnmMbbyR7xX7q6w0x6Rda
X-Google-Smtp-Source: AGHT+IGLNJDXg6TwNFwysz5XxK1AwKNMfq+FaC47e62tFWHeGWrjcjoqFmahI906RFOlwPcRzyJc6WlczZbDrwTHbTE=
X-Received: by 2002:a5d:5f51:0:b0:38d:d969:39c1 with SMTP id
 ffacd0b85a97d-38dea25279bmr590002f8f.5.1739317104555; Tue, 11 Feb 2025
 15:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20250206131811.86935-1-yoann.congal@smile.fr> <20250206131811.86935-3-yoann.congal@smile.fr>
 <6a34b601-8ddb-4101-9ae9-d0996202f79e@cherry.de> <481d5eeb-7042-478c-b4cb-86b1981b5a8d@smile.fr>
 <cdef73b7-8b73-447f-ba06-8256f5ac8f0c@cherry.de> <2c8a8f6f-d545-44b7-a9d7-ab05ee90bb34@smile.fr>
 <97784730-ad1e-4540-8eca-a1a962d71f51@cherry.de>
In-Reply-To: <97784730-ad1e-4540-8eca-a1a962d71f51@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 12 Feb 2025 00:37:58 +0100
X-Gm-Features: AWEUYZkKJA2i9KV2TZ1gyzKPOf1N7T1vcoa7SUqOG1pvrAcvIOUJPiXhk6Zk-3A
Message-ID: <CAMSfU+7uu=cmnnH3jSW0xW=rAhs3VawysHGGSzNsnTH+5XEADw@mail.gmail.com>
Subject: Re: [docs] [PATCH 3/3] reproducible-builds: add a "How to" section
 with OEQA* variables
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: docs@lists.yoctoproject.org, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000002b4f49062de65212"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:38:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6343

--0000000000002b4f49062de65212
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 10 f=C3=A9vr. 2025 =C3=A0 18:52, Quentin Schulz <quentin.schulz@che=
rry.de> a
=C3=A9crit :

> Hi Yoann,
>
> On 2/9/25 11:46 PM, Yoann Congal wrote:
> > Le 07/02/2025 =C3=A0 10:12, Quentin Schulz a =C3=A9crit :
> >> Hi Yoann,
> >
> > Hi,
> >
> >> On 2/6/25 7:17 PM, Yoann Congal wrote:
> >>> Le 06/02/2025 =C3=A0 17:08, Quentin Schulz a =C3=A9crit :
> >>>> Hi Yoann,
> >>>>
> >>>> On 2/6/25 2:18 PM, Yoann Congal via lists.yoctoproject.org wrote:
> >>>>> From: Yoann Congal <yoann.congal@smile.fr>
> >>>>>
> >>>>> Shows an example of the new variable
> >>>>> OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
> >>>>> and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE_TARGETS that
> >>>>> were
> >>>>> shown earlier.
> >>>>>
> >>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >>>>> Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> >>
> >> Since this is your v1, I believe you're not allowed to provide Reviewe=
d-
> >> by/Acked-by/Tested-by/etc... given privately. Guillaume should give
> >> their Reviewed-by on the mailing list before you can add it.
> >
> > I did not know this was a thing.
> > I did private reviews (with my Reviewed-By) for my coworkers for more
> > than 2 years now and nobody told me.
> >
>
> Coming from colleagues, it's less fishy but I've recently seen patches
> with Reviewed-by from maintainers in v1 of contributors where the
> maintainers didn't know anything about the patch. A Reviewed-by is a
> mark of trust that shouldn't be given lightly, so when it is given, it
> is helping the maintainer(s) making the decision whether to take the
> patch or not. Unless it is given publicly (hence "guaranteeing" the
> person who gives their Reviewed-by is the person they claim they are by
> the mail address they sent the mail from (though it's not a necessity, I
> sometimes give Reviewed-by: <personal-address> from my
> <company-address>)), there's nothing guaranteeing that this person
> actually reviewed the code. For the docs, the impact of impersonating
> someone in Reviewed-by is clearly not a big deal :)
>

Thanks for the explanation, I'll update the way we do that here.


> Cheers,
> Quentin
>
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000002b4f49062de65212
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 10=
 f=C3=A9vr. 2025 =C3=A0=C2=A018:52, Quentin Schulz &lt;<a href=3D"mailto:qu=
entin.schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 2/9/25 11:46 PM, Yoann Congal wrote:<br>
&gt; Le 07/02/2025 =C3=A0 10:12, Quentin Schulz a =C3=A9crit=C2=A0:<br>
&gt;&gt; Hi Yoann,<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt;&gt; On 2/6/25 7:17 PM, Yoann Congal wrote:<br>
&gt;&gt;&gt; Le 06/02/2025 =C3=A0 17:08, Quentin Schulz a =C3=A9crit=C2=A0:=
<br>
&gt;&gt;&gt;&gt; Hi Yoann,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 2/6/25 2:18 PM, Yoann Congal via <a href=3D"http://list=
s.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject=
.org</a> wrote:<br>
&gt;&gt;&gt;&gt;&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@=
smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Shows an example of the new variable<br>
&gt;&gt;&gt;&gt;&gt; OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS<br>
&gt;&gt;&gt;&gt;&gt; and still mention OEQA_REPRODUCIBLE_TEST_TARGET/SSTATE=
_TARGETS that<br>
&gt;&gt;&gt;&gt;&gt; were<br>
&gt;&gt;&gt;&gt;&gt; shown earlier.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoan=
n.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; Reviewed-by: Guillaume Swaenepoel &lt;<a href=3D"mailt=
o:guillaume.swaenepoel@smile.fr" target=3D"_blank">guillaume.swaenepoel@smi=
le.fr</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Since this is your v1, I believe you&#39;re not allowed to provide=
 Reviewed-<br>
&gt;&gt; by/Acked-by/Tested-by/etc... given privately. Guillaume should giv=
e<br>
&gt;&gt; their Reviewed-by on the mailing list before you can add it.<br>
&gt; <br>
&gt; I did not know this was a thing.<br>
&gt; I did private reviews (with my Reviewed-By) for my coworkers for more<=
br>
&gt; than 2 years now and nobody told me.<br>
&gt; <br>
<br>
Coming from colleagues, it&#39;s less fishy but I&#39;ve recently seen patc=
hes <br>
with Reviewed-by from maintainers in v1 of contributors where the <br>
maintainers didn&#39;t know anything about the patch. A Reviewed-by is a <b=
r>
mark of trust that shouldn&#39;t be given lightly, so when it is given, it =
<br>
is helping the maintainer(s) making the decision whether to take the <br>
patch or not. Unless it is given publicly (hence &quot;guaranteeing&quot; t=
he <br>
person who gives their Reviewed-by is the person they claim they are by <br=
>
the mail address they sent the mail from (though it&#39;s not a necessity, =
I <br>
sometimes give Reviewed-by: &lt;personal-address&gt; from my <br>
&lt;company-address&gt;)), there&#39;s nothing guaranteeing that this perso=
n <br>
actually reviewed the code. For the docs, the impact of impersonating <br>
someone in Reviewed-by is clearly not a big deal :)<br></blockquote><div><b=
r></div><div>Thanks for the explanation, I&#39;ll update the way we do that=
 here.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">

Cheers,<br>
Quentin<br>
</blockquote></div><span class=3D"gmail_signature_prefix">-- </span><br><di=
v dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font face=3D"Rale=
way, regular">Yoann Congal</font><div><font face=3D"Raleway, regular">Smile=
 ECS - Tech expert<br></font></div></div></div></div>

--0000000000002b4f49062de65212--

