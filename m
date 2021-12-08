Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38F2C433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:20:18 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web08.3311.1639002018103893063
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Dec 2021 14:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZjIdqJzO;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id z26so4475947iod.10;
        Wed, 08 Dec 2021 14:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVfrCBvLcnJ65PQzpu4Mf3l074sgF1HZTWV1QT2Na/Q=;
        b=ZjIdqJzOLkn80FGti2KuJrMHOK6VguKezbLrC9zlM9gKfi/+ZVuFmU9rS8VRKy1mH1
         EnF10hqg7yeNOiJjKMVwF0ch0BrbN4XOHqyzBeXGMUmxCcvxYiNLfysPrr2q40notBoB
         Xek2yezdbu9HDxhW7KuihkXbqXclweNEGnixh8BWL5TVWq0unu8CC7OF3iBziaAPo5/v
         FUgpbHG9FRHnIGzzZQNVGo+e1781VAWvvR/v6LFQXwmm9SgXpeY1wZU+X+1nF/SxPjNf
         9YVRcWwTrNjXNqfFUNGKP3MtIQ2C1nKF6ttws2j5ivszFksf1AAJm1wEm+aZl+5zTAe6
         k1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVfrCBvLcnJ65PQzpu4Mf3l074sgF1HZTWV1QT2Na/Q=;
        b=XVafHOQjvwPxqYm/l/TI8FQCNuQ2F+SS+HLGj/tB7EbjbxSHXJMeXS6aAwLL/tsjD8
         E++SZ82MMLTDbaQwfUGcaUts6jFLvh4DjXW67hIqQSfM97MlLYq3CaAaGC1OkCDW+tNB
         tFhz9vQfawDpny4ETkTZ1d+vkz9+dOBME0+xjqaFmhN2oz8LyiX4kUQYWJ2rAN/VQdlH
         yicAmWOLqQuL3HxPe7NJz3txg88wybBx9qSxv3z8SBwO5AAeVZq1CqLdnl+kF+cEl40o
         AnzPFe+Xi21EllFi/tp9s571+pK0DS2sgzEs1tnTQghk3Qo4bIM6NpgimkHvzsy+RW3W
         KIzA==
X-Gm-Message-State: AOAM532gqUbcd80PAEz9My4xZyh7kNeew4pgE+YdJnqlUdBbQdukdmEN
	7BX5ujzz/ol559hPxYAfZqFmZ/IRsrfrFLQFfh4=
X-Google-Smtp-Source: 
 ABdhPJyV/5dzXkhCSxNXNo8/G1lAzdaMLQpA7XsD5bgeIid4QrQfK/fQsR8RjYraZsLqyPYuyp++yjlSePuh5qRCaJ0=
X-Received: by 2002:a05:6638:13c5:: with SMTP id
 i5mr3382896jaj.88.1639002017359;
 Wed, 08 Dec 2021 14:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20211201135949.193842-1-michael.opdenacker@bootlin.com>
 <20211203093452.sk3e6ksnwmsbnjn2@fedora>
 <CAP71WjwoVHYOvLSKkW+fSSO2T5MupA-vEt1_cDfwdMjy8ZhP0g@mail.gmail.com>
 <20211203100259.54n7h7ghlqfr5tia@fedora>
 <CAP71Wjxp04oP_YXX-em4OhRAvbjztATUEy9fozZ4+ves7NvVTw@mail.gmail.com>
 <20211203105151.3hez2atqxq3ye63h@fedora>
 <56b2a1f4-9a8e-11a7-1ced-b9cbba5eda53@bootlin.com>
 <CAP71WjxH8CObAABCQTdQN7YYUSww+w=a1BsF5hYCzVABLgH2Sg@mail.gmail.com>
In-Reply-To: 
 <CAP71WjxH8CObAABCQTdQN7YYUSww+w=a1BsF5hYCzVABLgH2Sg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 8 Dec 2021 14:20:06 -0800
Message-ID: 
 <CANx9H-BxecXcMQ8LgFO+HtYbtB7j+TBGCwKfYT89AdcFrVfMSA@mail.gmail.com>
Subject: Re: [docs] [PATCH yocto-autobuilder-helper] scripts/run-docs-build:
 stop using the "transition" branch
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 docs@lists.yoctoproject.org,
	yocto@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000007ed6505d2a9e502"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Dec 2021 22:20:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2238

--00000000000007ed6505d2a9e502
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 2:08 PM Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

>
>
> On Wed, Dec 8, 2021 at 10:57 PM Michael Opdenacker <
> michael.opdenacker@bootlin.com> wrote:
>
>> Quentin, Nico,
>>
>> On 12/3/21 11:51 AM, Quentin Schulz wrote:
>> >
>> > I think all our issues always come down to this weird and inefficient
>> > organization we have for docs and common files between doc releases.
>> > We'll need to settle on something one day because I don't think what
>> > we're doing today is working :/
>>
>>
>> Thanks for your reviews. Good to know that the "transition" branch is
>> still in use in spite of what I wrongly believed.
>> It indeed, it's a good idea to see what other projects are doing. Maybe
>> what we are doing is unnecessarily complicated.
>>
>> Look at Python docs (https://docs.python.org/) for example. They have a
>> switcher as we do, and also a left bar the latest versions and a
>> separate page for all versions. However, such versions are only shown on
>> the top page. When you enter one of the documents though for a given
>> version, the left bar is used for navigation between sections instead,
>> and you no longer have references to other versions.
>>
>
> docs.pythong.org is where we stole the idea of the switcher ;-)
> Would anyone be able to figure out if their 'publishing' script is
> available anywhere? if we could mimic that somehow that might be good.
>

Maybe?
https://github.com/python/docsbuild-scripts/

Found on
https://pythondev.readthedocs.io/infra.html

>
>
>>
>> Let's keep thinking about this, to find an easier to manage solution.
>> Thanks again
>> Michael.
>>
>> --
>> Michael Opdenacker, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2237):
> https://lists.yoctoproject.org/g/docs/message/2237
> Mute This Topic: https://lists.yoctoproject.org/mt/87428499/924729
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000007ed6505d2a9e502
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 8, 2021 at 2:08 PM Nicolas Dechesne &lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Dec 8, 2021 at 10:57 PM Michael Opdenacker &lt;<a href=3D"mailto:micha=
el.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)">Quentin, Nico,<br>
<br>
On 12/3/21 11:51 AM, Quentin Schulz wrote:<br>
&gt;<br>
&gt; I think all our issues always come down to this weird and inefficient<=
br>
&gt; organization we have for docs and common files between doc releases.<b=
r>
&gt; We&#39;ll need to settle on something one day because I don&#39;t thin=
k what<br>
&gt; we&#39;re doing today is working :/<br>
<br>
<br>
Thanks for your reviews. Good to know that the &quot;transition&quot; branc=
h is<br>
still in use in spite of what I wrongly believed.<br>
It indeed, it&#39;s a good idea to see what other projects are doing. Maybe=
<br>
what we are doing is unnecessarily complicated.<br>
<br>
Look at Python docs (<a href=3D"https://docs.python.org/" rel=3D"noreferrer=
" target=3D"_blank">https://docs.python.org/</a>) for example. They have a<=
br>
switcher as we do, and also a left bar the latest versions and a<br>
separate page for all versions. However, such versions are only shown on<br=
>
the top page. When you enter one of the documents though for a given<br>
version, the left bar is used for navigation between sections instead,<br>
and you no longer have references to other versions.<br></blockquote><div><=
br></div><div><a href=3D"http://docs.pythong.org" target=3D"_blank">docs.py=
thong.org</a> is where we stole the idea of the switcher ;-)=C2=A0</div><di=
v>Would anyone be able to figure out if their &#39;publishing&#39; script i=
s available anywhere? if we could mimic that somehow that might be good.=C2=
=A0</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Maybe?=C2=A0<div><a href=3D"https://github.com/python/docsbuild-script=
s/">https://github.com/python/docsbuild-scripts/</a></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Found on=C2=A0<div><a href=3D"https://pythonde=
v.readthedocs.io/infra.html">https://pythondev.readthedocs.io/infra.html</a=
></div></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><div dir=3D"auto"></div><div>=C2=A0<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">
<br>
Let&#39;s keep thinking about this, to find an easier to manage solution.<b=
r>
Thanks again<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#2237): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/2237" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproj=
ect.org/g/docs/message/2237</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/87428499/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
87428499/924729</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/docs/unsub<=
/a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail=
.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000007ed6505d2a9e502--

