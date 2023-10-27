Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E148C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 07:27:54 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.1832.1698391674006046197
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 00:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1DVgoJc;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: bhstalel@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507bd19eac8so2595582e87.0
        for <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391672; x=1698996472; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b3Q1Nx2e9OMbTZ4FIeirV0hJIBRnVPYcbAuDpzGcI0Q=;
        b=f1DVgoJchDCLbQrHHRS2elHlq1QH/sED6bMz0UoZHdfah+M++VWNUeoVQPA7VSf07I
         H43U4HpEP9nlctdFeVPraXilQDrVkRZmC5dsYd+z//CNnX4x8jVVDrehoE0zzGqDfat0
         CtxbHAx1sU9JxA24BSsGU1aRDdpLNa8CTDBwtEI+udkrEclmZGnu1TO9SuAi8K3hG0ju
         H2tqfWB4jVvUUYrRZKJDbq81s1w7CVhmpQ3QVs3ZXXtN8GsLhcUnHPMTELi5kYtqLxSv
         dvaeMDQ6/LTSMHtEFyUmLuKW4A+X5ANFu8pmtAcaZfy6qRTr2RAMyJddy/bg9+fC4Utx
         RUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391672; x=1698996472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3Q1Nx2e9OMbTZ4FIeirV0hJIBRnVPYcbAuDpzGcI0Q=;
        b=FQsZ3uTtzcxVtxbm5L6flcMO1O7I0kfBON5I3XW1/C3ijsrzaM0tV+7P/iKew5DMDe
         zWz7ATYyuHQjBKMcirV/DNSub8q3Ie2wiDQQbniT3ZqYGXAZAuFWOAUIKKiyduzRtXa/
         84kiJmCmCy6qyY4Mbo6MkWT1CEBXbgvWfZpeG1v7OQJq+AjWTKjW8x/pGMAKsQrWSUG8
         AP9I9mdBkkKt8CpkZENr0RiAO/lsJdFibHkmMWJOOm7GE805n6VamOKl6j2PzV4P5wec
         510khNy0RBOVXhpCzevKaewhW7eS7L/aCd+ZSO42b+iPr5BP2GWuhLTxWmHGZutOs/lx
         v+Fw==
X-Gm-Message-State: AOJu0Ywl8evlbRKAkgK/cN0q26loj9YIPZdl8eTdL2j6Vdo01CStbOqn
	+5gZiJJTj7spBPkYbG5kmvvfmvTNhmK2BADRClzSXVju7vc=
X-Google-Smtp-Source: AGHT+IH2uKdjLgcIo7k3MnRLQ11nmseC73vhmAX/CZ4pndqAxGVu+WOlry/D233bLdjp8l4kjTksIHhBqEpBy6BXgGg=
X-Received: by 2002:a05:6512:3e9:b0:507:c7cc:12c7 with SMTP id
 n9-20020a05651203e900b00507c7cc12c7mr1104546lfq.47.1698391671766; Fri, 27 Oct
 2023 00:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org> <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
 <178FE2DDDBFED311.11247@lists.yoctoproject.org>
In-Reply-To: <178FE2DDDBFED311.11247@lists.yoctoproject.org>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 27 Oct 2023 08:27:40 +0100
Message-ID: <CAOgG7m19cXzkHruyptbV0GHUfnqcL00EgjxB+PUpDd6=Q3cF2g@mail.gmail.com>
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
To: bhstalel@gmail.com
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000004903b00608ada0cc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Oct 2023 07:27:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4506

--0000000000004903b00608ada0cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

Kind reminder.

Thanks again for your support.
Kind regards
Talel

On Fri, Oct 20, 2023 at 7:03=E2=80=AFPM BELHADJ SALEM Talel via
lists.yoctoproject.org <bhstalel=3Dgmail.com@lists.yoctoproject.org> wrote:

> Hello Michael,
>
> If I understand correctly:
>
>
>    - The diagram is correct and I only need to:
>    - Change the font
>    - Remove the color coding indication (Should I keep the coloring as
>    well ? Or make everything with 2 colors at max?)
>    - Complete the section content and append the diagram and submit the
>    patch
>
> Let me know if I miss anything.
>
> Thanks.
> Talel
>
> On Thu, Oct 19, 2023 at 3:29=E2=80=AFPM Michael Opdenacker <
> michael.opdenacker@bootlin.com> wrote:
>
>> Hi Talel
>>
>> On 17.10.23 at 20:56, BELHADJ SALEM Talel wrote:
>> > Hello,
>> >
>> > Returning to the detailed diagram proposal,
>> >
>> > I have created another one that is more and more detailed using
>> > draw.io, I tried inkspace but it seems really to deal with.
>>
>>
>> This one looks good. I opened it in Inkscape and I can open it and edit
>> it, which is what matter most.
>>
>> A minor issue though. I can see in your PNG export that you are using
>> "fancy" fonts, and I don't have them on my Linux box, and we probably
>> don't either on the autobuilder machine which compiles the docs.
>> However, this should be fixable. You could look at the fonts I used on
>> https://docs.yoctoproject.org/_images/releases.svg and you/we could
>> probably use those or similar ones.
>>
>> >
>> > If this SVG file fine and accepted we can move on with it, otherwise,
>> > what is the solution for this ? Should I try to take more time to
>> > adapt it to inkscape and following the SVG template or someone can
>> > help me with this ?
>>
>>
>> Actually, the style of the SVG template should be updated. I liked the
>> style of your original diagram and I must confess it influence me for
>> https://docs.yoctoproject.org/_images/releases.svg :)
>>
>> This being said, we should be careful not to convey too much meaning
>> through colors, and keep in mind colorblind people and readers on e-ink
>> (grayscale) displays. Accessibility is important and this is something
>> you could improve  in the version you've just submitted. The first
>> version was almost perfect with respect to this. All we need is manage
>> to import it properly with an Open Source editor like Inkscape.
>>
>>
>> >
>> > After dealing with that, I am planning to suggest adding a new "6.5
>> > Tasks Map" in ref-manual/tasks and for the recipes example in the
>> > diagram I will put their content in that section before introducing
>> > the diagram.
>> >
>> > What do you think?
>>
>> It sounds great! I'll be happy to help if I can.
>> Thanks in advance,
>> Cheers
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4453):
> https://lists.yoctoproject.org/g/docs/message/4453
> Mute This Topic: https://lists.yoctoproject.org/mt/94690569/1955228
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> bhstalel@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004903b00608ada0cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Michael,<div><br></div><div>Kind reminder.</div><div=
><br></div><div>Thanks again for your support.</div><div>Kind regards</div>=
<div>Talel</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 20, 2023 at 7:03=E2=80=AFPM BELHADJ SALEM Talel=
 via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &=
lt;bhstalel=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org">gmail.com=
@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr">Hello=C2=A0Michael,<div><br></div><=
div>If I understand correctly:</div><div><br></div><div><ul><li>The diagram=
 is correct and I only need to:</li><li>Change the font</li><li>Remove the=
=C2=A0color coding indication (Should I keep the coloring as well ? Or make=
 everything with 2 colors at max?)</li><li>Complete the section content and=
 append the diagram and submit the patch</li></ul><div>Let me know if I mis=
s=C2=A0anything.</div></div><div><br></div><div>Thanks.</div><div>Talel</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Oct 19, 2023 at 3:29=E2=80=AFPM Michael Opdenacker &lt;<a href=3D=
"mailto:michael.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacke=
r@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Talel<br>
<br>
On 17.10.23 at 20:56, BELHADJ SALEM Talel wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; Returning to the detailed diagram proposal,<br>
&gt;<br>
&gt; I have created another one that is more and more detailed using <br>
&gt; <a href=3D"http://draw.io" rel=3D"noreferrer" target=3D"_blank">draw.i=
o</a>, I tried inkspace but it seems really to deal with.<br>
<br>
<br>
This one looks good. I opened it in Inkscape and I can open it and edit <br=
>
it, which is what matter most.<br>
<br>
A minor issue though. I can see in your PNG export that you are using <br>
&quot;fancy&quot; fonts, and I don&#39;t have them on my Linux box, and we =
probably <br>
don&#39;t either on the autobuilder machine which compiles the docs. <br>
However, this should be fixable. You could look at the fonts I used on <br>
<a href=3D"https://docs.yoctoproject.org/_images/releases.svg" rel=3D"noref=
errer" target=3D"_blank">https://docs.yoctoproject.org/_images/releases.svg=
</a> and you/we could <br>
probably use those or similar ones.<br>
<br>
&gt;<br>
&gt; If this SVG file fine and accepted we can move on with it, otherwise, =
<br>
&gt; what is the solution for this ? Should I try to take more time to <br>
&gt; adapt it to inkscape and following the SVG template or someone can <br=
>
&gt; help me with this ?<br>
<br>
<br>
Actually, the style of the SVG template should be updated. I liked the <br>
style of your original diagram and I must confess it influence me for <br>
<a href=3D"https://docs.yoctoproject.org/_images/releases.svg" rel=3D"noref=
errer" target=3D"_blank">https://docs.yoctoproject.org/_images/releases.svg=
</a> :)<br>
<br>
This being said, we should be careful not to convey too much meaning <br>
through colors, and keep in mind colorblind people and readers on e-ink <br=
>
(grayscale) displays. Accessibility is important and this is something <br>
you could improve=C2=A0 in the version you&#39;ve just submitted. The first=
 <br>
version was almost perfect with respect to this. All we need is manage <br>
to import it properly with an Open Source editor like Inkscape.<br>
<br>
<br>
&gt;<br>
&gt; After dealing with that, I am planning to suggest adding a new &quot;6=
.5 <br>
&gt; Tasks Map&quot; in ref-manual/tasks and for the recipes example in the=
 <br>
&gt; diagram I will put their content in that section before introducing <b=
r>
&gt; the diagram.<br>
&gt;<br>
&gt; What do you think?<br>
<br>
It sounds great! I&#39;ll be happy to help if I can.<br>
Thanks in advance,<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#4453): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/4453" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/4453</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/94690569/1955=
228" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/94690569/1955228</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:bhstalel@gmail.com" target=3D"_blank">bhstalel@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004903b00608ada0cc--

