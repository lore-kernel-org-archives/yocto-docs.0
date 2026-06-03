Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2E9CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 19:00:19 +0000 (UTC)
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27987.1780513216776514131
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jun 2026 12:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mixWrxtZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137ed2e66faso2378771c88.0
        for <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 12:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780513216; cv=none;
        d=google.com; s=arc-20240605;
        b=hgqpZ7FM2PLeyLmqZdJsw3EjMWsiVMl+zhtdFctgM2GrSdxrX02k4gAoenKYNZBZJ0
         AeEvfzHc59dSmBBRuOVInsSi2mJNJe/kzsme1OZ9g/jGMBaRpncjKzYHsWm7UVBEFRjY
         jaU/uMKpoCcNWVs/52v0Dh/mbcVm4axlc+IvocSBLsGvZwBpGzHZ1iJMuPtno1KZF2dl
         GmlcTVsaY5bh7yZzcFMHxaRr4BbisG9Rv3CHzR8tXw7b3ng4cGxbBcO0l75gz3aKS3ow
         Rr+ND6nCmPW/EhcOs5dMOraQRiqtC3jch1h9F0fR5hU//ywkLZ+ZTjZvv8naW5X3g4ZY
         o/sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86g15gJvhFImWdZoi7bkhbStFp5TQEwgamB1Su/xGro=;
        fh=yLR1/v3g8V9tLviQYQpPBuD7XkR18rSUQ8d5fiVdFQI=;
        b=a7BZ5Beh68Qe3ViWi37Qpn5K+c8Kvv76iiIDqh2RitEL5CjDfp8EvXrI2t5Lpy7gOA
         W9iyMBu5RL2PWSmZw8LVavHH+w2FKqmBCK3uah8s1QuMzhoy9uIdPoom/Vrvrbip/Wvf
         TPQp3AKBxfVBI984pb971XgKPWxw/uctiSdDMk1vJgjGvzhg3l4s0DwfJ5EGFSuqk2no
         y/StKxCv7lEMYr4N7cxQwBJ9HvwfiwwY8GD8SRG43z/29yxfjz+KZvD5R0UC0/CgkY8d
         MTFXqtp3JyRoDgNtYrhGmO+1MTjc7LoC4uP6i5faSkCNuaBRm3Xs2QheIbax3cG1GWRL
         dAAA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780513216; x=1781118016; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=86g15gJvhFImWdZoi7bkhbStFp5TQEwgamB1Su/xGro=;
        b=mixWrxtZixkM3QukeQ+rPmqp+drNgcuoS6fjxyYRLR0Qr1EcdRICNPwvlQNsxx+94G
         zytSBAn83DknN3jqe6iYGtx0KUUXaZapeikyT1HLERjJ0ml/yTFk85WjnckgcnL6Bv0o
         8qpCCnqMN+079PYwJuiXW9BodU+oeEZ0VLFXgU9UjEeOLIGVGtEpezyR9y3IdGwzbHrt
         Dy5fBnOq2Qsyr6xmJYzo1pVSmlfu3NmN8RXZZZ8IlCrnKMG2yHZGKaLIFC1jFmNh3W+i
         GSieS1ag7p+CCcleWnAULlwT4i9cRkk8LSg6DzevPo8Bs+BhpLe5d9E3t3Y8+aLkocfe
         5WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780513216; x=1781118016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86g15gJvhFImWdZoi7bkhbStFp5TQEwgamB1Su/xGro=;
        b=TApbwH5Rv+7LcNel4OqVG6fQS50Af92nu22d2xf5Vb9CMFyqlRhOZPw1SMrj7tA9Sd
         umazTJ/U7u30TBbz0nbJmtyQm6nQUgvVN5qaFyb3xTdxvrEA9oft8nMVsofUmKGNhTo6
         CCgqyOxznnCXuBhTb2IteEBu2svEhNGm4D02a/slGMg9QJTjM/tRJNwzGXskPHmIJrYJ
         /IMtOiktGRBlW0kshRCk4uuUraDP2B4I/K6SudpgsIYkDrS9FWZYnENbKdcJJIx68SSa
         WItI7SJgVjzrqR8P5hAgShgq0lX7kFZxpKe6Zeo9Vl1lJRvTlIy+CLYV8sv0EtftCH5X
         Ipwg==
X-Gm-Message-State: AOJu0YzGHzIUdVv3ko5lsC/D3pr97EEMGfvzms/mL5U4u1Kw2IuhxiFm
	iMqsW60fdHkEDsZ/R6fIomTPOJ/eyGK5kG8wUkWZ5FBW9xI2KX6czZwiqZg5js4vh8CHTmT4nVe
	wyd+Tb6idTx+LbyKoVdBnG4P8sBxvYiw=
X-Gm-Gg: Acq92OHDEbm9IwYu2Mf/dwr9eBW22gsv8L+q8Pz73d6vBt7h7Fy7Hb8Uhy3frzq/XBW
	nfpORHS1EuXNYmg3I4uudVuGC6IKlyrJx/B5HuB3ZT9AIkoK3ZqHsYYGYp1CWz1O3yOHcPmGxRe
	I8XJQ+FJT83W6TDVT2BJ5s8+ieHbd7KJOSXRQoDNM8UdfFHzd4yvcSWBLmO4FglI0PhokG3Ukee
	r81LgnWuaPFW2kvh3VMLnIflFWRuT7oOggL9z7s5cYd060wchen1b8OrV02a6QwBSY8qV2IpzhP
	x6PApeBJN0ct5O6knWsfGHDAWbjzznQJOFaeOj6oy8TQCULoDJ8=
X-Received: by 2002:a05:7022:1e16:b0:137:f4ec:2a1e with SMTP id
 a92af1059eb24-137f69396edmr1166410c88.9.1780513213584; Wed, 03 Jun 2026
 12:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260603105914.26433-1-marta.rybczynska@ygreky.com> <97144f9b8432b4c14d72a3ba03dd69f1c70f444f.camel@pbarker.dev>
In-Reply-To: <97144f9b8432b4c14d72a3ba03dd69f1c70f444f.camel@pbarker.dev>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 3 Jun 2026 21:00:00 +0200
X-Gm-Features: AVHnY4KmxZIuO457T-3IqMry2CECALNu0v8TX4afcqg_FlMy8sHIn3AUx3Nl9xc
Message-ID: <CAApg2=SjDfrVCWgbFYfT2=PcsyN6Omu1bZW5_HdVgd5diu+zmg@mail.gmail.com>
Subject: Re: [docs] [PATCH] security-team.rst: update my email address
To: Paul Barker <paul@pbarker.dev>
Cc: docs@lists.yoctoproject.org, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="0000000000009d195206535e0955"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jun 2026 19:00:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9569

--0000000000009d195206535e0955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 6:39=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrote=
:

> On Wed, 2026-06-03 at 12:59 +0200, Marta Rybczynska via
> lists.yoctoproject.org wrote:
> > Update my email address.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> > ---
> >  documentation/security-reference/security-team.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/documentation/security-reference/security-team.rst
> b/documentation/security-reference/security-team.rst
> > index b77365382..776dea568 100644
> > --- a/documentation/security-reference/security-team.rst
> > +++ b/documentation/security-reference/security-team.rst
> > @@ -105,6 +105,6 @@ information in the subject line.
> >
> >  -  Richard Purdie: <richard.purdie [at] linuxfoundation [dot] org>
> `Public key <
> https://keys.openpgp.org/search?q=3Drichard.purdie%40linuxfoundation.org>=
`__
> >
> > --  Marta Rybczynska: <marta DOT rybczynska [at] syslinbit [dot] com>
> `Public key <
> https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.com>`__
> > +-  Marta Rybczynska: <marta DOT rybczynska [at] ygreky [dot] com>
> `Public key <
> https://keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.com>`__
>
> Hi Marta,
>
> Should you also update the public key link?
>
> I tried searching for your new email address on keys.openpgp.org but it
> is not there. The linked key for your old email address is expired.
>
>
Good catch. I tend to use short key expiration and it shows. v2 sent.

Kind regards,
Marta

--0000000000009d195206535e0955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, =
2026 at 6:39=E2=80=AFPM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev"=
>paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Wed, 2026-06-03 at 12:59 +0200, Marta Rybczynska via<br=
>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt; Update my email address.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@ygreky.com" target=3D"_blank">marta.rybczynska@ygreky.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/security-reference/security-team.rst | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/documentation/security-reference/security-team.rst b/docu=
mentation/security-reference/security-team.rst<br>
&gt; index b77365382..776dea568 100644<br>
&gt; --- a/documentation/security-reference/security-team.rst<br>
&gt; +++ b/documentation/security-reference/security-team.rst<br>
&gt; @@ -105,6 +105,6 @@ information in the subject line.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 -=C2=A0 Richard Purdie: &lt;richard.purdie [at] linuxfoundation =
[dot] org&gt; `Public key &lt;<a href=3D"https://keys.openpgp.org/search?q=
=3Drichard.purdie%40linuxfoundation.org" rel=3D"noreferrer" target=3D"_blan=
k">https://keys.openpgp.org/search?q=3Drichard.purdie%40linuxfoundation.org=
</a>&gt;`__<br>
&gt;=C2=A0 <br>
&gt; --=C2=A0 Marta Rybczynska: &lt;marta DOT rybczynska [at] syslinbit [do=
t] com&gt; `Public key &lt;<a href=3D"https://keys.openpgp.org/search?q=3Dm=
arta.rybczynska@syslinbit.com" rel=3D"noreferrer" target=3D"_blank">https:/=
/keys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.com</a>&gt;`__<br>
&gt; +-=C2=A0 Marta Rybczynska: &lt;marta DOT rybczynska [at] ygreky [dot] =
com&gt; `Public key &lt;<a href=3D"https://keys.openpgp.org/search?q=3Dmart=
a.rybczynska@syslinbit.com" rel=3D"noreferrer" target=3D"_blank">https://ke=
ys.openpgp.org/search?q=3Dmarta.rybczynska@syslinbit.com</a>&gt;`__<br>
<br>
Hi Marta,<br>
<br>
Should you also update the public key link?<br>
<br>
I tried searching for your new email address on <a href=3D"http://keys.open=
pgp.org" rel=3D"noreferrer" target=3D"_blank">keys.openpgp.org</a> but it<b=
r>
is not there. The linked key for your old email address is expired.<br><br>=
</blockquote><div><br></div><div>Good catch. I tend to use short key expira=
tion and it shows. v2 sent.</div><div><br></div><div>Kind regards,</div><di=
v>Marta=C2=A0</div></div></div>

--0000000000009d195206535e0955--

