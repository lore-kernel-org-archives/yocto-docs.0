Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F29CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 11:19:00 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.23046.1759231133574737800
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Sep 2025 04:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YZ3JOpVZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bhstalel@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4dffec0f14eso1819211cf.0
        for <docs@lists.yoctoproject.org>; Tue, 30 Sep 2025 04:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759231132; x=1759835932; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XWulUT7M19YFfNl/3+uqWJG4cUjIqaMwSYhNgvlUKBg=;
        b=YZ3JOpVZET1KE1CEKPWJUNk3Nv34d3qDJGw2ZkkvLysJ7X0RQF/8ssdDRUPovdQXQB
         DfX7W8w8jbaesHWby8If1+NjUgVB+iJPFbFYw2Q/dkoQ1POqj0xEdE3GH8oQLm4c/Lo0
         tH//zI1XI6MEyiSW6qnu6OQ7yh/j7cXjF3BQuRE8//BpDgbdkEsK14l3Z/s5HIOgBpM+
         PtfH18epFoPurzayAYsmrIYjNj//6v/YB7c4E7YIdCp/wLiIHgFkcar9m38F71ftE5PW
         ecPtIFunH1piS5qVsLs+/du557u6nHNSPxVd+dTGYWkEwqVALx262sqfI3AwAjjlvK/a
         WZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759231132; x=1759835932;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWulUT7M19YFfNl/3+uqWJG4cUjIqaMwSYhNgvlUKBg=;
        b=F+kBBc4zFD56XpsnPmmqp2dXOTTaxKuYSpzDKHdx5E8hq7h3AAVrrPQ42cGMEqlK0H
         5eZEW5t8HlqcENMmhOilt2KF8C7/Kkv9M/OHxj5pAqFNdUi6zHbilJqzidCyO0VMqNuu
         zIHXXG+Qgvx66HVdaIxY+8rytZH9GIDL6411LI8LNCX96LBcCBMYbH3/Q3XzZlcrz7Zg
         fPNeiAJzNGsMecp8BlYnlCB6B4S97ee7QB+/p6TKtqzpNNnZOi3rtdHuzh7DaWpErzlC
         zhZ1xG57A0ZUWx8Z0MkcWfJhsrVg0ByykpZM8XohTyaLdW4o3N4oVgQv/+EKuQu0bT7F
         K49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz1C+5fkmlvnBjBfSZBjoQAV8+WUHmydjEBWdXU4wkF4XMBmYUbl9pTF1PWVpWwSR3k+xe@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz5x7iInLfb/32Jbt4IS4BNXxyGyNPqGkhB+BGgQQyF1NUa3+xW
	luDK4mg+QS+jCvV562yuIgZevdIYYvc3MeI4ZU/GvWVRRsQX2BUqj/gNL3nDj8hEmtBUacMGfEB
	xgFrfRrJKTk/BOL0etf8EzsUyfAA/f4U=
X-Gm-Gg: ASbGnctJcx+odHICQqZ+K6805e0DIwUS16sK3IbWd12PHPBnhgIM387gYUfEbcDHbZw
	67Sb4TflzXILK/Xh6Z5qhDufpt+MLk9YJi3HJH5WukdBOYdj9/bX9/q35aMJcrAvUFfbLHI2iE/
	F0SyCHWYtdF3PHwjZ8sazb5OgF83Rgmr7MtJvuqTOYAshimvMuHsl2P0nLBw6dASIdkzBPwcE5H
	qpN2X3bvDmZrkLRitxJzJ7oM7pkbeh7DZBD3A7PDnLZiZDbHlUIfVoQ03wQ3irFr+7ZKlnMvukC
X-Google-Smtp-Source: AGHT+IEyeC5uHuKk5+z9i3IwvVTMkn6C+v4a5Hp+vc6y6ogPnJXKgFhTUbmm5HmeNeBft0MyepyATbe2VYYrpTP70EM=
X-Received: by 2002:a05:622a:289:b0:4b5:f4c0:60b with SMTP id
 d75a77b69052e-4da4bbe3625mr168830751cf.11.1759231132392; Tue, 30 Sep 2025
 04:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250921164306.53501-1-bhstalel@gmail.com> <20250921164306.53501-3-bhstalel@gmail.com>
 <DD1YBMXM5MUJ.2N2XDSIL5KN6P@bootlin.com> <d81a1245-ad48-49e2-ad01-111102059a54@gmail.com>
In-Reply-To: <d81a1245-ad48-49e2-ad01-111102059a54@gmail.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Tue, 30 Sep 2025 12:18:40 +0100
X-Gm-Features: AS18NWDbKF_TCtWJcYhuaGJf2Wtczmvi5lR72tUU4V4phiW9iNuqkS9sd2DDVo4
Message-ID: <CAOgG7m3FSG44kT_2j5kpMkShDwjjW60LoSABijLAGDQjibAQgg@mail.gmail.com>
Subject: Re: [docs][PATCH 2/2] ref-manual/classes.rst: add diagram for classes
 used by base.bbclass
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b9604e064002ea89"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 30 Sep 2025 11:19:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7629

--000000000000b9604e064002ea89
Content-Type: text/plain; charset="UTF-8"

Hello,

It seems that Inkspace really requires time to learn, it is not easy as
draw.io or other platforms.

I planned to add lot of diagrams as the documentation is really missing
diagrams.

I have to learn Inkscape then.

Thanks anyways for the review.
Kind regards
Talel

On Thu, 25 Sep 2025 at 19:00 Gyorgy Sarvari <skandigraun@gmail.com> wrote:

> On 9/25/25 16:29, Antonin Godard via lists.yoctoproject.org wrote:
> > On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via
> lists.yoctoproject.org wrote:
> > Hmm... if we really can't open that with Inkscape that's a problem from
> > maintenance :/ I tried opening it with inkscape and indeed, I can't edit
> the
> > text and so on. Maybe there's an option in draw.io for exporting for
> other
> > editors? Otherwise sadly we can't merge this, as we wouldn't be able to
> > maintain it easily.
> >
> >
> As a test, when exporting as svg from draw.io, try to uncheck all the
> "Embed foo" checkboxes - that usually produces a more SVG-like SVG
> (instead of embedding raster-graphics and similar shenanigans)
>

--000000000000b9604e064002ea89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>It seems that Inkspace really requires time to learn, it is not easy as <a=
 href=3D"http://draw.io">draw.io</a> or other platforms.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">I planned to add lot of diagrams as the do=
cumentation is really missing diagrams.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I have to learn Inkscape then.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks anyways for the review.</div><div dir=3D"auto=
">Kind regards</div><div dir=3D"auto">Talel</div><div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, 25 Sep 2025 at 19:00 Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gm=
ail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On =
9/25/25 16:29, Antonin Godard via <a href=3D"http://lists.yoctoproject.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; On Sun Sep 21, 2025 at 6:43 PM CEST, BELHADJ SALEM Talel via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a> wrote:<br>
&gt; Hmm... if we really can&#39;t open that with Inkscape that&#39;s a pro=
blem from<br>
&gt; maintenance :/ I tried opening it with inkscape and indeed, I can&#39;=
t edit the<br>
&gt; text and so on. Maybe there&#39;s an option in <a href=3D"http://draw.=
io" rel=3D"noreferrer" target=3D"_blank">draw.io</a> for exporting for othe=
r<br>
&gt; editors? Otherwise sadly we can&#39;t merge this, as we wouldn&#39;t b=
e able to<br>
&gt; maintain it easily.<br>
&gt;<br>
&gt;<br>
As a test, when exporting as svg from <a href=3D"http://draw.io" rel=3D"nor=
eferrer" target=3D"_blank">draw.io</a>, try to uncheck all the<br>
&quot;Embed foo&quot; checkboxes - that usually produces a more SVG-like SV=
G<br>
(instead of embedding raster-graphics and similar shenanigans)<br>
</blockquote></div></div>

--000000000000b9604e064002ea89--

