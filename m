Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D39C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 04:55:21 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web12.1584.1637211321326828404
 for <docs@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 20:55:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QZs70XIq;
 spf=pass (domain: gmail.com, ip: 209.85.166.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id k1so5180349ilo.7
        for <docs@lists.yoctoproject.org>;
 Wed, 17 Nov 2021 20:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WmIHTEbFqf0sBn9urnmF99OHLzx3a+aKxgu+N0dFPdE=;
        b=QZs70XIqizl9/wLkxeW+jenwd9M0akZW+Gw/D/Z3h0PIv4zZURjRpc5+zAOjeSPxcc
         dK0VscRPTNagP+nnxsXvN5RBfylmnNwg+Rjrdwi5tGEk4D7kmCLc3W7jbNv3TRAX15ai
         vu67GuYnnxaReQ2cpbT0Buxa5FkmQ/oVfFeqtwgoUGJ6069T9KCos0HqpC1xAtS63NVS
         1vciTpnf+OnyQNETtEwNHrEEg6dnGzi0oXRNttzoP6iBHv8RR4X82KnHuvl90HTO2NrQ
         9c7bK44gC2n2b+b635lcZmCQGn4ehsugpv8HlCaqC4x2S36n9WiEn4KRipBeXm2OUU/+
         Zh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WmIHTEbFqf0sBn9urnmF99OHLzx3a+aKxgu+N0dFPdE=;
        b=wxWN6wgaI5NOnZ2OvSrAaubbza2mJ/44co6IGz7j1p3ny25ER5biAjO65UA44yHHL1
         0K25DQXiXu3gmI6X/6+ODUs5hcK92Tbwh8xawk2RhLhsdclWSWUY78mhK6E159kQspdl
         rpoJkWDxmyGPqzoGHh+gHztSCWiiTDjZ+AG8iavAQ2i9n9X11T+lszCRjTu0oMuEEpFn
         SP6bbyL+ZPT/fMigCvhYjwXfqnNVPWkQQJ4+DwwAKMjkq/ovTprKvjdiI6MUh7KwA5hm
         w+hcHVUByBcNIuJ2QBb8dqza1yzBMTtEvvfyPANucrp6mYTVJHQ9PqzwHL59mL+GroXt
         QnJA==
X-Gm-Message-State: AOAM531lujbjDMXvy5ZEZkcwue1LxuSrk5NedjXM0COqddKcK3dtXNKd
	NmC1rTWOR5xNBD4xEWUvimao1Wf9domtK6YqsDo=
X-Google-Smtp-Source: 
 ABdhPJy3C9xvcNSG4QYeIK223jmDZUqAYsD8QtVKLhG++rSypeA1yEAcxVVeopzAfP8n05rEQ1K4teU6OcoM39g+a6E=
X-Received: by 2002:a05:6e02:1c47:: with SMTP id
 d7mr14622328ilg.195.1637211320509;
 Wed, 17 Nov 2021 20:55:20 -0800 (PST)
MIME-Version: 1.0
References: <e215954c-7898-a9c5-1df1-0d876ce30a86@bootlin.com>
 <bebd3578-f723-8574-93f7-061454b57c8f@gmail.com>
 <e1766a73-31fa-4251-408b-fd4f0b46c9b3@bootlin.com>
In-Reply-To: <e1766a73-31fa-4251-408b-fd4f0b46c9b3@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 17 Nov 2021 20:55:09 -0800
Message-ID: 
 <CANx9H-A6XfeQga1eC83=hqxfhDwzByWbGwzvBxwT66N+QSW-rQ@mail.gmail.com>
Subject: Re: [docs] Continue to support Ubuntu 16.04?
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002e6aea05d108f7d9"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 18 Nov 2021 04:55:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2160

--0000000000002e6aea05d108f7d9
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 11:43 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Greetings,
>
> On 11/12/21 6:33 PM, Khem Raj wrote:
> >
> >
> > On 11/12/21 5:39 AM, Michael Opdenacker wrote:
> >> Greetings
> >>
> >> Ubuntu 16.04 is no longer maintained for free by Canonical
> >> (https://ubuntu.com/16-04)
> >>
> >> I guess our builders don't have a subscription to get updates until
> >> 2026, so can we really keep Ubuntu 16.04 in our list of supported
> >> distros?
> >>
> >
> > Good question, I think we would not be able to keep testing the latest
> > of 16.04 so perhaps it should be dropped.
>
>
> Then, if everyone agrees, let's drop the 16.04 workers, and use freed
> CPU time for other tests.
> How to drop the 16.04 workers?
> Cheers
> Michael.
>

Probably the docs list is not a wide enough audience to discuss the impact?


> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2157):
> https://lists.yoctoproject.org/g/docs/message/2157
> Mute This Topic: https://lists.yoctoproject.org/mt/87006018/924729
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002e6aea05d108f7d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 16, 2021 at 11:43 PM Michael Opdenacker &lt;<a =
href=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Greetings,<br>
<br>
On 11/12/21 6:33 PM, Khem Raj wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 11/12/21 5:39 AM, Michael Opdenacker wrote:<br>
&gt;&gt; Greetings<br>
&gt;&gt;<br>
&gt;&gt; Ubuntu 16.04 is no longer maintained for free by Canonical<br>
&gt;&gt; (<a href=3D"https://ubuntu.com/16-04" rel=3D"noreferrer" target=3D=
"_blank">https://ubuntu.com/16-04</a>)<br>
&gt;&gt;<br>
&gt;&gt; I guess our builders don&#39;t have a subscription to get updates =
until<br>
&gt;&gt; 2026, so can we really keep Ubuntu 16.04 in our list of supported<=
br>
&gt;&gt; distros?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Good question, I think we would not be able to keep testing the latest=
<br>
&gt; of 16.04 so perhaps it should be dropped.<br>
<br>
<br>
Then, if everyone agrees, let&#39;s drop the 16.04 workers, and use freed<b=
r>
CPU time for other tests.<br>
How to drop the 16.04 workers?<br>
Cheers<br>
Michael.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Probably the doc=
s list is not a wide enough audience to discuss the impact?</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2157): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2157" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2157</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87006018/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
87006018/924729</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002e6aea05d108f7d9--

