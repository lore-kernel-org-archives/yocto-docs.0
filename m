Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2460FCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 18:13:02 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.59658.1758564771912752859
 for <docs@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 11:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuNRw1sg;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bhstalel@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b606291fddso6944751cf.2
        for <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758564771; x=1759169571; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ALig/wH1pXCT5jSk4SxaMZSgAryR6bVLExBsm9tUlQ=;
        b=BuNRw1sg0pHteHsx/XsocZwOyuKelu1pqXyd6bnbkPRl6kA4EHUaK5eSMdLO0bR++y
         LsA5BuoeWdq0f2Lf5bDPPXzMgMaU6JC/HlzMDj0Fmra2GDkZx3cUXEiQ5zVIHJmsR7x0
         QtYNfIMchJR4FxTLUP8LI/kir269Y7Y93lAnPLeH+2iYcSXiT32uFqPtPcwH7GRVr+5z
         f3SffDheY6WB3V8HgDHFXFjNp4MGSnwDoPp8wSynslGHFF4O12NQMs9RFws/2mKehZh8
         Qcmr5ihnYGcLvGV1uexKopOVRp2RNvmzwUhg5PteGqhIHt5Iv4WYkEhJRS2xCX/XQnzq
         PUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758564771; x=1759169571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ALig/wH1pXCT5jSk4SxaMZSgAryR6bVLExBsm9tUlQ=;
        b=UP53gZqLdJxc3H2EqA6S9BxEBilA2H52vzBOKUrhZZ2OG1CfvzEmA8aTJmrNJQvEc3
         QR//nOVBWk0/82E5USz/FoMxyctb2byDZVzN1ezx0zawJvuOIad3hxU0evQJXuvvSd+o
         qRyKAH8gWtca964OtJnIKfwSWHt6eVs0TTiLeOcSiuK5mjUWaEybTkMqNPuP9NPVGO2m
         yGwJmNop3tvKjyvYiTB1eU7T4yKKGozaZeyJWSueShw/b+CtCm89r13shdOn9ldLdrEV
         NTNTS7yU0oclQPKKo6p3BA3xEC+3gQSCP4V7X4yiJExaT6LqjbX8RIXAelGstSf2LM8u
         J+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNdWKCz6dmMWUuZLHcTy64awpxFA1xrG12HYA+TKNe43z1AZTI/4YnExBO4H1CK3nlL57M@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzJDJnXLy3OfP23IvQrxo77hblo4lF5fV5oplxKLuGLJiHxVbSo
	Etd5FNONPx46AcFX6wihQQJkGEZHKEitYU6XvXbMfFhXX3bhfITGIpurHXJOglQFXvBICeP6roN
	3/Na2w//621uCVK0odlnXjN5NH1F1C4o=
X-Gm-Gg: ASbGncudeLxVye5fzkIQLJ3YxxKuHTpiFIBK5UxdumLGWmmApYRzP9+/ZFRi7epmKyy
	M6GU7Q4oIv8NjS762jcu53mDsJmWEL0kdc7+QoUynw20ZJfAQMcXMmfLdQmqbW24yPvVm1PPZ6z
	wLv1FlFJPtT4pVP+HJQ4xdNLrBLsbaG9PFjiEHX6jmb6rMF6DeTFzW1OzmuPyPtFl4qsnBPlK1+
	8UC4tozFFl4swPB9ds/
X-Google-Smtp-Source: AGHT+IHpem2HKUCf6KdcgqeiwK55PT+YHdsZT/52ul6zrWo0EKlJh98qW9YPK2tCCKzUz9FHl06Nglo1hfmOEZ4KTsY=
X-Received: by 2002:ac8:7d11:0:b0:4b7:9c1d:b143 with SMTP id
 d75a77b69052e-4c073111989mr116063951cf.13.1758564770603; Mon, 22 Sep 2025
 11:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250921164306.53501-1-bhstalel@gmail.com> <20250921164306.53501-2-bhstalel@gmail.com>
 <DCZEHNS2J0WG.2PV5B9HWKUBSV@bootlin.com> <1867ACF8FB1FE7F2.23261@lists.yoctoproject.org>
In-Reply-To: <1867ACF8FB1FE7F2.23261@lists.yoctoproject.org>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 22 Sep 2025 19:12:37 +0100
X-Gm-Features: AS18NWASJESiLv1Us9tBgKl_sGmXfWdZoDBGtX7953HwGsRlb2psJXbs7gVzNtU
Message-ID: <CAOgG7m0qPUsyWcDmvfTggN7_=cKfmOKQtQ_A7OMCFDtjSd6wXw@mail.gmail.com>
Subject: Re: [docs][PATCH 1/2] ref-manual/classes.rst: add details about
 actions done by base.bbclass
To: bhstalel@gmail.com
Cc: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007764c0063f67c423"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 22 Sep 2025 18:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7577

--0000000000007764c0063f67c423
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will wait for your review on the 2/2 patch before submitting v2.

Kind Regards
Talel

On Mon, Sep 22, 2025 at 7:06=E2=80=AFPM BELHADJ SALEM Talel via
lists.yoctoproject.org <bhstalel=3Dgmail.com@lists.yoctoproject.org> wrote:

> I totally agree with you.
>
> I was sure that it is too vague, I don't why I did not detailed it more
> clearly.
>
> I will add more details in v2
>
> Thanks
>
> On Mon, 22 Sep 2025 at 15:32 Antonin Godard <antonin.godard@bootlin.com>
> wrote:
>
>> On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via
>> lists.yoctoproject.org wrote:
>> > Signed-off-by: Talel BELHAJ SALEM <bhstalel@gmail.com>
>> > ---
>> >  documentation/ref-manual/classes.rst | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/documentation/ref-manual/classes.rst
>> b/documentation/ref-manual/classes.rst
>> > index 662121ed9..791c6b2ef 100644
>> > --- a/documentation/ref-manual/classes.rst
>> > +++ b/documentation/ref-manual/classes.rst
>> > @@ -183,6 +183,14 @@ The class also contains some commonly used
>> functions such as
>> >  :term:`EXTRA_OEMAKE` variable as well as the
>> >  arguments passed directly to ``oe_runmake``.
>> >
>> > +The following actions, among others, are handled by this class:
>>
>> I would perhaps phrase this differently, how about:
>>
>> """
>> For example, the following items are handled by this class:
>> """
>>
>> So intent is more about giving some examples about what the class is
>> doing.
>>
>> > +
>> > +- Define default dependencies and add them to :term:`DEPENDS` if
>> :term:`INHIBIT_DEFAULT_DEPS`
>> > +  is not defined
>>
>> What dependencies? I'm afraid adding this sentence may add confusion
>> instead of
>> adding precision.
>>
>> > +- Handle :term:`PACKAGECONFIG` variable
>>
>> This is vague too. I would extend this sentence to briefly give some
>> context.
>>
>> > +- Handle the provided license via :term:`LICENSE` and
>> :term:`LIC_FILES_CHKSUM` variables
>>
>> s/license/license(s)
>>
>> This is again a bit vague, I'm not sure what's the added value. How abou=
t:
>>
>> """
>> Handle the provided license(s) specified in the :term:`LICENSE` variable=
,
>> and
>> verify its checksum specified in the :term:`LIC_FILES_CHKSUM` variable.
>> """
>>
>> > +- Prepare the native recipe that correspond to the scheme set in
>> :term:`SRC_URI`
>>
>> This is too vague, I'm not sure what you wanted to convey here.
>>
>> > +
>> >  .. _ref-classes-bash-completion:
>> >
>> >  ``bash-completion``
>>
>> I would finish by saying:
>>
>> """
>> See the source code of the :ref:`ref-classes-base` class to get a comple=
te
>> overview of what the class handles.
>> """
>>
>> So that way we insist on the fact that we were just giving examples.
>>
>> Thanks,
>> Antonin
>>
>> --
>> Antonin Godard, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7575):
> https://lists.yoctoproject.org/g/docs/message/7575
> Mute This Topic: https://lists.yoctoproject.org/mt/115361433/1955228
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> bhstalel@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007764c0063f67c423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I will wait for your review on the 2/2 patch before submit=
ting v2.<div><br></div><div>Kind Regards</div><div>Talel</div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Sep 22, 2025 at 7:06=E2=80=AFPM BELHADJ SALEM Talel via <a=
 href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;bhst=
alel=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com@lists.=
yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"auto">I totally agree with you.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I was sure that it is too vague, I do=
n&#39;t why I did not detailed it more clearly.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">I will add more details in v2</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks=C2=A0</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Sep 2025 at 15:32=
 Antonin Godard &lt;<a href=3D"mailto:antonin.godard@bootlin.com" target=3D=
"_blank">antonin.godard@bootlin.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Sun Sep 21, 2025 at 6:43 PM CEST, BEL=
HADJ SALEM Talel via <a href=3D"http://lists.yoctoproject.org" rel=3D"noref=
errer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; Signed-off-by: Talel BELHAJ SALEM &lt;<a href=3D"mailto:bhstalel@gmail=
.com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/classes.rst | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-=
manual/classes.rst<br>
&gt; index 662121ed9..791c6b2ef 100644<br>
&gt; --- a/documentation/ref-manual/classes.rst<br>
&gt; +++ b/documentation/ref-manual/classes.rst<br>
&gt; @@ -183,6 +183,14 @@ The class also contains some commonly used functi=
ons such as<br>
&gt;=C2=A0 :term:`EXTRA_OEMAKE` variable as well as the<br>
&gt;=C2=A0 arguments passed directly to ``oe_runmake``.<br>
&gt;=C2=A0 <br>
&gt; +The following actions, among others, are handled by this class:<br>
<br>
I would perhaps phrase this differently, how about:<br>
<br>
&quot;&quot;&quot;<br>
For example, the following items are handled by this class:<br>
&quot;&quot;&quot;<br>
<br>
So intent is more about giving some examples about what the class is doing.=
<br>
<br>
&gt; +<br>
&gt; +- Define default dependencies and add them to :term:`DEPENDS` if :ter=
m:`INHIBIT_DEFAULT_DEPS`<br>
&gt; +=C2=A0 is not defined<br>
<br>
What dependencies? I&#39;m afraid adding this sentence may add confusion in=
stead of<br>
adding precision.<br>
<br>
&gt; +- Handle :term:`PACKAGECONFIG` variable<br>
<br>
This is vague too. I would extend this sentence to briefly give some contex=
t.<br>
<br>
&gt; +- Handle the provided license via :term:`LICENSE` and :term:`LIC_FILE=
S_CHKSUM` variables<br>
<br>
s/license/license(s)<br>
<br>
This is again a bit vague, I&#39;m not sure what&#39;s the added value. How=
 about:<br>
<br>
&quot;&quot;&quot;<br>
Handle the provided license(s) specified in the :term:`LICENSE` variable, a=
nd<br>
verify its checksum specified in the :term:`LIC_FILES_CHKSUM` variable.<br>
&quot;&quot;&quot;<br>
<br>
&gt; +- Prepare the native recipe that correspond to the scheme set in :ter=
m:`SRC_URI`<br>
<br>
This is too vague, I&#39;m not sure what you wanted to convey here.<br>
<br>
&gt; +<br>
&gt;=C2=A0 .. _ref-classes-bash-completion:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ``bash-completion``<br>
<br>
I would finish by saying:<br>
<br>
&quot;&quot;&quot;<br>
See the source code of the :ref:`ref-classes-base` class to get a complete<=
br>
overview of what the class handles.<br>
&quot;&quot;&quot;<br>
<br>
So that way we insist on the fact that we were just giving examples.<br>
<br>
Thanks,<br>
Antonin<br>
<br>
-- <br>
Antonin Godard, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7575): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/7575" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/7575</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/115361433/195=
5228" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/115361433/1955228</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:bhstalel@gmail.com" target=3D"_blank">bhstalel@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007764c0063f67c423--

