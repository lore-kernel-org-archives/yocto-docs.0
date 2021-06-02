Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1089.1622654776058953539
 for <docs@lists.yoctoproject.org>;
 Wed, 02 Jun 2021 10:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ioKJ5063;
 spf=pass (domain: linaro.org, ip: 209.85.208.44, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f44.google.com with SMTP id o5so3864806edc.5
        for <docs@lists.yoctoproject.org>; Wed, 02 Jun 2021 10:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yEtIjynpnvsK/iR104quj1b2t1D8Mq8H+QXjhhm6DSc=;
        b=ioKJ50635qSPI9eXZ9aNSCM4Cz43plWjFsVa6HpJb26BIGcoXXbMyE6RBiHfMFSwvj
         bC8+e6pxA1AoMFtbNDVQFmGDYUO1D33TES0gJdvbLXo6W1i0n5KNeq3X5A4KXER8xvc0
         ha3J77zc5Z+CEpvsXTRkDLThYYpg/+RiJuiItIgJjEkb65vBY6beAdS9D/GJfQtFS5aF
         /AifA81gHW5ZU6GSa7ONIFdLABgQQWjh6pSDd+16yttL1kAH+AK5VNx5NVTuEizVuk7u
         +V5O1Sr0PX5pRsAV3t3COWyX/XvX3G69X7+3F9djOC774JkqYPF3hJ3hZCcXXE3qDaBw
         d7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yEtIjynpnvsK/iR104quj1b2t1D8Mq8H+QXjhhm6DSc=;
        b=HLfbxHR4IwFHlWr0gbUHsVR1edCysjziGfPX9vbq+551d/Oj1n3UOvE++lFgp8qVxI
         eZAhnfHeMc7yrKjeJ770/Esk8a0qPpqQuktJiJKvOKXpPHWiZPuNLXLwv3Qz3pbZTX2+
         KVkSlMEc0i8bLn5LZdqF7U7YnbY1dIJ5QkkzIz5Xfuk078fWtAkfwWB7RcHBU4E65+74
         bd61ChIwxMl0HDSjj0XSQ5KEuC0bkF8wo+9KBvLlUzCeFxBGzLGWRy1MEsOiGriFdZ8D
         MGxDwuChIH4NBQxXg4Aut4jnGiuPJhnTBlJJmGXHOnC5G60s73MCLvdeZoZt/vWLaM60
         lH2Q==
X-Gm-Message-State: AOAM530tb5A0EJBd9c9/+G3HgDnH67qqU/JdnxTj9mKIsDHfCLG1GZni
	tkSgJrvh+8JtmV3sJTdhBkGMm0KpM2wiQe8wuWn6xg==
X-Google-Smtp-Source: ABdhPJzXNcz+AJBuapcihbu20/0Tmw4/Nxt1YP1QH1A767E5v3FxzoEWefpQ0jxYmx96shqKdHmxF1wtakcCgxvf3G8=
X-Received: by 2002:a05:6402:3507:: with SMTP id b7mr39507673edd.101.1622654774177;
 Wed, 02 Jun 2021 10:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210527184117.80067-1-foss@0leil.net> <CAP71Wjy9rLUs3kF7k9jjK04p8K4qLbqvzKXRtOQiKhOctxffxw@mail.gmail.com>
 <707599b21e074097e0a8a89873354a8c@0leil.net> <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
In-Reply-To: <65a33804-8952-b322-3103-1a758920a0fe@bootlin.com>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Wed, 2 Jun 2021 19:26:03 +0200
Message-ID: <CAP71Wjy+_tu6VAdWOZAFqfYeE3UQgYDcufFw2LJwOY0NM6efUg@mail.gmail.com>
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Quentin Schulz <foss@0leil.net>, YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000068845d05c3cbc1cd"

--00000000000068845d05c3cbc1cd
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 2, 2021 at 4:50 PM Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Quentin, Nicolas,
>
> On 5/29/21 5:15 PM, Quentin Schulz wrote:
> >
> > It works without making it explicit where the term is defined and I
> > think it's what we want. Because if the term is only defined in
> > Bitbake, itll find it anyway so all good. And the day we decide to
> > "duplicate" the entry in the YP docs, it'll point to the one from YP,
> > no maintenance needed so really neat :)
> >
> > I can make separate patches if you want but I would not like to add
> > bitbake prefix.
> >
> > I've rewritten the script now and it's a bit smarter (no need to call
> > sphinx.ext.intersphinx module). If there's interest I can try to make
> > it even nicer and add it to the doc repo for future use since when
> > we'll document more variables, if they are already highlihted
> > somewhere else, it'll stay this way unless this script is run again.
>
>
> Nicolas, did you think about it? Quentin seems to be waiting for your
> feedback to send his v2 with the updated script.
>

Yes, I agree with last message from Quentin. He is right, we don't need to
prefix with bitbake.


>
> I'd vote for keeping the script in the repository for future use as you
> suggest, Quentin. You may copy it to ./tools/ or ./documentation/tools/
>

I think we tend to use ./scripts in a few other places, but it's a minor
detail.

Perhaps this script can be turned into a sphinx extension eventually, and
emit warnings ;)


> Thanks in advance,
>
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000068845d05c3cbc1cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 2, 2021 at 4:50 PM Michae=
l Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@bootlin.com">michael.=
opdenacker@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Quentin, Nicolas,<br>
<br>
On 5/29/21 5:15 PM, Quentin Schulz wrote:<br>
&gt;<br>
&gt; It works without making it explicit where the term is defined and I<br=
>
&gt; think it&#39;s what we want. Because if the term is only defined in<br=
>
&gt; Bitbake, itll find it anyway so all good. And the day we decide to<br>
&gt; &quot;duplicate&quot; the entry in the YP docs, it&#39;ll point to the=
 one from YP,<br>
&gt; no maintenance needed so really neat :)<br>
&gt;<br>
&gt; I can make separate patches if you want but I would not like to add<br=
>
&gt; bitbake prefix.<br>
&gt;<br>
&gt; I&#39;ve rewritten the script now and it&#39;s a bit smarter (no need =
to call<br>
&gt; sphinx.ext.intersphinx module). If there&#39;s interest I can try to m=
ake<br>
&gt; it even nicer and add it to the doc repo for future use since when<br>
&gt; we&#39;ll document more variables, if they are already highlihted<br>
&gt; somewhere else, it&#39;ll stay this way unless this script is run agai=
n.<br>
<br>
<br>
Nicolas, did you think about it? Quentin seems to be waiting for your<br>
feedback to send his v2 with the updated script.<br></blockquote><div><br><=
/div><div>Yes, I agree with last message from Quentin. He is right, we don&=
#39;t need to prefix with bitbake.=C2=A0</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
I&#39;d vote for keeping the script in the repository for future use as you=
<br>
suggest, Quentin. You may copy it to ./tools/ or ./documentation/tools/<br>=
</blockquote><div><br></div><div>I think we tend to use ./scripts in a few =
other places, but it&#39;s a minor detail.</div><div><br></div><div>Perhaps=
 this script can be turned into a sphinx extension eventually, and emit war=
nings ;)=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Thanks in advance,<br>
<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>

--00000000000068845d05c3cbc1cd--
