Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412D9C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:28:15 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.223.1636738092999646558
 for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T92RveXd;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id m19so733798vko.12
        for <docs@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 09:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iTlQk9xNcSFzV19WlamtWLVmBvmhYXC99NocgQ1g5GA=;
        b=T92RveXdcIoX/9Hmyv+J3BpNZDhSUpHI5YC92EIAG5+9sbvAGbkMHvUhzNlr9gLEMn
         1BRJ9gTlP14/mofHBXB3opjIOfJ42hUh4JzOfY3YBk/MUpZ4NxGdv8XJADB/QTfvD1HB
         +VyyDXwkyoJMjSWjjFfN8Fe8jAMzYUVWe2SsdwA2kMTSZqRZTeYfjRXvMKvn/bKd9z5O
         MXEgUOH6V7XCqJBwlz+gshcNsPBJxKGkBsmVJTRdsz0Xf0kH3GA0cpbWNZfsD7SE9h8c
         ehrfG/CkwGNvay687tQ9qZkgF5jApxm4V3MR5NJT0in36tEnlmkzJeiKFLSirJ8ZKcG2
         Qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iTlQk9xNcSFzV19WlamtWLVmBvmhYXC99NocgQ1g5GA=;
        b=FyOMFvBELuL3+8+QmTW9QhxM3lPrQGIDuGvY3sEwLBI2XK/eqYF7SUe9B0F6z5zPi4
         g745FIhp0O7OQZtRQzTEWupkSIDO5TqkFlo1tB0c9y53jBa560rRir+RlSCXPP+qDCUa
         aiHoIuQj3noo/zfrkwJEd1ldESHDYH2IA89hqrKcqkLKVrh7SLb3LVpwfXA/Z14C/Oza
         P+wzdY+/8BT8jKNH4cZOnkeBePkdT1NrBcxrZ6ZTw6fkF4C3f62YvLmPu1jBh1KVvgHT
         9dEaedyXTeVWxrQFqcMld50/+gDRpGiPkb5mynbFYI7s2MtxAn7zrvwyiHyC5S2MZZYu
         ua0A==
X-Gm-Message-State: AOAM532V344+YncnbDFAqnZl2ewbeHVfE+GFjHlII+iJwR+Mn3Run7JP
	igbPpeO9EOcmDlrtCpG/FpIV3r6YgNsi7zXPSno=
X-Google-Smtp-Source: 
 ABdhPJxhpTEb0kOmLYbJZMqt8PmVk2IDh8X0Dsv7A6JqthZPGrWQyMY5a/Pvx78gJjiksDnplr4IFeU2c/N86PJDJek=
X-Received: by 2002:a05:6122:1803:: with SMTP id
 ay3mr26077786vkb.24.1636738092188;
 Fri, 12 Nov 2021 09:28:12 -0800 (PST)
MIME-Version: 1.0
References: <84ac62a4-4e20-5453-47eb-994be2e11511@bootlin.com>
 <CANNYZj9EJ7UsrkCY0zOjYMc0DPYsqq5Z9ogOy68vU_x3GmRxtA@mail.gmail.com>
 <1d0977eb-4377-a3a7-e194-c0c257d3785e@bootlin.com>
In-Reply-To: <1d0977eb-4377-a3a7-e194-c0c257d3785e@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Nov 2021 18:28:01 +0100
Message-ID: 
 <CANNYZj_zHb2NHPWq+486PvZGATu5ektoWGF-+HBVtEu-r8wNig@mail.gmail.com>
Subject: Re: [docs] Why "git send-email -M -1" in our contributing
 instructions?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000934d4b05d09ac8dc"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 12 Nov 2021 17:28:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2146

--000000000000934d4b05d09ac8dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No. You need to specify what commit(s) you want to sent, '-1' means 'one
latest commit'. And that in itself won't send things twice, there's
something else in your local setup.

Alex

On Fri, 12 Nov 2021 at 18:17, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Alex,
>
> On 11/12/21 5:57 PM, Alexander Kanavin wrote:
> > git send-email inherits all options from git format-patch. Yes it's
> > annoying.
>
>
> Got it, I missed this sentence in git send-email's documentation: "any
> format accepted by git-format-patch[1]
> <https://git-scm.com/docs/git-format-patch> can be passed to git
> send-email."
>
> >
> >        -M[<n>], --find-renames[=3D<n>]
> >            Detect renames. If n is specified, it is a threshold on the
> > similarity index (i.e. amount of addition/deletions compared to the
> > file=E2=80=99s size). For example, -M90% means Git should consider a
> > delete/add pair to be a rename
> >            if more than 90% of the file hasn=E2=80=99t changed. Without=
 a %
> > sign, the number is to be read as a fraction, with a decimal point
> > before it. I.e., -M5 becomes 0.5, and is thus the same as -M50%.
> > Similarly, -M05 is the same as
> >            -M5%. To limit detection to exact renames, use -M100%. The
> > default similarity index is 50%.
>
>
> Actually, I found that "-1" alone (with or without "-M" before) was
> causing the e-mail to be sent twice. So, if "-1" doesn't apply to "-M",
> then we probably have the default value for the -M option, and
> therefore, we could do without "-M" entirely, couldn't we?
>
> At least, we could drop "-1" from our contributing instructions, right?
>
> Thanks for your help!
>
> Michael.
>
> --
>
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000934d4b05d09ac8dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No. You need to specify what commit(s) you want to se=
nt, &#39;-1&#39; means &#39;one latest commit&#39;. And that in itself won&=
#39;t send things twice, there&#39;s something else in your local setup.<br=
></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Nov 2021 at 18:17, Mich=
ael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michae=
l.opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Alex,<br>
<br>
On 11/12/21 5:57 PM, Alexander Kanavin wrote:<br>
&gt; git send-email inherits all options from git format-patch. Yes it&#39;=
s<br>
&gt; annoying.<br>
<br>
<br>
Got it, I missed this sentence in git send-email&#39;s documentation: &quot=
;any<br>
format accepted by git-format-patch[1]<br>
&lt;<a href=3D"https://git-scm.com/docs/git-format-patch" rel=3D"noreferrer=
" target=3D"_blank">https://git-scm.com/docs/git-format-patch</a>&gt; can b=
e passed to git<br>
send-email.&quot;<br>
<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0=C2=A0 -M[&lt;n&gt;], --find-renames[=3D&lt;n&gt;]=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Detect renames. If n is speci=
fied, it is a threshold on the<br>
&gt; similarity index (i.e. amount of addition/deletions compared to the<br=
>
&gt; file=E2=80=99s size). For example, -M90% means Git should consider a<b=
r>
&gt; delete/add pair to be a rename<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if more than 90% of the file =
hasn=E2=80=99t changed. Without a %<br>
&gt; sign, the number is to be read as a fraction, with a decimal point<br>
&gt; before it. I.e., -M5 becomes 0.5, and is thus the same as -M50%.<br>
&gt; Similarly, -M05 is the same as<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-M5%. To limit detection to e=
xact renames, use -M100%. The<br>
&gt; default similarity index is 50%.<br>
<br>
<br>
Actually, I found that &quot;-1&quot; alone (with or without &quot;-M&quot;=
 before) was<br>
causing the e-mail to be sent twice. So, if &quot;-1&quot; doesn&#39;t appl=
y to &quot;-M&quot;,<br>
then we probably have the default value for the -M option, and<br>
therefore, we could do without &quot;-M&quot; entirely, couldn&#39;t we?<br=
>
<br>
At least, we could drop &quot;-1&quot; from our contributing instructions, =
right?<br>
<br>
Thanks for your help!<br>
<br>
Michael.<br>
<br>
-- <br>
<br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000934d4b05d09ac8dc--

