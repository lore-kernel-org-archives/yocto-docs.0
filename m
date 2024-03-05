Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD907C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 17:03:15 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.29416.1709658187581288069
 for <docs@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 09:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3rmxXW3;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-608c40666e0so54935127b3.2
        for <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658187; x=1710262987; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SgmO9Ljpaahr/Y4VxVLtbXinpg6WN4gMlr4Q/MgJvmM=;
        b=G3rmxXW3cAWgxvt8Dy4ZY5lddyaj2Erq66DuZ5aDgXHO2uSiA/bWQJYZhVc64X6uaL
         lrx5CznRnfHsszgHmSvJD0BkD0kWdDLDbBpnpZmIGOAzge0axH5p6ZwPtxN1C7rS4WI7
         tQX8bKUj8qILIyOZIQcnf0RIFZl0JNBDKRLZ2Hcm2LM7w35HgaRUBUmIZpJ3x87WQM5Q
         C6IUH/dNn6T50eSMsz21O2iNbGw8BwaKA3hx+Tlz4HdP4EY2WwvARu/sJSo45ucF+B7d
         6WdwHntU4uujNBKWkqqVv8RkQRIHdbkXxk5GwVge7Shl6jTcU5u1ErE4ro4TyM1YS7QN
         yLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658187; x=1710262987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SgmO9Ljpaahr/Y4VxVLtbXinpg6WN4gMlr4Q/MgJvmM=;
        b=HKGJUdE4caFT5buVm8Yy7P0O4eWWVz78KIW7plOQYH5dQhO1ry5I21Gzm7rbCbev6+
         Hh2fyjgIG/ivbix8NubzJn4Pk5oObiNnQzFK6gFGkY1QxrSWwRPeuO9Gu0L1vs/RlmEB
         Gkoo1qWQLOUdIPoDQ10AB4WRo6q8nKjXqVIdTMt9RRdjs+Bkx7mttjLZ0Xdu1JmFQgwg
         iYOCKNBscOOfCTDb0JVjWLMnpPlTLf1bHjuqdvUJ7QrAdrCAA4xgwDk0vhKzsWPh302v
         LcgP5Y4oDztpYHkDIStIosZgGRhrfUaBEkpmLQnsJAfPPJHm4myHlHpCldV9zzQ1VwIm
         qKjg==
X-Forwarded-Encrypted: i=1; AJvYcCXGwbc/jZ8YnJRb7YPcXJeq55MkXxGiRGFF3gmPPCGF0u5UKcKq0+5vB5/YmSctvHG4fbK/gb1a+QU7uFGVJMb5NAbZlhXkJwCCLIQ=
X-Gm-Message-State: AOJu0Yz5vGDqpUOjK5D15g4brKkb+/o1mkOE8dmPcDFJ8sZOAnwJykSI
	ZIEtqDRwdBbURyzgado2BsOhV3D+d4fnfS4kTW/g08uRFIbPJpvbJto9rTR1r2q39KS508eCT7a
	HHt3I+YUc/A9DMZTqolLXowwz2Vw=
X-Google-Smtp-Source: AGHT+IFui2PQXRit09tla/ffnfcBFprvGX5LZ3reuxv9csKsh55AQO4tVsAD9SPpgbHhlS3Hl10RSBifwHH2RvsIqSk=
X-Received: by 2002:a81:a1ce:0:b0:607:6634:cfcc with SMTP id
 y197-20020a81a1ce000000b006076634cfccmr4681639ywg.51.1709658186484; Tue, 05
 Mar 2024 09:03:06 -0800 (PST)
MIME-Version: 1.0
References: <93bfc62e-c92b-4aff-b06e-40bbcbd46d87@bootlin.com> <1c5608a9af6785fd1478a78a28617c9a54ed30e7.camel@linuxfoundation.org>
In-Reply-To: <1c5608a9af6785fd1478a78a28617c9a54ed30e7.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 5 Mar 2024 09:02:55 -0800
Message-ID: <CANx9H-AO6jedVeqXpaMxTHKhPGUWo9KBEVVdJwddGStbGycraQ@mail.gmail.com>
Subject: Re: [docs] Documenting VIRTUAL-RUNTIME variables
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: michael.opdenacker@bootlin.com, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e4c8350612ecd023"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 05 Mar 2024 17:03:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4935

--000000000000e4c8350612ecd023
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 6:55=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-03-05 at 15:51 +0100, Michael Opdenacker via
> lists.yoctoproject.org wrote:
> > Greetings,
> >
> > Following a warning from Tim (thanks!).
> >
> > The VIRTUAL-RUNTIME_* variables do not appear in the YP manual
> > variable
> > index, and we shouldn't definitely address this.
> >
> > However, I still hesitate between:
> >
> >  1. Creating multiple entries, especially for the most frequent
> >     variables (VIRTUAL-RUNTIME_init_manager,
> >     VIRTUAL-RUNTIME_dev_manager...), and maybe for "VIRTUAL-RUNTIME"
> > as
> >     a name prefix
> >  2. Creating just a generic "VIRTUAL-RUNTIME" entry for this common
> > prefix.
> >
> > I'm tempted to go for 1, but then I guess it opens to door to
> > documenting most uses of this scheme.
>
> I'd suggest 2 since there can be an arbitrary number of them.
>

I agree we should keep it simple with #2.

The recipe that triggered the warning and the reason I asked was:
https://git.yoctoproject.org/meta-java/tree/recipes-core/ca-certificates-ja=
va/ca-certificates-java_20180516.bb#n103
RDEPENDS:${PN}:append:class-native =3D " virtual/java-native"

This causes:
"QA Issue: RDEPENDS is set to virtual/java-native but the substring
'virtual/' holds no meaning in this context. It only works for build time
dependencies, not runtime ones. It is suggested to use 'VIRTUAL-RUNTIME_'
variables instead. [virtual-slash]"
Which JaMa suggested in IRC should instead be
RDEPENDS:${PN}:append:class-native =3D " ${VIRTUAL-RUNTIME_java-native}"
although we both question if that line is even needed or not.

I guess my reason for the query was to understand (a) what the variable
should be used for and what it means
(b) what the specific fix should be in a case like this when we get the
[virtual-slash] QA warning.


> Cheers,
>
> Richard
>

--000000000000e4c8350612ecd023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 5, 2024 at 6:55=E2=80=AFA=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, 2024-03-05 at 15:51 +0100, Michae=
l Opdenacker via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a> wrote:<br>
&gt; Greetings,<br>
&gt; <br>
&gt; Following a warning from Tim (thanks!).<br>
&gt; <br>
&gt; The VIRTUAL-RUNTIME_* variables do not appear in the YP manual<br>
&gt; variable <br>
&gt; index, and we shouldn&#39;t definitely address this.<br>
&gt; <br>
&gt; However, I still hesitate between:<br>
&gt; <br>
&gt; =C2=A01. Creating multiple entries, especially for the most frequent<b=
r>
&gt; =C2=A0=C2=A0=C2=A0 variables (VIRTUAL-RUNTIME_init_manager,<br>
&gt; =C2=A0=C2=A0=C2=A0 VIRTUAL-RUNTIME_dev_manager...), and maybe for &quo=
t;VIRTUAL-RUNTIME&quot;<br>
&gt; as<br>
&gt; =C2=A0=C2=A0=C2=A0 a name prefix<br>
&gt; =C2=A02. Creating just a generic &quot;VIRTUAL-RUNTIME&quot; entry for=
 this common<br>
&gt; prefix.<br>
&gt; <br>
&gt; I&#39;m tempted to go for 1, but then I guess it opens to door to <br>
&gt; documenting most uses of this scheme.<br>
<br>
I&#39;d suggest 2 since there can be an arbitrary number of them.<br></bloc=
kquote><div><br></div><div>I agree we should keep it simple with #2.</div><=
div><br></div><div>The recipe that triggered the warning and the reason I a=
sked was:</div><div><a href=3D"https://git.yoctoproject.org/meta-java/tree/=
recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb#n103">ht=
tps://git.yoctoproject.org/meta-java/tree/recipes-core/ca-certificates-java=
/ca-certificates-java_20180516.bb#n103</a></div><div>RDEPENDS:${PN}:append:=
class-native =3D &quot; virtual/java-native&quot;<br></div><div><br></div><=
div>This causes:</div><div>&quot;QA Issue: RDEPENDS is set to virtual/java-=
native but the substring &#39;virtual/&#39; holds no meaning in this contex=
t. It only works for build time dependencies, not runtime ones. It is sugge=
sted to use &#39;VIRTUAL-RUNTIME_&#39; variables instead. [virtual-slash]&q=
uot;</div><div>Which JaMa suggested in IRC should instead be</div><div>RDEP=
ENDS:${PN}:append:class-native =3D &quot; ${VIRTUAL-RUNTIME_java-native}&qu=
ot;<br></div><div>although we both question if that line is even needed or =
not.</div><div><br></div><div>I guess my reason for the query was to unders=
tand (a) what the variable should be used for and what it means=C2=A0</div>=
<div>(b) what the specific fix should be in a case like this when we get th=
e [virtual-slash] QA warning.=C2=A0</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000e4c8350612ecd023--

