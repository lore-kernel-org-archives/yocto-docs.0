Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3EFE63FE3
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 16:25:38 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19431.1775319935074184598
 for <docs@lists.yoctoproject.org>;
 Sat, 04 Apr 2026 09:25:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HcjNfooV;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbd2a0211bso196701a34.0
        for <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 09:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775319934; cv=none;
        d=google.com; s=arc-20240605;
        b=I21/lmhT5ik1I28i19E0X+MIQx2TX4hDLlv46BmRAIrK2+g3Eg3piPiyLhoFZRTBdi
         c0PnK89nxEvdhy/Q4ihu90DjXjMFApRrAwyN1B9KqLCuFOrcANtnE2+FS5Lnwk1014dX
         4UtRvhttjocf3NmqhkfH9DBhae6IVhc4SuEd3FcqGjt1/qp+DErU81yRX9q7B/SZHA9B
         KOMahYiZAIlJ/3nWe1PNpJzFgn+y4J9MnfLxztOpA4aTNmb8bd3TXhPdVN+HqAX7bSHZ
         SoAZDVIhferE7zSX/NcoGn9MtsbQ5TK4G03nwCOpR6UrY48AzxKkXqNciCg5NzJQqmWE
         h2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnnKSbu6M3BCKWtZKIuiN0jvLOwre8C6zDcuZ/OFtbE=;
        fh=gzmcFeIkORwNvcShKO/tM7Jfzun5wc4Ah+P2S/YLtf4=;
        b=YFzfA1rvw9sntfnhMhGxc8p6qpYmqeN0tDtae46yn3vGbCsjFbJXVI+v03Pkhgv9/o
         qoRS2dhRbIUIZ0Bly9baFoxlRc62qygvbtPoOIpynuagc/qtaepc5tiT4Xjg/+dhpJEe
         ZrVv8Tm4aNpQUFwkJBtnaOys6V6e2Y1K0nBeOjV6nsVlV4WAv8vZqGm/FFWyFZtKg5Dm
         9E6ndrzPasB2dk8rvbllrXb815UScyeWrK2ojkq1Zsh4NHM7AMQwrHPM7lriKABxCueo
         Si5+YeL+ps5hajp3Ry0BS1PfiH/6hICetvFCg8tJCE0cyS472nFL9uZchby8gmNJGOLw
         g+Aw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775319934; x=1775924734; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnnKSbu6M3BCKWtZKIuiN0jvLOwre8C6zDcuZ/OFtbE=;
        b=HcjNfooVxGpekedxx1194L3AUCOU2bKzh5BtyztFAMBfHF8cWYNj/vaaYthzYbf8dH
         EX9cuL+a+ZccaBWpZT3jyGlBnoL2YvDiPg/6fO7jrQzZCq70q8Sh8gt7Zz/81qBp90RV
         kZ6aas8GLLEG9NzTZc30i5DIeefMekIKT7r35pGVIzpyDB8x3+Jw6hNO7QkznDxkN7ub
         UnNZn9RJSrFi3KopeLwI4eAM8Y7Q5PTmCWrzud0eNQQGkMpf9267GUv6WMswOdHK09cQ
         krKmJgIOQ3awZlico7bcXukYT0n8pguoxCBNR1LSxQ24gB6CWYutplppZj9z+o0GOP7N
         QFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775319934; x=1775924734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnnKSbu6M3BCKWtZKIuiN0jvLOwre8C6zDcuZ/OFtbE=;
        b=e0w9k5dtXMhZdVUHuJp6Zo9zBY99jgCLEbrqtY3HWYLUvcHa40fi8PvBFYoNYM4fQP
         WxcRiymmXpGqLSJup9hYOhwTdAgpJh6JHow2H8SjIZK10k9bTqXGi2DAMTcvDGBnWJkk
         NcEHWVYkODcdQhhdoQ/SPyXj7TI4vZPqSyLtUcdjC48N8RJUAiRkI1ZHAZP3/h9Xh01Q
         Q0gSh4iJB2xizIEUOz4W8eLhkGPXY/haZFghPg/a07J+0LzYtYCv3+ZHgTC6kHMtiK9W
         z9LJ59O8K1V/meW0yo6DBlZIczaBUzLBW8TuOBTyNKp5Hp12q7onsQJVMbin1ro3u7Pc
         c06A==
X-Gm-Message-State: AOJu0YxGaRAnTAqFE+Vw83HlBAAcB4DhSzIAffB2+hvgbfCYi83eSY4R
	+cc92UGUSyUh+RtzlDPyAKr1xLv8JVkiJxEgsf26AQW09gg/duROu2BHcewTtyW+qED0sDOUCvR
	cVJpKWRrghiIrSSTyuJlvvSZCVNcOPrs=
X-Gm-Gg: AeBDieuZTKkp7gfgHt1sqDBkPOA8/ENv+qozTDS+oYsyv3zg0Gg4VhN49Fl9Oo9w0Br
	njSaPp7Ppt1sbeN8jPQilza61b+l7AWXS9CtX4WIy9eK+gRYV5JTvwYloRqvKwjLU9gHtxjnBHK
	N6DZ/FeNaCOmP1xWr1bb/OEQuQMHohoGqGVqkd8uWPSch2Z8S6al9GeUMlFme6q2xRBXdhCl1Ro
	dEk664RfMhOSaujASyTZUbxDeLJ1rqilrq31JwF6V7LRqRvNplir5TF+bjRPucMLXAmi/zO7Uyn
	oHlmxw==
X-Received: by 2002:a05:6830:67e3:b0:7db:a832:b329 with SMTP id
 46e09a7af769-7dbb74e94aamr4012964a34.21.1775319934237; Sat, 04 Apr 2026
 09:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260331-docs-fixes-v1-0-45ee34341e72@bootlin.com>
 <20260331-docs-fixes-v1-1-45ee34341e72@bootlin.com> <6f743774-fe4b-4e9e-ba99-6ffe1d76a51b@cherry.de>
 <57bb4e5300a4be34f4cfddcf41d9a21b5b7bc579.camel@linuxfoundation.org>
 <CANNYZj9U3BYUv-cvQvmu7d=8O82Gdg-2GSon6vNJ71BMi6bKsg@mail.gmail.com>
 <DHJD5ZA0XGWN.3LDDWNE9PDM1X@bootlin.com> <CANNYZj8=z7U5jpCN+NaAmTspYduH=pcMohMcbnqGp8mQvmHoiA@mail.gmail.com>
 <ea91cc2bf0fcaeee1a152e62f0ebfd367b58b2fa.camel@linuxfoundation.org>
 <275547.1775288047872145943@lists.yoctoproject.org> <CANNYZj9dkJ_Bz-a_DLHB4SW5_tJCkHHd1Y_QJOQ6_8eZrmnMvg@mail.gmail.com>
 <CAFAffzw-TXoYgc5Xw4Ds1Mop9RO7ofN1zp92t-Uh7FtEp8PboQ@mail.gmail.com> <CANNYZj_wNAYurJcO1T2L6BbaaizGjgr3FHabrcpk4cAYN0UoAw@mail.gmail.com>
In-Reply-To: <CANNYZj_wNAYurJcO1T2L6BbaaizGjgr3FHabrcpk4cAYN0UoAw@mail.gmail.com>
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 4 Apr 2026 18:25:22 +0200
X-Gm-Features: AQROBzB6WXP0ObpGSHGZ5K3dOkj0tdIMRog6xC0PvneUOIiYHrBgXkVBS4b9Fgw
Message-ID: <CAFAffzwE_spyc=sg5KBmFv_o1NcZ1f94fQhTwhfkGCHAe5eCGw@mail.gmail.com>
Subject: Re: [bitbake-devel] [docs] [PATCH 1/2] bitbake-setup: rename "abort"
 rebase conflict stragegy to "halt"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: docs@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000b009b064ea4e22b"
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 04 Apr 2026 16:25:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9181

--0000000000000b009b064ea4e22b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That's a digest collected by Google's AI (formerly known as Google
Dictionary) from a number of dictionaries (it refers to Merriam-Webster,
Collins, Vocabulary.com and Cambridge Dictionary to name some). My
quotation came directly from it. I have verified that this link is not
personallised, so you also should be able to see what I see in it:

https://share.google/aimode/jeaW8oAhhQAOL4d0A

Thanks,
Adam

On Sat, 4 Apr 2026, 18:16 Alexander Kanavin, <alex.kanavin@gmail.com> wrote=
:

> Please include a link to any citations. Because this is not what it says:
> https://www.merriam-webster.com/dictionary/abort
>
>
> Alex
>
> On Sat 4. Apr 2026 at 17.58, Adam Blank <adam.blank.g@gmail.com> wrote:
>
>> On Sat, 4 Apr 2026, 17:34 Alexander Kanavin, <alex.kanavin@gmail.com>
>> wrote:
>>
>>> =E2=80=98Abandon=E2=80=99 doesn=E2=80=99t revert the state to how it wa=
s. It just leaves the
>>> mess as it is.
>>>
>>>
>> After Merriam-Webster:
>>
>> Abort means to stop, cancel, or terminate a process, project, or mission
>> before its completion. It is often used to describe abandoning a dangero=
us
>> or flawed plan (e.g., "abort the mission") or ending a pregnancy
>> prematurely. It also refers to a technical stoppage in computing or
>> aerospace.
>>
>> Synonyms for Abort:
>> Terminate/Stop: Halt, end, cease, discontinue, break off.
>> Cancel/Abandon: Scrub, scrap, call off, abandon.
>>
>> 'Abort' carries no notion of reverting the mess either.
>>
>>
>>> Alex
>>>
>>> On Sat 4. Apr 2026 at 9.34, Adam Blank via lists.yoctoproject.org
>>> <adam.blank.g=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>
>>>> Personally I don't have any specific preference, but as a hint for you
>>>> guys: for a non-native English speaker (of a Slavic origin at least),
>>>> "abandon" would convey a practically identical sense to "abort" and wo=
uld
>>>> be some sort of a compromise.
>>>>
>>>> Thanks,
>>>> Adam
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#9177):
>>>> https://lists.yoctoproject.org/g/docs/message/9177
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/118594590/1686489
>>>> Group Owner: docs+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
>>>> alex.kanavin@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>>>>

--0000000000000b009b064ea4e22b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail_def=
ault" style=3D"font-size:small">That&#39;s a digest collected by Google&#39=
;s AI (formerly known as Google Dictionary) from a number of dictionaries (=
it refers to Merriam-Webster, Collins, Vocabulary.com and Cambridge Diction=
ary to name some). My quotation came directly from it. I have verified that=
 this link is not personallised, so you also should be able to see what I s=
ee in it:</div><br></div><div dir=3D"auto"><a href=3D"https://share.google/=
aimode/jeaW8oAhhQAOL4d0A" target=3D"_blank">https://share.google/aimode/jea=
W8oAhhQAOL4d0A</a></div></div><div><br></div><div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Thanks,</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Adam</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, 4 Apr 2026, 18:16 Alexander Kanavi=
n, &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto">Please include a link to any citations. Bec=
ause this is not what it says:</div><div dir=3D"auto"><div style=3D"font-si=
ze:inherit" dir=3D"auto"><a href=3D"https://www.merriam-webster.com/diction=
ary/abort" style=3D"font-size:inherit" rel=3D"noreferrer" target=3D"_blank"=
>https://www.merriam-webster.com/dictionary/abort</a></div><div style=3D"fo=
nt-size:inherit" dir=3D"auto"><br></div></div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Sat 4. Apr 2026 at 17.58, Adam Blank &lt;<a hr=
ef=3D"mailto:adam.blank.g@gmail.com" rel=3D"noreferrer" target=3D"_blank">a=
dam.blank.g@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"auto"><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 4 Apr 2026, 17:34 Ale=
xander Kanavin, &lt;<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D"norefe=
rrer" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">=E2=80=98Ab=
andon=E2=80=99 doesn=E2=80=99t revert the state to how it was. It just leav=
es the mess as it is.</div><div dir=3D"auto"><br></div></blockquote><div><b=
r></div><div><div style=3D"font-size:small">After Merriam-Webster:</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Abort means to stop, cancel, or =
terminate a process, project, or mission before its completion. It is often=
 used to describe abandoning a dangerous or flawed plan (e.g., &quot;abort =
the mission&quot;) or ending a pregnancy prematurely. It also refers to a t=
echnical stoppage in computing or aerospace.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Synonyms for Abort:</div><div dir=3D"auto">Termi=
nate/Stop: Halt, end, cease, discontinue, break off.</div><div dir=3D"auto"=
>Cancel/Abandon: Scrub, scrap, call off, abandon.</div><br></div><div><div =
style=3D"font-size:small">&#39;Abort&#39; carries no notion of reverting th=
e mess either.</div></div></div></div></div><div dir=3D"ltr"><div dir=3D"au=
to"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"auto"></div><div dir=3D"auto">Alex</div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat 4. Apr 2026 at 9.34, Adam Blank via <a href=3D"http://lists.yoctoproj=
ect.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.yoctoproject=
.org</a> &lt;adam.blank.g=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.=
org" rel=3D"noreferrer noreferrer" target=3D"_blank">gmail.com@lists.yoctop=
roject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div>Personally I don&#39;t have any specific preference, but as=
 a hint for you guys: for a non-native English speaker (of a Slavic origin =
at least), &quot;abandon&quot; would convey a practically identical sense t=
o &quot;abort&quot; and would be some sort of a compromise.</div>
<div>=C2=A0</div>
<div>Thanks,</div>
<div>Adam</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9177): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/9177" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">h=
ttps://lists.yoctoproject.org/g/docs/message/9177</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118594590/168=
6489" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.yoctoproject.org/mt/118594590/1686489</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" rel=3D"=
noreferrer noreferrer" target=3D"_blank">docs+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/g/docs/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" rel=3D=
"noreferrer noreferrer" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br><br>
</blockquote></div></div>
</blockquote></div></div>
</div>
</blockquote></div></div>
</blockquote></div>
</div>

--0000000000000b009b064ea4e22b--

