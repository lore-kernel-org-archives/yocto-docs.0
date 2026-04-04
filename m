Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DFDEEB577
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 15:58:48 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18987.1775318322112552943
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 08:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aGyLylmc;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d9b1c57a4cso2356607a34.3
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 08:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775318321; cv=none;
        d=google.com; s=arc-20240605;
        b=NPWjE19UVT+mdnmaJNN8RD/r7ocUuHa5omQrb/Nm1eDx8+onZly5h8XVu+YFBug12a
         lcR3cPTAFbaTTBvwmwpQdrj5Ndh+z0q3lfig4zTr7sWYlC/j8xWJQaaybgRCWQ4RtooC
         5bS7AxuGc6FYQiojDq6pSlnGIaPj7nx7gxjVmeQ4HzRZvh7Bp+fGhO0BipZ+8N/AHLnC
         Tr1zm6CdGQwGTdMUFgytIQlJvGS0hjMmWH8jMKrBSZSNhuy1RdqYnyBMXYSWAYYxRihS
         S6rcuRNYTkgQFNX1KyJ9KtM48ArGa0ex3mylxwsJ9P9CGn6Rw0t7feG8SL85EnWY8TSs
         1t5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x594+465ngMNG6s2B6esjpMa0t6dpVfOPvM9maYdNK8=;
        fh=gzmcFeIkORwNvcShKO/tM7Jfzun5wc4Ah+P2S/YLtf4=;
        b=Ept8BboNOTKjpolLdHNHu+/Wqq3NqVPdLhPCzFF6oZcdxgHbSMvnJyxcpP60CCTEwn
         78qx0yDSmBaKGSy6USg72AyxPA3mU6Zg9/w+hfi+Ef1lvl18zthHkAjRnodZ382GI0fO
         5XgadWUFeFRKLtgJgIOruUE7ubn9I8gD7iUm3hxkjgdBoGbGz9ulYpQ3/9Fm8f4w3DGG
         K3BLDc/HJdk/wRu+o+Q6cmB8kuPjRn+gEj3kd6TnkODKcEyLJsR/yLQZYW1VQjKoeBry
         xR5N05qqvVV0wbjdcPyO/LbQilCOyfVQlt0Y8dS1o6dDTztk3IYNiw2vo/xdJlzqhUol
         8p7w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775318321; x=1775923121; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x594+465ngMNG6s2B6esjpMa0t6dpVfOPvM9maYdNK8=;
        b=aGyLylmcu5bwUXexVDMhNc3oRKPx5tZC1GvKXy90XGdaJ/rlxZ4D0SmvEHcDIFWETN
         JmZkikP85cF9fovleBFR4og1w3GlcBccqMULunpazfODpEOoGV+r7oGC1Vn8rGqO7fFE
         pz+clmi0NazpMEaJ5kryalHC3BDvwQT+/LF6kke2waMMrSq4mW2YISeN8VdwUBe9QdPv
         wsaO/6NXJwyp5I2fQVfx3MiiyKqDKJE9kZW4CTm0pE5625x0hy6dubQMB0/UVy1TnSKx
         9kWh6mf+JVQHtvx/JQlmUgoNf+M2B5aI5Wb107Y6tyqNakBQn9700UdD4LeFOJTUpT29
         1hPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775318321; x=1775923121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x594+465ngMNG6s2B6esjpMa0t6dpVfOPvM9maYdNK8=;
        b=pJsBNP03C+B24eiDznVwyHwE7rPO9FSGe9xBsRcqmjPhNJfuSCYG+ptSAmYswxifmk
         2smb1+WZfThbr5+B/kSk5wjKVf8+aYikG/0djV80cAro3UZFxuIaa0epr6CJrsFcCKgP
         +eOxeEHXN8VQWKv0QWS0RD87QCDhTuLyOkp7UDajDBgT0fjc+IHnzLUSffJTSpTG8Mw2
         7TV5G9SL6U6fSYiuxep8gXZYvcZVv0He8PKGQI9Rab+B0lPBwnM02X7sHsCtUqs+R6IP
         LDSoOHfoTJzIfJ/8Xem04KSseCPttfue3ikQUNisOE/dT+SdlbB68KTBSwSvkV3sqiMo
         ygig==
X-Gm-Message-State: AOJu0YzTd/w+tyBjJOCdqHKHAda/zDDV88AMmdx4eMgyr8+OK9lDHeaL
	0yJFmQMcfLdB6FVikiznBtJrZIIJgJhThpBb2GeZ7MqI8m7F3CtG5+yUPAuxIgWIxSpttyxhHzr
	a3yh7ALMd8OFyUd7ed7u9YZR7LhaDGMc=
X-Gm-Gg: AeBDieuMV6OemrBDsAhuOd+qpAVhCYFkpZfdu9iJnfOW4YcHOta4/rTq+PtxVDKZ/ZD
	bG99UO+MMHeQNMKH2CKUr7yUnn7+fpWjGqE4V5MkVt+TW0DbGMrjrcRNc+bstq1geYpCgv5HHpu
	wN3PP4iLCFRpay60GhaW+VkuLy+8PE+b8kPMAnWrNmtkTmp9ALZY1XrnGlNEIorBwI0wxGqzsTj
	s0CFbvfV+PGvruwO6LZd1jjTh301ZyXipljexY6jbMzI7BPmlXTZ3QRMfcstffU/fvkoFZvQ8Tz
	kumyKA==
X-Received: by 2002:a05:6830:410a:b0:7d7:ef0a:1ce9 with SMTP id
 46e09a7af769-7dbb741d6e5mr4254549a34.14.1775318321291; Sat, 04 Apr 2026
 08:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
 <275547.1775288047872145943@lists.yoctoproject.org> <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
In-Reply-To: <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 4 Apr 2026 17:58:29 +0200
X-Gm-Features: AQROBzDP2_sxdHmdf_sWZ-va76Z0IQEesb_AJzHgw9vLyIbs1ZVx8Cc9QT0CtHs
Message-ID: <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000e766ef064ea48138"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 15:58:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9179

--000000000000e766ef064ea48138
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com> wrote=
:

> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it was.=
 It just leaves the mess
> as it is.
>
>
After Merriam-Webster:

Abort means to stop, cancel, or terminate a process, project, or mission
before its completion. It is often used to describe abandoning a dangerous
or flawed plan (e.g., "abort the mission") or ending a pregnancy
prematurely. It also refers to a technical stoppage in computing or
aerospace.

Synonyms for Abort:
Terminate/Stop: Halt, end, cease, discontinue, break off.
Cancel/Abandon: Scrub, scrap, call off, abandon.

'Abort' carries no notion of reverting the mess either.


> Alex
>
> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>
>> Personally I don't have any specific preference, but as a hint for you
>> guys: for a non-native English speaker (of a Slavic origin at least),
>> "abandon" would convey a practically identical sense to "abort" and woul=
d
>> be some sort of a compromise.
>>
>> Thanks,
>> Adam
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9177):
>> https://lists.yoctoproject.org/g/docs/message/9177
>> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
>> Group Owner: docs+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>>

--000000000000e766ef064ea48138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"a=
uto">=E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it w=
as. It just leaves the mess as it is.</div><div dir=3D"auto"><br></div></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">After Merriam-Webster:</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Abort means to stop, cancel, or terminate a process, project, or =
mission before its completion. It is often used to describe abandoning a da=
ngerous or flawed plan (e.g., &quot;abort the mission&quot;) or ending a pr=
egnancy prematurely. It also refers to a technical stoppage in computing or=
 aerospace.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Synony=
ms for Abort:</div><div dir=3D"auto">Terminate/Stop: Halt, end, cease, disc=
ontinue, break off.</div><div dir=3D"auto">Cancel/Abandon: Scrub, scrap, ca=
ll off, abandon.</div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">&#39;Abort&#39; carries no notion of reverting the mess ei=
ther.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"auto"></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 4. Apr 2026 at 9.34, Adam=
 Blank via <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" tar=
get=3D"_blank">lists.yoctoproject.org</a> &lt;adam.blank.g=3D<a href=3D"mai=
lto:gmail.com@lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">=
gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<div>Personally I don&#39;t have any specific preference, but as a hint for=
 you guys: for a non-native English speaker (of a Slavic origin at least), =
&quot;abandon&quot; would convey a practically identical sense to &quot;abo=
rt&quot; and would be some sort of a compromise.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<div>Adam</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9177): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9177" rel=3D"noreferrer noreferrer" target=3D"_blank">https://list=
s.yoctoproject.org/g/docs/message/9177</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118594590/168=
6489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/118594590/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" rel=3D"=
noreferrer" target=3D"_blank">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
docs/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"noreferrer=
" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br><br>
</blockquote></div></div>
</blockquote></div></div>
</div>

--000000000000e766ef064ea48138--

