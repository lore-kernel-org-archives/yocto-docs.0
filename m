Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F077C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 18:03:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.61585.1697825026675035879
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 11:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDeolpNE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: bhstalel@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso173003966b.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697825025; x=1698429825; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ryb1jwqZAklzMahnQde7aTR4AzLq/bjuIUm859TEm2U=;
        b=HDeolpNEtcwhULal6XWbb66Kf3pO+otxnJpO0HilAriuMiWEurCDCSbz+zdRyldR/a
         hPcQkc6p/6+GnWvEYGEaaAdWRaQgLLFi6MD6VoiPHWizmCXXRh4g1yGUWVplNogSGsDo
         0cD0OnvPR+aKbOr2efqb/5FnHjtkWGTkiNvblyT48BcfgZ3muvjHNn2e7LsNGyKXAiQO
         w4eWxOX5Nd454021MvdyqOwTH8QLuh9Fcd20fN0Q9TcdBXd4EFkHvIVHPLYQ6EqANVZ5
         GTqj4HbrX1Hf/gebp0FfaK2Ghe32VV1WAPi5v4SwwQAvai+x3P0cHEm3ds0xZN7qYtYY
         xbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697825025; x=1698429825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryb1jwqZAklzMahnQde7aTR4AzLq/bjuIUm859TEm2U=;
        b=ItKPUCsP3w9XZ5Ff6adQQ3syo+dQeaD8cLzNHNxrt3SC7aQ0ao9PDla+FEI1IItQ2g
         kqpLrRQWs91s7UeuAuMv419GG/BZ4zNcm4hTUWC5zWSyfWoCwPCPTd0WKN+40exdlzSA
         CsPYLKrbYG501zf3OajEo06ZNrrNWQOrDtfGFPh7TR5tvubBQ+Vprej3W6Af8EJWryK4
         x8y5apCJNV/GqKUVVot9dOfQ2Czo+RS6gXU9fZ2zqz2RRp3FLaXVU23rVka7EivQcdWY
         N87beIHwlLP8Xrp3qmzQkLiGoQ4Ykevi3TXlHj6BDqZFPIA7waWoFU2TvzPrATynyeQ0
         ZIoQ==
X-Gm-Message-State: AOJu0Yw9rpN4Ia9DxGZyv+M3CqVlbtiJ2QM1mkz4xss01vc6qrWoWy79
	U+iEUiBqlrZA5ojoQdXEJ3jfuV4B5WHhsWRYtUg=
X-Google-Smtp-Source: AGHT+IEa3KugI85V4+ZANX7Cv3rf65GudXTUDnvx/aNI9DrVFDtaay0GKNBNexAfI1PI5INHqyj0p0sBrSRymnKMvMI=
X-Received: by 2002:a17:907:c007:b0:9c7:6fa7:586e with SMTP id
 ss7-20020a170907c00700b009c76fa7586emr1365297ejc.1.1697825024848; Fri, 20 Oct
 2023 11:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <18651.1687433672747999997@lists.yoctoproject.org>
 <29645.1697569015596670723@lists.yoctoproject.org> <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
In-Reply-To: <5c668a44-d9e3-4ca2-ad1d-e42730c76530@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Fri, 20 Oct 2023 19:03:33 +0100
Message-ID: <CAOgG7m0eQPFhnrmXd8GhbZJJEf_0dDRAj6Vpthh-NOtVPbZAjg@mail.gmail.com>
Subject: Re: [docs] Yocto Tasks Detailed Diagram Proposal
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007f3894060829b1a7"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 18:03:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4453

--0000000000007f3894060829b1a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Michael,

If I understand correctly:


   - The diagram is correct and I only need to:
   - Change the font
   - Remove the color coding indication (Should I keep the coloring as well
   ? Or make everything with 2 colors at max?)
   - Complete the section content and append the diagram and submit the
   patch

Let me know if I miss anything.

Thanks.
Talel

On Thu, Oct 19, 2023 at 3:29=E2=80=AFPM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Talel
>
> On 17.10.23 at 20:56, BELHADJ SALEM Talel wrote:
> > Hello,
> >
> > Returning to the detailed diagram proposal,
> >
> > I have created another one that is more and more detailed using
> > draw.io, I tried inkspace but it seems really to deal with.
>
>
> This one looks good. I opened it in Inkscape and I can open it and edit
> it, which is what matter most.
>
> A minor issue though. I can see in your PNG export that you are using
> "fancy" fonts, and I don't have them on my Linux box, and we probably
> don't either on the autobuilder machine which compiles the docs.
> However, this should be fixable. You could look at the fonts I used on
> https://docs.yoctoproject.org/_images/releases.svg and you/we could
> probably use those or similar ones.
>
> >
> > If this SVG file fine and accepted we can move on with it, otherwise,
> > what is the solution for this ? Should I try to take more time to
> > adapt it to inkscape and following the SVG template or someone can
> > help me with this ?
>
>
> Actually, the style of the SVG template should be updated. I liked the
> style of your original diagram and I must confess it influence me for
> https://docs.yoctoproject.org/_images/releases.svg :)
>
> This being said, we should be careful not to convey too much meaning
> through colors, and keep in mind colorblind people and readers on e-ink
> (grayscale) displays. Accessibility is important and this is something
> you could improve  in the version you've just submitted. The first
> version was almost perfect with respect to this. All we need is manage
> to import it properly with an Open Source editor like Inkscape.
>
>
> >
> > After dealing with that, I am planning to suggest adding a new "6.5
> > Tasks Map" in ref-manual/tasks and for the recipes example in the
> > diagram I will put their content in that section before introducing
> > the diagram.
> >
> > What do you think?
>
> It sounds great! I'll be happy to help if I can.
> Thanks in advance,
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000007f3894060829b1a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Michael,<div><br></div><div>If I understand cor=
rectly:</div><div><br></div><div><ul><li>The diagram is correct and I only =
need to:</li><li>Change the font</li><li>Remove the=C2=A0color coding indic=
ation (Should I keep the coloring as well ? Or make everything with 2 color=
s at max?)</li><li>Complete the section content and append the diagram and =
submit the patch</li></ul><div>Let me know if I miss=C2=A0anything.</div></=
div><div><br></div><div>Thanks.</div><div>Talel</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 19, 2023=
 at 3:29=E2=80=AFPM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdena=
cker@bootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi Talel<br>
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

--0000000000007f3894060829b1a7--

