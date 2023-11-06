Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCC9C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:46:19 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.51448.1699267575205951897
 for <docs@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 02:46:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lRKLCrJG;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bhstalel@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so7111374a12.3
        for <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 02:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699267573; x=1699872373; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P6tQL+8jYqRWY6WRzf4JPTz2MSP3Kw5qnXMTIXTtYZY=;
        b=lRKLCrJGlONr46yr20kvcipO8MDxDlU7Oy9LEcnzu/YJhIbsx3hxKTM4yU/CAxTjTU
         55GXdh9FS838bdDALXtyXYMmaDRPP0QZCuOtCG92xtEvzOMI+ie26SgvTBUEKGkjMXS9
         60mIo0utVIC8WzieKv2o6Ym3UsAWCG2GT56fNy+9khoLOOGBiSJF5v7I5SlT7JVMTb4J
         nXGorjMzeqUbkr6zKBJRfJvkO95uG0cRYaNmiWIlpbMbJwgkfm/rDIcgggcQSOAPRyFC
         hK3a9hKnu0DB6MAqpnZabAqNaUb+ed3ojGUM70+LSbGLTtyYGJWJf/9n0oLonT0HpCRy
         uNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267573; x=1699872373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6tQL+8jYqRWY6WRzf4JPTz2MSP3Kw5qnXMTIXTtYZY=;
        b=o9EEr6HdkPWVtRbCzvzJv9acly9MLTsOxMhEPuIw0jj8MBlgBPx7QfLrtX9sR4VACu
         b+0DO74IDq/RcHYVPakaui1do8MFi/coBnPPspfAWMla+kuErp0g7tRBS3xW7v5WD+1P
         BpWapTbciqo6WwcHfQlZIcLD3bqKWMGpNrbMEN7srFbRSqERqpMmVSCElAYeMSVGEZcP
         Oe3um6h4Su4NTvHykpkSMu3+wZIAgkZNV8qtCZx8e4rcYWNnhPdq9Q5EbhkxZ8V088U1
         gb0H3YS8jn6bGbIe5krWDWJ3ieuDSMrj5USHlz1ipd9w88izVe2Xk+1HdBLV/TKUlEt0
         PKbg==
X-Gm-Message-State: AOJu0YyozPkWLt9piR+iXNiBiCtWCZ9XM4roJSKXqpLNHQFnuFYCDUtp
	pU/j+v5GmnDK29j8/sN0+o36CqN226k5zNbyFtg=
X-Google-Smtp-Source: AGHT+IFIbdMxNdgsrInjKeZ0hLAjF7iMyF5fiRRnNvnUDbwzjk2taR0i7ljTXepwoonXEHKu56RbPuhjZ89ftlUOqTQ=
X-Received: by 2002:a50:8d4f:0:b0:532:bc4d:9076 with SMTP id
 t15-20020a508d4f000000b00532bc4d9076mr23020480edt.19.1699267573290; Mon, 06
 Nov 2023 02:46:13 -0800 (PST)
MIME-Version: 1.0
References: <20231106091510.1260882-1-bhstalel@gmail.com> <e0d8e6bb-36d2-4569-bb75-482664ee3ae1@bootlin.com>
In-Reply-To: <e0d8e6bb-36d2-4569-bb75-482664ee3ae1@bootlin.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Mon, 6 Nov 2023 11:46:02 +0100
Message-ID: <CAOgG7m3CJFjOR0EsCyb+H7B1t=voNv_sWWgsxJOQS1avJptCOw@mail.gmail.com>
Subject: Re: [docs] [PATCH] overview-manual: Fix bitbake_tasks_map.svg
 numbered disks
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000159df606097990df"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 06 Nov 2023 10:46:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4600

--000000000000159df606097990df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Regarding the comment dotted boxes, in draw.io they have the full
multi-line content as shown also in docs html view,
but Inkscape replaces half of the content with "...", I don't know why. I
am not experienced with Inkscape.

I will wait for your response on this  in order to find a fix before fixing
the missing GitHub box.

Thanks again for your help and feedback.
Kind regards
Talel

On Mon, Nov 6, 2023 at 11:03=E2=80=AFAM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Talel,
>
> On 06.11.23 at 10:15, BELHADJ SALEM Talel wrote:
> > Circles are changed to rectangles attached to the BitBake task box.
>
> Thanks for the update. It works for me.
> But you forgot the bigger "Github" black box on the left. By the way,
> please call it "GitHub" as Wikipedia does.
>
> Another question: the box on the bottom right just has "This task also
> depends on PACKAGE_CLASSES,...", that's much less than before. Is this
> intended, or a mistake?
>
> We're almost there!
> Many thanks for your time!
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000159df606097990df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Michael,<div><br></div><div>Regarding the comment dotte=
d boxes, in <a href=3D"http://draw.io">draw.io</a> they have the full multi=
-line content as shown also in docs html view,</div><div>but Inkscape repla=
ces half of the content with &quot;...&quot;, I don&#39;t know why. I am no=
t experienced with Inkscape.</div><div><br></div><div>I will wait for your =
response on this=C2=A0 in order to find a fix before fixing the missing Git=
Hub box.</div><div><br></div><div>Thanks again for your help and feedback.<=
/div><div>Kind=C2=A0regards</div><div>Talel</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 6, 2023 at 11:=
03=E2=80=AFAM Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@b=
ootlin.com">michael.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Talel,<br>
<br>
On 06.11.23 at 10:15, BELHADJ SALEM Talel wrote:<br>
&gt; Circles are changed to rectangles attached to the BitBake task box.<br=
>
<br>
Thanks for the update. It works for me.<br>
But you forgot the bigger &quot;Github&quot; black box on the left. By the =
way, <br>
please call it &quot;GitHub&quot; as Wikipedia does.<br>
<br>
Another question: the box on the bottom right just has &quot;This task also=
 <br>
depends on PACKAGE_CLASSES,...&quot;, that&#39;s much less than before. Is =
this <br>
intended, or a mistake?<br>
<br>
We&#39;re almost there!<br>
Many thanks for your time!<br>
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

--000000000000159df606097990df--

