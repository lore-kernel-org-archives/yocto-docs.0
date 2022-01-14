Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9F0C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:09:26 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.10921.1642183764854918377
 for <docs@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 10:09:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FOhikgco;
 spf=pass (domain: gmail.com, ip: 209.85.166.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id v17so1324106ilg.4
        for <docs@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a40E5jBpQwBx1j5ntBAcmw0Wjmfa1idrVl3dzYl7o/s=;
        b=FOhikgco1DZfK33C04EmMQyeFM+JH0TnFAO4XTeYoxCJJ93rmVAsl3czKLWnIfQHnB
         c0COgEji2VRBmfEmuSjuPzG7pc7h2yGA7VYHNzINIxgF+Ym2prJpPFdGxSx0dWabJ+Or
         vYZnjD03RV3V07sHA2chbtYmNuA3MfMjIHn8Hs1R5jYxbr22Xw+15WhPIw0KBhW12+1a
         iTKlrnKray8/ebNcBHevH4gG9n748zLeO5CJYy5CRHFVQEW50NhTA7XKfXI6rwHuIt9L
         L8LO+Yq9xcO1kco5O4/t+9zPW9WZgfxqVKK4PaLupDgCWpASzwkbFBjrrAb0eq3kOrwh
         4cLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a40E5jBpQwBx1j5ntBAcmw0Wjmfa1idrVl3dzYl7o/s=;
        b=benwrDLvYtyCqMAKNGqaHifc2SJiTFSPZpHjtAeHZbj+1Mt7GCXJ8RZyv9jWuN6RPR
         AntUdfGXj7hx7NLR1tyxmz+ZC9Z/fJQXAxLaYPBPFupPQvzCS8rsGVWIC1wXf8o4Qanp
         evRZU82NNK4CGSQbJ70VXxvvJUdzz0IT6doMoTDq0J/ozpeIm1zbQXVyGBubHromu93F
         flYQgwOdN+HCcaSmJ110c+mFL7THoBjR8vwq31/7albqS/2U0qh7/6P1fV4MZQ0JbtWr
         13puQBijvl+u7e0iV/ZCU7eiU++NaHt83UVTibu/8Z4s0u9sjG8AhbymGArrHszrFFWy
         dP4g==
X-Gm-Message-State: AOAM5303JFlgG+ldIjGNYhuxMT5a7AVOwjnG4guEr0VkMcq3KjamTvNB
	FAXqgwXxmFGnQY6pGUCa5mbHe0Fd7nk+qSA1J1M=
X-Google-Smtp-Source: 
 ABdhPJwEMfFtS2Fu7Brlm1vE+pkmC9uHZpdW+zg31wPXLhAxQosBewXw3qbPTZPtsN7GI1dhFp9ABU4ctSWNwIPoPhA=
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id
 s10mr5622030ild.217.1642183764132;
 Fri, 14 Jan 2022 10:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20220113153843.2544066-1-tim.orling@konsulko.com>
 <20220113153843.2544066-3-tim.orling@konsulko.com>
 <fe0fe953-a9fe-4d03-fa71-dbe6424a64ab@bootlin.com>
In-Reply-To: <fe0fe953-a9fe-4d03-fa71-dbe6424a64ab@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 14 Jan 2022 10:09:13 -0800
Message-ID: 
 <CANx9H-Dm4b59hwsdUikSo36tM75GoXNMX0OWd5ix6hyWKF7zcw@mail.gmail.com>
Subject: Re: [docs] [PATCH v2 3/3] ref-manual/classes.rst: add
 setuptools3-base
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Tim Orling <tim.orling@konsulko.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000eac93605d58eb382"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 14 Jan 2022 18:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2412

--000000000000eac93605d58eb382
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 9:20 AM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Tim
>
> Thanks for the patches!
>
> On 1/13/22 4:38 PM, Tim Orling wrote:
> > Add setuptools3-base class
> >
> > +
> > +The ``setuptools3-base`` class provides a reusable base for other
> classes
> > +that support building Python version 3.x extensions. If you need
> > +functionality that is not provided by the
> :ref:`setuptools3<ref-classes-setuptools3` class, you may
> > +want to ``inherit setuptools3-base``. Some recipes do not need the tasks
> > +in the :ref:`setuptools3<ref-classes-setuptools3` class and inherit
> this class instead.
>
>
> There were syntax issues in the above references but no problem, I fixed
> them.

thank you.I was being lazy :/

>
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> Merged into "master-next".
>
> Thanks again!
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000eac93605d58eb382
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jan 14, 2022 at 9:20 AM Michael Opdenacker &lt;<a h=
ref=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-le=
ft:1ex;border-left-color:rgb(204,204,204)">Hi Tim<br>
<br>
Thanks for the patches!<br>
<br>
On 1/13/22 4:38 PM, Tim Orling wrote:<br>
&gt; Add setuptools3-base class<br>
&gt;<br>
&gt; +<br>
&gt; +The ``setuptools3-base`` class provides a reusable base for other cla=
sses<br>
&gt; +that support building Python version 3.x extensions. If you need<br>
&gt; +functionality that is not provided by the :ref:`setuptools3&lt;ref-cl=
asses-setuptools3` class, you may<br>
&gt; +want to ``inherit setuptools3-base``. Some recipes do not need the ta=
sks<br>
&gt; +in the :ref:`setuptools3&lt;ref-classes-setuptools3` class and inheri=
t this class instead.<br>
<br>
<br>
There were syntax issues in the above references but no problem, I fixed<br=
>
them.</blockquote><div dir=3D"auto">thank you.I was being lazy :/</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)" dir=3D"auto"><br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bo=
otlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
Merged into &quot;master-next&quot;.<br>
<br>
Thanks again!<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--000000000000eac93605d58eb382--

