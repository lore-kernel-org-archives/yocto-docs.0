Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5EDC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 09:49:53 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.9926.1638524992304781547
 for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 01:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lcWde3Fi;
 spf=pass (domain: linaro.org, ip: 209.85.208.43,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f43.google.com with SMTP id v1so9284153edx.2
        for <docs@lists.yoctoproject.org>;
 Fri, 03 Dec 2021 01:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtKfM3xwRCKyQYl9U9RAeISF+ufDaYU813YtyXmwBk8=;
        b=lcWde3FiYMHAGOjG8BQyfQgdh/aBWSpJ4MmoBcZEp8QmjpSqsKZYmSfmz/RijMQkt7
         KPgA0wzhWLaPi2Rw81JGWk8IqN8ougShLP82NPji98yXw3WQPsr9/anxNL0e7ntEbiCB
         TUkIffU91EX94XfshPDt+EtBKM2qeGk7NCeP7+xmYaCUCCjUlnE/kEGR8seQPXq09B6o
         oTwbsz2EKW8oIVrIrhGjbfXvRpjCNsICehZn5fzzZ2e1U7KhJFnzFKQTlUJX7AJn3UV3
         j3qVV+9hRUbZriwXnUUw3kwRfsSzOhbRPgCJGiIakh1RhLMg4Z6Lpb6Cc5j/kJ57Z/r5
         bbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtKfM3xwRCKyQYl9U9RAeISF+ufDaYU813YtyXmwBk8=;
        b=Iyu1WCpEkEAXi7/jMTHEveB9DYUGx4rnJxOsnuku5H2DskX/mw9zjC3v1N2gOTjCmM
         ku085ZmwgSbtgjA/Irejeq5VehbMWw7+utcX9iWcl780YO6yx5lzQpBp/Si9qexNfHb3
         ZEZLNQGw2x1aduc89J9NNJVG73p4923F1NzcBFT8kseioZDyjwjdUA4mnrX2yiOsHIuD
         1SJVhaWqB8cIa1z22zqazb/CrEVj3Kr+FcKUc8HHV+WR5d72YoU6GkOlKB1sZWH/Muj6
         e5zV4E5MaOwkuG5YjOqdHC0Akg3zC3agqKP8I2H92N30HGI6b8Cwe2zAFA/7+V3NPGUM
         rdjg==
X-Gm-Message-State: AOAM531P0GUVNOzToBjpopgTB0Q4z8gklBf3PRAnMtO8BcVOQNz3nTYh
	MkO3AvEb/ckuGJTkzePyrK8N8ZlG/oV7cw784izKAw==
X-Google-Smtp-Source: 
 ABdhPJxKyyVYMwHVgoAvA/kN0L2w5c+9fNuwYdEPgLv4ommTW9QxiFY85OoPPN8VtHERkvUsGl89cdMdtOGIqAQtXZk=
X-Received: by 2002:a17:907:6d07:: with SMTP id
 sa7mr22633609ejc.339.1638524990650;
 Fri, 03 Dec 2021 01:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
In-Reply-To: <20211203093452.sk3e6ksnwmsbnjn2@fedora>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 3 Dec 2021 10:49:40 +0100
Message-ID: 
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
 yocto@lists.yoctoproject.org,
	docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000613e805d23ad4b6"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 03 Dec 2021 09:49:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2216

--0000000000000613e805d23ad4b6
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 3, 2021 at 10:34 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> On Wed, Dec 01, 2021 at 02:59:49PM +0100, Michael Opdenacker wrote:
> > No longer necessary now that the transition from DocBook to Sphinx is
> over
> >
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
>

I don't understand. With this change, we no longer build the pages we
reference here:
https://docs.yoctoproject.org/releases.html#outdated-release-manuals

Or am I missing here?


>
> Thanks,
> Quentin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2215):
> https://lists.yoctoproject.org/g/docs/message/2215
> Mute This Topic: https://lists.yoctoproject.org/mt/87428499/1279857
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000613e805d23ad4b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 3, 2021 at 10:34 AM Quent=
in Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quent=
in.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Dec 01, 2021 at 02:59:49PM +0100, =
Michael Opdenacker wrote:<br>
&gt; No longer necessary now that the transition from DocBook to Sphinx is =
over<br>
&gt; <br>
&gt; Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdena=
cker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<=
br>
<br>
Reviewed-by: Quentin Schulz &lt;<a href=3D"mailto:foss%2Byocto@0leil.net" t=
arget=3D"_blank">foss+yocto@0leil.net</a>&gt;<br></blockquote><div><br></di=
v><div>I don&#39;t understand. With this change, we no longer build the pag=
es we reference here:</div><div><a href=3D"https://docs.yoctoproject.org/re=
leases.html#outdated-release-manuals">https://docs.yoctoproject.org/release=
s.html#outdated-release-manuals</a></div><div><br></div><div>Or am I missin=
g here?=C2=A0</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Thanks,<br>
Quentin<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2215): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2215" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2215</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87428499/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/87428499/1279857</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicol=
as.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000613e805d23ad4b6--

