Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639F2C25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 12:18:26 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5483.1698409098293837107
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 05:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dhTPEnQS;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: bhstalel@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507e85ebf50so2746009e87.1
        for <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698409096; x=1699013896; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lweIAheu4myyMhDoVkSJL3uf9PmZKyNzZQatP4orrVQ=;
        b=dhTPEnQSofCV7SaSLl+5b/EtPE6XpzLM/lrPlr2e7szgg1H1fkvhFUfEWYXdhd1Gvp
         NeUh0Mw1YCenP0wcJ656GlxpNql3q4pbsUME2qMPSS3rCgQgdV2GSKpJ3G+ZDxrUdLAJ
         6LUzaZq1G3iLUkw9+J04ilqe+6irQUN/q0Q1seaGNFqSSRaJonNnXDupGm+4kLPdJT3I
         KLGDhtg5FNvlBvf432RMTVglNYiVLSRJLJyXhVqlTkUwY0G8Sr6nzzl5/F6RAOHFS0nP
         V3STYmZ7fIlm99s8Gy7DJdPWKhkhB2pcnX11pPqKrCgKNwCqM75dUqbLjuG2WTX02WAU
         DJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409096; x=1699013896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lweIAheu4myyMhDoVkSJL3uf9PmZKyNzZQatP4orrVQ=;
        b=siDRkXIyad0ziSJhEfOyWjHExiGj/aBK8xE1ouaNTgtPQU5vH5+MdkdVU/vqiW4MjP
         jhSdPImWqPb6RburguwSnEYFI3ySgw+2HOZA8LsqALB4c6dW/hMksKAhzz9ptPPmMGxX
         Gy6VsM1tzr0GJYlqLbm477eU46B64adgUyclEUC1mqw+H1XSQdyo9vmMv0pR8QCNBC8c
         eCHyHWPiWeyvOhH6a9IefxAK+LKua11QMqKnUHylvL7WgqYgbOU14syn6/Ia4p/g5UJr
         C5A7X/EClfoPHiNV8TKYmjWC6D+6zqcZIoYM1gbL1MA9wwAMj5ttLiHnxC2ld1hwY9rr
         rFWw==
X-Gm-Message-State: AOJu0YylJlZmMjzr+rggfH7vULJUZesSWOMWfnl2Qvh+wUzqS2k3FuVK
	JwfsmTejIGoeDz8Edn/Lp5dNRM78emRB2eSKo+Q=
X-Google-Smtp-Source: AGHT+IEBTt9pP8SUUPTM4bBDVZuB8Q/JPzmCVXeUjW3Mme4PYFHUPwYv0bKFG8a4ZY/TG8A0PncdCAMNQ1UrvYcisZM=
X-Received: by 2002:a05:6512:3d0d:b0:507:b8f6:58ec with SMTP id
 d13-20020a0565123d0d00b00507b8f658ecmr1936704lfv.37.1698409096070; Fri, 27
 Oct 2023 05:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org> <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
 <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com> <acba70be-9670-4ff3-a0f0-bb13add4559a@bootlin.com>
In-Reply-To: <acba70be-9670-4ff3-a0f0-bb13add4559a@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 27 Oct 2023 13:18:05 +0100
Message-ID: <CAOgG7m3DDDU56NX4=u=UzVbd6idkVMyvz7gyt0s3kkZBi7sZ1A@mail.gmail.com>
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dacbd90608b1aed7"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 12:18:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4512

--000000000000dacbd90608b1aed7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

Thanks for the clarification,

I have completed the map, and I think it is very perfect now.

I have just another question regarding the recipe's themselves,

Is it okay to create the recipes in my GitHub account and use that in the
documentation ?

Or, I put the files contents in the documentation itself like:

The following is the content of Makefile:

``content``

and so on ...

What do you think?

Thanks
Talel



On Fri, Oct 27, 2023 at 9:17=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Talel
>
> On 20.10.23 at 20:03, Talel BELHADJ SALEM wrote:
> > Hello Michael,
> >
> > If I understand correctly:
> >
> >   * The diagram is correct and I only need to:
> >   * Change the font
> >
> Right!
> >
> >   * Remove the color coding indication (Should I keep the coloring as
> >     well ? Or make everything with 2 colors at max?)
> >
> Just think about colorblind people, for whom red and green look the
> same, for example. So, you could use up to 3 types of colors actually:
> bright (like white), dark (like black) and an intermediate one, so that
> the 3 colors can be distinguished on an e-ink display or by colorblind
> people.
>
> That's what I tried to do with
> https://docs.yoctoproject.org/_images/releases.svg
>
> >   * Complete the section content and append the diagram and submit the
> >     patch
> >
> Right! Thanks in advance :)
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000dacbd90608b1aed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Michael,<div><br></div><div>Thanks for the clar=
ification,</div><div><br></div><div>I have completed the map, and I think i=
t is very perfect now.</div><div><br></div><div>I have just another=C2=A0qu=
estion regarding the recipe&#39;s themselves,</div><div><br></div><div>Is i=
t okay to create the recipes in my GitHub account and use that in the docum=
entation ?</div><div><br></div><div>Or, I put the files contents in the doc=
umentation itself like:</div><div><br></div><div>The following is the conte=
nt of Makefile:</div><div><br></div><div>``content``</div><div><br></div><d=
iv>and so on ...</div><div><br></div><div>What do=C2=A0you think?</div><div=
><br></div><div>Thanks</div><div>Talel</div><div><br></div><div><br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Oct 27, 2023 at 9:17=E2=80=AFAM Michael Opdenacker &lt;<a href=3D"ma=
ilto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Talel=
<br>
<br>
On 20.10.23 at 20:03, Talel BELHADJ SALEM wrote:<br>
&gt; Hello=C2=A0Michael,<br>
&gt;<br>
&gt; If I understand correctly:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* The diagram is correct and I only need to:<br>
&gt;=C2=A0 =C2=A0* Change the font<br>
&gt;<br>
Right!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0* Remove the=C2=A0color coding indication (Should I keep t=
he coloring as<br>
&gt;=C2=A0 =C2=A0 =C2=A0well ? Or make everything with 2 colors at max?)<br=
>
&gt;<br>
Just think about colorblind people, for whom red and green look the <br>
same, for example. So, you could use up to 3 types of colors actually: <br>
bright (like white), dark (like black) and an intermediate one, so that <br=
>
the 3 colors can be distinguished on an e-ink display or by colorblind <br>
people.<br>
<br>
That&#39;s what I tried to do with <br>
<a href=3D"https://docs.yoctoproject.org/_images/releases.svg" rel=3D"noref=
errer" target=3D"_blank">https://docs.yoctoproject.org/_images/releases.svg=
</a><br>
<br>
&gt;=C2=A0 =C2=A0* Complete the section content and append the diagram and =
submit the<br>
&gt;=C2=A0 =C2=A0 =C2=A0patch<br>
&gt;<br>
Right! Thanks in advance :)<br>
Cheers<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000dacbd90608b1aed7--

